<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="Culture[@id='empire']/clan_names">
        <clan_names>
		  <name name="阿卡帕诺斯" />
		  <name name="安加里斯" />
		  <name name="巴拉斯迪索" />
		  <name name="科斯塔西斯" />
		  <name name="德利科斯" />
		  <name name="伊利索斯" />
		  <name name="格西奥斯" />
		  <name name="哈洛斯" />
		  <name name="莱斯塔罗斯" />
		  <name name="梅昂涅斯" />
		  <name name="那撒尼斯" />
		  <name name="奥普涅斯" />
		  <name name="帕尔托斯" />
		  <name name="菲尼戈斯" />
		  <name name="斯托卡涅斯" />
		  <name name="苏梅索斯" />
		  <name name="特里科斯" />
		  <name name="泽巴莱斯" />
		  <name name="图鲁利奥斯" />
		  <name name="塔奎诺斯" />
		  <name name="维托雷斯" />
		  <name name="佐西姆斯" />
		  <name name="维塞尔泽斯" />
		  <name name="赛普塔梅斯" />
		  <name name="尼菲奥斯" />
		  <name name="马卡拉斯" />
		  <name name="凯尔斯" />
		  <name name="菲那里斯" />
		  <name name="塞拉内泽斯" />
		  <name name="西尔维安斯" />
		  <name name="帕托斯" />
		  <name name="帕内塞泽斯" />
		  <name name="科尔迪奥斯" />
		  <name name="科索斯" />
		  <name name="塞普尔修斯" />
		  <name name="奥索尼奥斯" />
		  <name name="科利诺斯" />
		  <name name="阿尼恩西斯" />
		  <name name="维林斯" />
		  <name name="沃图罗斯" />
		  <name name="斯卡普特斯" />
		  <name name="罗米利斯" />
		  <name name="阿米茨" />
		  <name name="拉加贝斯" />
		  <name name="齐米斯克斯" />
		  <name name="福卡" />
		  <name name="格莱卡斯" />
		  <name name="凯拉里奥斯" />
		  <name name="斯陶里奇斯" />
		  <name name="瓦塔泽斯" />
		  <name name="齐米塞斯" />
		  <name name="拉斯卡里斯" />
		  <name name="巴尔达内斯" />
		  <name name="佐纳拉斯" />
		  <name name="杜卡斯" />
		  <name name="梅尼埃科斯" />
		  <name name="勒卡佩纳斯" />
		  <name name="朗加贝斯" />
		  <name name="劳尼科斯" />
		  <name name="维塔利亚诺斯" />
		  <name name="阿利普斯" />
		  <name name="巴西雷斯" />
        </clan_names>
    </xsl:template>
	
	<xsl:template match="Culture[@id='aserai']/clan_names">
        <clan_names>
		  <name name="巴努·阿斯卡" />
		  <name name="巴努·达明" />
		  <name name="巴努·法苏斯" />
		  <name name="巴努·朱鲁尔" />
		  <name name="巴努·金延" />
		  <name name="巴努·莱赫" />
		  <name name="巴努·穆沙拉" />
		  <name name="巴努·尼尔" />
		  <name name="巴努·塔鲁克" />
		  <name name="巴努·亚塔什" />
		  <name name="巴努·祖丝" />
		  <name name="巴努·纳迪尔" />
		  <name name="巴努·盖努卡" />
		  <name name="巴努·巴克尔" />
		  <name name="巴努·塔米姆" />
		  <name name="巴努·加塔梵" />
		  <name name="巴努·哈瓦津" />
		  <name name="巴努·阿卜杜勒" />
		  <name name="巴努·盖伊丝" />
		  <name name="巴努·马德希吉" />
		  <name name="巴努·金安纳" />
		  <name name="巴努·马利克" />
		  <name name="巴努·拉姆" />
		  <name name="巴努·基拉布" />
		  <name name="巴努·哈桑" />
		  <name name="巴努·阿里" />
		  <name name="巴努·沙玛尔" />
		  <name name="巴努·穆泰尔" />
		  <name name="巴努·杜拉吉" />
        </clan_names>
    </xsl:template>
	
	<xsl:template match="Culture[@id='sturgia']/clan_names">
        <clan_names>
		  <name name="阿斯拉洛夫" />
		  <name name="博拉诺文" />
		  <name name="福廖罗文" />
		  <name name="詹迪罗文" />
		  <name name="伊斯卡诺文" />
		  <name name="马雷戈文" />
		  <name name="苏拉托文" />
		  <name name="维沙文" />
		  <name name="叶乔文" />
		  <name name="扎诺文" />
		  <name name="达赫洛夫" />
		  <name name="沃尔科夫" />
		  <name name="克里斯科夫" />
		  <name name="洛夫托文" />
		  <name name="泽连科文" />
		  <name name="克罗戈文" />
		  <name name="杜尔诺夫" />
		  <name name="沃洛夫" />
		  <name name="布拉科文" />
		  <name name="法尔科文" />
		  <name name="伊万诺夫" />
		  <name name="卡尔萨诺夫" />
		  <name name="林多文" />
		  <name name="马林科夫" />
		  <name name="斯特多文" />
		  <name name="米特文" />
		  <name name="诺克托文" />
		  <name name="佩托文" />
		  <name name="库拉文" />
		  <name name="里瓦切夫" />
		  <name name="内拉文" />
		  <name name="雷多科夫" />
		  <name name="伊斯米洛文" />
		  <name name="马泽罗文" />
		  <name name="梅钦文" />
		  <name name="哈里索夫" />
		  <name name="德鲁理文" />
		  <name name="鲁迪诺夫" />
		  <name name="梅里加文" />
		  <name name="卡维洛夫" />
		  <name name="加斯蒂亚文" />
		  <name name="苏尔多诺文" />
		  <name name="赫鲁索夫" />
		  <name name="特罗戈文" />
		  <name name="门奇诺夫" />
		  <name name="弗拉多夫" />
        </clan_names>
    </xsl:template>
	
	<xsl:template match="Culture[@id='vlandia']/clan_names">
        <clan_names>
		  <name name="戴·苏诺尔" />
		  <name name="戴·哈林戈特" />
		  <name name="戴·凯利丹" />
		  <name name="戴·林迪亚尔" />
		  <name name="戴·里贝莱特" />
		  <name name="戴·特瓦林" />
		  <name name="戴·蒂尔博" />
		  <name name="戴·阿兹甘德" />
		  <name name="戴·巴兰里" />
		  <name name="戴·伯格兰多" />
		  <name name="戴·埃勒达" />
		  <name name="戴·埃米林德" />
		  <name name="戴·吉西姆" />
		  <name name="戴·伊比兰" />
		  <name name="戴·诺马尔" />
		  <name name="戴·鲁伦德" />
		  <name name="戴·托斯达尔" />
		  <name name="戴·维达尔" />
		  <name name="戴·亚里本" />
		  <name name="戴·亚拉加尔" />
		  <name name="戴·阿梅尔" />
		  <name name="戴·库尔玛" />
		  <name name="戴·埃尔伯奥" />
		  <name name="戴·埃尔盖隆德" />
		  <name name="戴·杜马尔" />
		  <name name="戴·塞琳迪尔" />
		  <name name="戴·埃特罗斯" />
		  <name name="戴·维卢坎德" />
		  <name name="戴·埃特洛克" />
		  <name name="戴·沃兰德" />		
		  <name name="戴·罗德恩" />		
		  <name name="戴·伊尔贝斯" />		  
		  <name name="戴·图沃伦" />	
		  <name name="戴·哈伦德" />	
		  <name name="戴·诺里甘德" />	
		  <name name="戴·伊韦里尔" />
		  <name name="戴·马雷文" />	
		  <name name="戴·林达" />		 
		  <name name="戴·德拉穆格" />	
		  <name name="戴·雷因迪" />		  
		  <name name="戴·伊贝德勒斯" />		  
		  <name name="戴·伊斯蒂尼尔" />		  
		  <name name="戴·帕贡杜尔" />		  
		  <name name="戴·库伦德" />		  
		  <name name="戴·鲁尔迪" />		  
		  <name name="戴·塔萨梅什" />		  
		  <name name="戴·梅钦" />		  
		  <name name="戴·罗德兰德" />		  
		  <name name="戴·文登" />		  
		  <name name="戴·海因兰德" />		  
		  <name name="戴·阿伯兰" />		  
		  <name name="戴·伯登" />		  
		  <name name="戴·洛瓦尔" />		  
		  <name name="戴·马拉斯" />		
		  <name name="戴·杜塞" />		
		  <name name="戴·哈蒙德" />		
		  <name name="戴·瓦切尔" />		
		  <name name="戴·维奥蒙特" />		
		  <name name="戴·贝拉米" />		
		  <name name="戴·沃伊尔" />		
		  <name name="戴·韦利" />		
		  <name name="戴·瑞林" />		
		  <name name="戴·蒙卢克" />		
		  <name name="戴·科恩" />		
		  <name name="戴·博伊文德" />		
		  <name name="戴·普切特" />		
		  <name name="戴·勒费夫布雷" />		
		  <name name="戴·霍贝特" />		
		  <name name="戴·沃伦德" />		
		  <name name="戴·佩恩" />		
		  <name name="戴·查隆德" />		
		  <name name="戴·科列文" />	
		  <name name="戴·泽沃尔" />	
		  <name name="戴·杜切特" />	
		  <name name="戴·帕隆德" />
        </clan_names>
    </xsl:template>
	
	<xsl:template match="Culture[@id='battania']/clan_names">
        <clan_names>
		  <name name="芬·格温" />
		  <name name="芬·维亚兰努斯" />
		  <name name="芬·戈查尔" />
		  <name name="芬·格鲁登" />
		  <name name="芬·基林恩" />
		  <name name="芬·克里恩温" />
		  <name name="芬·奥拉多格" />
		  <name name="芬·路温" />
		  <name name="芬·库兰" />
		  <name name="芬·伊夫迪文" />
		  <name name="芬·艾特罗格" />
		  <name name="芬·费斯雷特" />
		  <name name="芬·艾琳" />
		  <name name="芬·奥兰" />
		  <name name="芬·伊里格" />
		  <name name="芬·库雷温" />
		  <name name="芬·阿勒拉尔" />
		  <name name="芬·伊夫拉格" />
		  <name name="芬·克特拉海格" />
		  <name name="芬·卢兰" />
		  <name name="芬·吉斯温" />
		  <name name="芬·代斯费格" />
		  <name name="芬·伊尔瓦格" />
		  <name name="芬·库多洛格" />
		  <name name="芬·菲思温" />
		  <name name="芬·艾尔图斯" />
		  <name name="芬·布拉查尔" />
		  <name name="芬·克鲁萨克" />
		  <name name="芬·多莫斯" />
		  <name name="芬·伊拉格" />
		  <name name="芬·菲亚坎" />
		  <name name="芬·洛恩" />
		  <name name="芬·莫兰" />
		  <name name="芬·西内尔" />
		  <name name="芬·图伊尔" />
		  <name name="芬·阿斯盖尔" />
		  <name name="芬·塞廷" />
		  <name name="芬·莱金" />
		  <name name="芬·雷米库斯" />
		  <name name="芬·奥多蒂" />
		  <name name="芬·勒塞尔" />
		  <name name="芬·阿杜吉乌斯" />
		  <name name="芬·西兰" />
		  <name name="芬·安巴杜斯" />
		  <name name="芬·维拉托" />
        </clan_names>
    </xsl:template>
	
	<xsl:template match="Culture[@id='khuzait']/clan_names">
        <clan_names>
		  <name name="艾利特" />
		  <name name="奥杜思尼特" />
		  <name name="博契特" />
		  <name name="喳瑞特" />
		  <name name="因契特" />
		  <name name="马兰吉特" />
		  <name name="奥拉纳里特" />
		  <name name="苏尼特" />
		  <name name="托基特" />
		  <name name="乌布思特" />
		  <name name="尤吉特" />
		  <name name="阿尔吉特" />
		  <name name="钦察基特" />
		  <name name="塔利特" />
		  <name name="阿卢赛特" />
		  <name name="尤尔基特" />
		  <name name="巴基尼特" />
		  <name name="贝尔古尼特" />
		  <name name="梅尔基特" />
		  <name name="萨哈伊特" />
		  <name name="挞尔赛特" />
		  <name name="卡达基特" />  
		  <name name="桑达吉特" />
		  <name name="泰尔比特" />
		  <name name="科卡契特" />
		  <name name="亦美吉特" />
		  <name name="鞑靼利特" />
		  <name name="纳马尼特" />
		  <name name="布鲁利特" />  
		  <name name="阿卡迪特" />
		  <name name="阿思利特" />
		  <name name="贝利里特" />
		  <name name="纳苏吉特" />
		  <name name="塞布利特" />
		  <name name="乌鲁思特" />
		  <name name="图鲁吉特" />  
		  <name name="胡古丽特" />
		  <name name="蒂里迪特" />
		  <name name="通吉特" />
		  <name name="坦苏里特" />
		  <name name="乌鲁米特" />
		  <name name="扎古思特" />
        </clan_names>
    </xsl:template>

</xsl:stylesheet>