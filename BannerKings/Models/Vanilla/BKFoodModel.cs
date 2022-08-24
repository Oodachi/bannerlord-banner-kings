﻿using BannerKings.Managers.Populations;
using TaleWorlds.CampaignSystem;
using TaleWorlds.CampaignSystem.CharacterDevelopment;
using TaleWorlds.CampaignSystem.ComponentInterfaces;
using TaleWorlds.CampaignSystem.GameComponents;
using TaleWorlds.CampaignSystem.Issues;
using TaleWorlds.CampaignSystem.Settlements;
using TaleWorlds.CampaignSystem.Settlements.Buildings;
using TaleWorlds.Core;
using TaleWorlds.Library;
using TaleWorlds.Localization;
using static BannerKings.Managers.PopulationManager;

namespace BannerKings.Models.Vanilla
{
    internal class BKFoodModel : SettlementFoodModel
    {
        private static readonly float NOBLE_FOOD = -0.1f;
        private static readonly float CRAFTSMEN_FOOD = -0.05f;
        private static readonly float SERF_FOOD = 0.03f;

        public override int FoodStocksUpperLimit => 500;
        public override int NumberOfProsperityToEatOneFood => 40;
        public override int NumberOfMenOnGarrisonToEatOneFood => 20;
        public override int CastleFoodStockUpperLimitBonus => 150;

        public override ExplainedNumber CalculateTownFoodStocksChange(Town town, bool includeMarketStocks = true,
            bool includeDescriptions = false)
        {
            if (BannerKingsConfig.Instance.PopulationManager != null &&
                BannerKingsConfig.Instance.PopulationManager.IsSettlementPopulated(town.Settlement))
            {
                return CalculateTownFoodChangeInternal(town, includeDescriptions);
            }

            return new DefaultSettlementFoodModel().CalculateTownFoodStocksChange(town, includeDescriptions);
        }

        public ExplainedNumber CalculateTownFoodChangeInternal(Town town, bool includeDescriptions)
        {
            //InformationManager.DisplayMessage(new InformationMessage("Food model running..."));
            var result = new ExplainedNumber(0f, includeDescriptions);

            // ------- Pops / Prosperity consumption ---------
            var data = BannerKingsConfig.Instance.PopulationManager.GetPopData(town.Settlement);

            result.Add(GetPopulationFoodConsumption(data).ResultNumber, new TextObject("{=!}Population Consumption"));
            result.Add(GetPopulationFoodProduction(data, town).ResultNumber, new TextObject("{=!}Population Production"));

            //float prosperityImpact = -town.Owner.Settlement.Prosperity / (town.IsCastle ? 400f : 120f);
            //result.Add(prosperityImpact, new TextObject("Prosperity effect"), null);

            var garrisonParty = town.GarrisonParty;
            var garrisonConsumption = garrisonParty != null ? garrisonParty.Party.NumberOfAllMembers : 0;
            result.Add(-garrisonConsumption / NumberOfMenOnGarrisonToEatOneFood, new TextObject("Garrison consumption"));

            var prisoners = town.Settlement.Party.NumberOfPrisoners;
            result.Add(-prisoners / (NumberOfMenOnGarrisonToEatOneFood * 2), new TextObject("Prisoner rations"));

            if (BannerKingsConfig.Instance.PolicyManager.IsDecisionEnacted(town.Settlement, "decision_militia_encourage"))
            {
                result.AddFactor(-0.25f, new TextObject("Conscription policy"));
            }

            if (town.Governor != null)
            {
                if (town.IsUnderSiege)
                {
                    if (town.Governor.GetPerkValue(DefaultPerks.Steward.Gourmet))
                    {
                        result.AddFactor(DefaultPerks.Steward.Gourmet.SecondaryBonus, DefaultPerks.Steward.Gourmet.Name);
                    }

                    if (town.Governor.GetPerkValue(DefaultPerks.Medicine.TriageTent))
                    {
                        result.AddFactor(DefaultPerks.Medicine.TriageTent.SecondaryBonus,
                            DefaultPerks.Medicine.TriageTent.Name);
                    }
                }

                if (town.Governor.GetPerkValue(DefaultPerks.Steward.MasterOfWarcraft))
                {
                    result.AddFactor(DefaultPerks.Steward.MasterOfWarcraft.SecondaryBonus,
                        DefaultPerks.Steward.MasterOfWarcraft.Name);
                }
            }

            // ------- Other factors ---------
            var ownerClan = town.Settlement.OwnerClan;
            if (ownerClan?.Kingdom != null &&
                town.Settlement.OwnerClan.Kingdom.ActivePolicies.Contains(DefaultPolicies.HuntingRights))
            {
                result.Add(2f, DefaultPolicies.HuntingRights.Name);
            }

            if (town.Governor != null && town.Governor.GetPerkValue(DefaultPerks.Roguery.DirtyFighting))
            {
                result.Add(DefaultPerks.Roguery.DirtyFighting.SecondaryBonus, DefaultPerks.Roguery.DirtyFighting.Name);
            }

            var marketConsumption = 0;
            foreach (var sellLog in town.SoldItems)
            {
                if (sellLog.Category.Properties == ItemCategory.Property.BonusToFoodStores)
                {
                    marketConsumption += sellLog.Number;
                }
            }

            result.Add(marketConsumption, new TextObject("{=!}Market consumption"));

            GetSettlementFoodChangeDueToIssues(town, ref result);
            return result;
        }

        public int GetFoodEstimate(Settlement settlement, int maxStocks)
        {
            var data = BannerKingsConfig.Instance.PopulationManager.GetPopData(settlement);
            var result = GetPopulationFoodConsumption(data);
            var finalResult = (int) (maxStocks / (result.ResultNumber * -1f));
            return finalResult;
        }

        public ExplainedNumber GetPopulationFoodConsumption(PopulationData data)
        {
            var result = new ExplainedNumber();
            result.LimitMin(-1500f);
            result.LimitMax(0f);
            var citySerfs = data.GetTypeCount(PopType.Serfs);
            if (citySerfs > 0)
            {
                var serfConsumption = citySerfs * SERF_FOOD * -1f;
                result.Add(serfConsumption, new TextObject("Serfs consumption"));
            }

            var citySlaves = data.GetTypeCount(PopType.Slaves);
            if (citySlaves > 0)
            {
                var slaveConsumption = citySlaves * SERF_FOOD * -0.5f;
                result.Add(slaveConsumption, new TextObject("Slaves consumption"));
            }

            var cityNobles = data.GetTypeCount(PopType.Nobles);
            if (cityNobles > 0)
            {
                var nobleConsumption = cityNobles * NOBLE_FOOD;
                result.Add(nobleConsumption, new TextObject("Nobles consumption"));
            }

            var cityCraftsmen = data.GetTypeCount(PopType.Craftsmen);
            if (cityCraftsmen > 0)
            {
                var craftsmenConsumption = cityCraftsmen * CRAFTSMEN_FOOD;
                result.Add(craftsmenConsumption, new TextObject("Craftsmen consumption"));
            }


            if (BannerKingsConfig.Instance.PolicyManager.IsDecisionEnacted(data.Settlement, "decision_ration"))
            {
                result.AddFactor(-0.4f, new TextObject("{=!}Enforce rations decision"));
            }

            if (data.Settlement.IsCastle)
            {
                result.AddFactor(-0.1f, new TextObject("{=!}Castle rations"));
            }

            return result;
        }

        public ExplainedNumber GetPopulationFoodProduction(PopulationData data, Town town)
        {
            var result = new ExplainedNumber();
            result.LimitMin(0f);
            result.LimitMax(1500f);
            if (!town.IsUnderSiege)
            {
                var landData = data.LandData;
                result.Add(landData.Farmland * landData.GetAcreOutput("farmland"), new TextObject("{=!}Farmlands"));
                result.Add(landData.Pastureland * landData.GetAcreOutput("pasture"), new TextObject("{=!}Pasturelands"));
                result.Add(landData.Woodland * landData.GetAcreOutput("wood"), new TextObject("{=!}Woodlands"));
                var fertility = landData.Fertility - 1f;
                if (fertility != 0f)
                {
                    var toDeduce = result.ResultNumber * fertility;
                    result.Add(toDeduce, new TextObject("{=!}Fertility"));
                }

                var saturation = MBMath.ClampFloat(landData.WorkforceSaturation, 0f, 1f) - 1f;
                if (saturation != 0f)
                {
                    var toDeduce = result.ResultNumber * saturation;
                    result.Add(toDeduce, new TextObject("{=!}Workforce Saturation"));
                }

                float season = CampaignTime.Now.GetSeasonOfYear;
                switch (season)
                {
                    case 3f:
                        result.AddFactor(-0.2f, GameTexts.FindText("str_date_format_" + season));
                        break;
                    case 1f:
                        result.AddFactor(0.05f, GameTexts.FindText("str_date_format_" + season));
                        break;
                }

                Building b = null;
                foreach (var building in town.Buildings)
                {
                    if (building.BuildingType == DefaultBuildingTypes.CastleGardens ||
                        building.BuildingType == DefaultBuildingTypes.SettlementWorkshop)
                    {
                        b = building;
                        break;
                    }
                }

                if (b is {CurrentLevel: > 0})
                {
                    result.AddFactor(MathF.Round(b.CurrentLevel * (town.IsCastle ? 0.5f : 0.3f)), b.Name);
                }
            }

            return result;
        }

        private static void GetSettlementFoodChangeDueToIssues(Town town, ref ExplainedNumber explainedNumber)
        {
            Campaign.Current.Models.IssueModel.GetIssueEffectsOfSettlement(DefaultIssueEffects.SettlementFood,
                town.Settlement, ref explainedNumber);
        }
    }
}