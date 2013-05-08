<?php _mpinfo(array("ename" => "header_banner","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "4","orderby" => "vieworder_asc","length" => "10",));?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?=$mcharset?>">
<meta name="keywords" content="<?=$cmskeyword?>-<?php $v=_ctag_parse(array("ename" => "list_tit","tclass" => "cnmod",));if(!empty($v)){_aenter($v);?>
<?=$v['title']?><?php _aquit();} unset($v);?>
" />
<meta name="Description" content="<?=$cmsdescription?>-<?php $v=_ctag_parse(array("ename" => "list_tit","tclass" => "cnmod",));if(!empty($v)){_aenter($v);?>
<?=$v['title']?><?php _aquit();} unset($v);?>
" />
<TITLE><?=$cmstitle?> - <?=$cmsname?> - <?=$hostname?>-<?php $v=_ctag_parse(array("ename" => "list_tit","tclass" => "cnmod",));if(!empty($v)){_aenter($v);?>
<?=$v['title']?><?php _aquit();} unset($v);?>
</TITLE>
<link rel="stylesheet" type="text/css" href="<?=$tplurl?>css/common.css" />
<link rel="stylesheet" type="text/css" href="<?=$tplurl?>css/style.css" />
<link rel="stylesheet" type="text/css" href="<?=$tplurl?>css/17_header.css" />
<link rel="stylesheet" type="text/css" href="<?=$tplurl?>css/index.css" />
<script type="text/javascript">var cmsUrl = "<?=$cms_abs?>";</script>
<script src="<?=$tplurl?>js/common.js" type="text/javascript" language="javascript"></script>
<script src="<?=$tplurl?>js/ajax.js" type="text/javascript" language="javascript"></script>
<script src="<?=$tplurl?>js/commu.js" type="text/javascript" language="javascript"></script>
<script src="<?=$tplurl?>js/jquery-1.7.1.min.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function AddFavorite(sURL, sTitle) {
    try {
        window.external.addFavorite(sURL, sTitle);
    } catch (e) {
        try {
            window.sidebar.addPanel(sTitle, sURL, "");
        } catch (e) {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
//设为首页 <a onclick="SetHome(this,window.location)">设为首页</a>
function SetHome(obj,vrl){
        try {
        	obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        } catch(e){
        	if(window.netscape) {
            	try {
                	netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            	} catch (e) {
                	alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
            	}
            	var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            	prefs.setCharPref('browser.startup.homepage',vrl);
            }
        }
}
</script>
<style type="text/css">
.search .but {float: left;margin: 5px 0 0 0;border: 0;width: 51px;height: 24px;line-height: 24px;font-size: 14px;color: #fff;background-position: 0 -19px;cursor: pointer;}
.headBanner {
	float : left;
}
</style>
</head>
<body>
<!-- 顶部 begin -->
<div id="top" style="margin-top:0px;">
<div class="left orangea"><script language="javascript"  src="<?=$cms_abs?>login.php?mode=js&sid=<?=$sid?>"></script></div>
<div class="right">【<a href="javascript:void(0);" onclick="SetHome(this,window.location)" style="cursor:hand">设为首页</a>】【<a href="javascript:void(0);" onClick="AddFavorite(window.location,document.title)">收藏本站</a>】</div>
</div>
<!-- 首体 begin -->
<div id="head">
<div class="left"><a href="<?=$cms_abs?>" ><img src="<?=$cms_abs?><?=$cmslogo?>" /></a></div>
<div class="right" style="width:730px;">
<div class="r2" style="padding-right:5px;float:left;margin:5px 0;">
	<div class="headBanner">
		<?php $_header_banner=_ptag_parse(array("ename" => "header_banner","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "4","orderby" => "vieworder_asc","length" => "10",));foreach($_header_banner as $v){_aenter($v);?>
	    <a target="_blank" href="<?=$v['advurl']?>"><img src="<?=$v['advimg']?>" title="<?=$v['subject']?>" width="515px" height="66px" /></a><?php _aquit();} unset($_header_banner,$v);?>

	</div>
	<div class="repeat_bg1 headNews" style="float:right; margin-left:10px;"> 
        <ul> 
         	<?php $_header_textad3=_ptag_parse(array("ename" => "header_textad3","tclass" => "farchives","disabled" => "0","limits" => "3","casource" => "38","orderby" => "vieworder_asc","validperiod" => "1","length" => "10",));foreach($_header_textad3 as $v){_aenter($v);?>
	                    <li><a href="<?=$v['advurl']?>" <? if($v['sn_row']==1 || $v['sn_row']==3) { ?>style="color:#FF0000"<? } ?> target="_blank" title="<?=$v['alttext']?>"><?=$v['subject']?></a></li> <?php _aquit();} unset($_header_textad3,$v);?>
                                  
        </ul> 
    </div>
</div>
</div>
</div>
<!-- 首体 begin -->
<script type="text/javascript">
function showmenu(id){
	for(var i=1; i<=6; i++){
		$('menu_'+i).style.display='none';
	}
	$('menu_'+id).style.display='block';
}
function request(paras){ 
	var url = location.href;  
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
	var paraObj = {}  
	for (i=0; j=paraString[i]; i++){  
		paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
	}  
	var returnValue = paraObj[paras.toLowerCase()];  
	if(typeof(returnValue)=="undefined"){  
		return "";  
	}else{  
		return returnValue; 
	}
}
$(function(){
	var caid = request("caid");
	var ccid7 = request("ccid7");
	var ccid3 = request("ccid3");
	var ind;
	if(caid==1 || caid==2 || caid==4 || caid==5 || caid==6 || caid==7 || caid==17){
		ind=0;
	}
	if(caid==14 || caid==3 || caid==15 || caid==16 || caid==18 || caid==19  || caid==20) {
		ind=1;
	}
	if(caid==23) ind = 3;

	if (caid == 22) ind = 0;
	if (ccid7 == 38) ind = 0;
	
	if (ind == undefined) ind = 0;
	
	$('.tagdhnew_01 ul li').eq(ind).addClass('selected').siblings().removeClass('selected');
	$('.tagdhnew_02 .center > div').eq(ind).show().siblings().hide();
	if(ind==3 || ind==5 || ind==4) $('.tagdhnew_02').css({'height':'0','overflow':'hidden'});
	if (ind==0) {
		$('.tagdhnew_02').addClass('tagdhnew_03');
		$('.tagdhnew_01').addClass('tagdhnew_04');
		$('.tagdhnew_02').removeClass('tagdhnew_02');
		$('.tagdhnew_01').removeClass('tagdhnew_01');
	}
});
</script>
<!--  -->
<div id="menu">
	<div class="tagdhnew_01">
		<div class="left">
			<ul>
				<li ><a title="男频" href="<?php $v=_ctag_parse(array("ename" => "xs_menunode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">男频</a></li>
				<li ><a title="女频" href="<?php $v=_ctag_parse(array("ename" => "xs_nvpinnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "14",));if(!empty($v)){_aenter($v);?>
		<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">女频</a></li>
				<li><a href="<?=$cms_abs?>adminm.php" target="_blank" title="会员中心">会员中心</a></li>
				<li ><a title="作者福利" href="/archive.php?aid=174&caid=23">作者福利</a></li>
				<li ><a title="成为作者" href="/adminm.php?action=utrans" target="_blank">成为作者</a></li>
				<!-- 
				<li ><a title="新人训练营" href="#">新人训练营</a></li>
				<li ><a title="网编专区" href="#">网编专区</a></li>
				<li ><a title="总编日志" href="#">总编日志</a></li>
				<li ><a title="社区论坛" href="#">社区论坛</a></li>
				 -->
				<li ><a title="充值" target="_blank" href="/adminm.php?action=payonline">充值</a></li>
			</ul>
		</div>
	</div>
	<div class="tagdhnew_02">
		<div class="center">
			<div id="menu_1"><a href="/index.php?caid=22" title="书库">书库</a><a title="排行榜" href="<?php $v=_ctag_parse(array("ename" => "pai_index","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "1","cosource7" => "38","urlmode" => "caid",));if(!empty($v)){_aenter($v);?>
	            <?=$v['indexurl']?><?php _aquit();} unset($v);?>
">排行榜</a><?php $v=_ctag_parse(array("ename" => "outxsnode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?php $_xs_sen_list=_ctag_parse(array("ename" => "xs_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","urlmode" => "caid",));foreach($_xs_sen_list as $v){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_xs_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
			<div id="menu_6"><?php $v=_ctag_parse(array("ename" => "outnpxsnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "14",));if(!empty($v)){_aenter($v);?>
<?php $_xs_sen_list=_ctag_parse(array("ename" => "xs_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","urlmode" => "caid",));foreach($_xs_sen_list as $v){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_xs_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

<div class="repeat_bg searchBox"> 
    <div class="searchBox_inner"> 
    	<div style="float:left;">
    	 <ul stat_flag="st_t-gg:头部公告" class="ico1 listTeseXs" style="width: 230px;"> 
        	<?php $_header_notice=_ptag_parse(array("ename" => "header_notice","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "3","orderby" => "createdate_desc","validperiod" => "1","length" => "10",));foreach($_header_notice as $v){_aenter($v);?>
<li><a style="color:#F00" href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a></li> <?php _aquit();} unset($_header_notice,$v);?>

      	 </ul> 
   	 	</div>
     
      <div style="float:right;">
      	<p stat_flag="st_ss-ci:搜索热词" class="ico1 search_rc" style="width:auto;">搜索热词：<?php $_search_reci_list=_ctag_parse(array("ename" => "search_reci_list","tclass" => "farchives","limits" => "3","casource" => "56","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_search_reci_list as $v){_aenter($v);?>
	<b><a target="_blank" href="<?=$v['rc_link']?>" <? if($v['rc_tuchu']) { ?>style="color:#FF0000;"<? } ?>><?=$v['subject']?></a></b><?php _aquit();} unset($_search_reci_list,$v);?>
</p> 
      	<div class="search" style="float:right;"> 
        	<form name="form" id="searchform" action="<?=$cmsurl?>search.php?sid=<?=$sid?>" method="get" target="_blank">                                                     
                <span>
                <input style="width:162px;" id="queryString" name="searchword" title="搜索图书" autocomplete="off" x-webkit-speech="" x-webkit-grammar="builtin:translate">                            
                </span>                            
                <input type="submit" value="搜索" class="but">                            
            </form>
      	</div> 
      </div>
      
    </div> 
</div>

<!-- 
<div class="h3">
<span class="reda">当前位置&gt;&gt;</span>  <a href="<?=$cms_abs?>">首页</a> <?php $_nav=_ctag_parse(array("ename" => "nav","tclass" => "nownav",));foreach($_nav as $v){_aenter($v);?>
> <a href="<?=$v['listurl']?>"><?=$v['title']?></a>&nbsp;<?php _aquit();} unset($_nav,$v);?>
</div>
 -->
<div style="height:3px;width:960px;"></div>
<style type="text/css">
.tab {margin-bottom: 10px;text-align: left;}
.tab-menuWrapper{background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-position: 0 -447px;background-repeat: repeat-x;position: relative;zoom: 1;padding: 4px 0 0 5px;height: 26px;}
.J_tab-menu, .J_tab-menu span, .tab-menuWrapper .active{background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;}
.J_tab-menu {background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;background-position: left -311px;font-weight: bold;cursor: pointer;float: left;display: inline;margin-right: 2px;font-size: 14px;white-space: nowrap;}
.J_tab-menu span {cursor: pointer;font-size: 14px;white-space: nowrap;font-weight: bold;background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;display: block;height: 26px;line-height: 26px;padding: 0 8px;background-position: right -380px;}
.tab-menu-m {background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;position: absolute;top: 4px;right: 5px;width: 35px;background-position: 30px -240px;line-height: 26px;}
.tab-menu-m a {color: #fff;font-size: 12px;}
.J_tab-content {border: 1px solid #ccc;border-top: 0 none;padding: 10px;position: relative;zoom: 1;}

.J_tab-content li a {color:#0070FF;}
.J_tab-content li a:hover {color:#ff0000;}
.J_tab-content ul {display: block;list-style-type: disc;-webkit-margin-before: 1em;-webkit-margin-after: 1em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;-webkit-padding-start: 40px;margin: 0;padding: 0;list-style: none outside none;}
.list1 li {display: list-item;text-align: -webkit-match-parent;position: relative;zoom: 1;line-height: 21px;height: 21px;border-bottom: 1px solid #e6e6e6;}
.list1 li span.sort {padding-left: 8px;color: #999;line-height: 21px;}
.clearfix {display: block;}
.list2col li {margin-top:1px;list-style: none outside none;display: list-item;text-align: -webkit-match-parent;background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;background-position: 0 -486px;padding-left: 12px;font-size: 14px;line-height: 24px;float: left;width: 45%;}
.list2col li a {color: #004d01;text-decoration: none;}
.list2col li a:hover {color: #F00;text-decoration:underline;}
.mod-bd {border: 1px solid #ccc;border-top: 0 none;padding: 10px;position: relative;zoom: 1;height: auto;background: url(<?=$tplurl?>images/fy-line-201005.png) repeat-x 0 165px;padding-bottom: 0;}
.picList1 {	position: relative;zoom: 1;height: 165px;margin-bottom: 10px;}
.picList1 dt {	display: block;margin-left: 135px;padding: 4px 0 0;font-size: 14px;font-weight: normal;text-indent: -7px;position: relative;zoom: 1;}
.picList1 dt a {font-weight: bold;}
.picList1 dd {margin-left: 130px;}
.picList1 dd.pic {margin: 0;position: absolute;left: 0;top: 0;}
.picList1 dd.pic img {vertical-align: middle;width: 120px;height: 165px;border: 1px solid #d1d1d1;background: #fff;padding: 1px;}
.picList1 dd.intro {margin-left: 130px;}
.picList1 dd.upd a {color: #006704;}


.mod-1 {margin-bottom: 10px;}
.mod-1 .mod-hd {background-position: 0 -447px;background-repeat: repeat-x;background-image: none;border: 1px solid #CCCCCC; height: 28px;overflow: hidden; position: relative;}
.mod-1 .mod-hd h2 {  color: #000000;font-size: 14px;    line-height: 30px;    padding-left: 10px;font-weight:bold;text-align: left;}
.clearfix:after {    clear: both;    content: ".";    display: block;    height: 0;    visibility: hidden;}
.sortTop .mod-bd {    padding-bottom: 0;}
.mod-bd, .J_tab-content {    -moz-border-bottom-colors: none;    -moz-border-left-colors: none;    -moz-border-right-colors: none;    -moz-border-top-colors: none;    border-image: none;    border-style: none solid solid;    border-width: 0 1px 1px;    padding: 10px;    position: relative;}
.content-rl .content-lr .main {    float: left;}
.w210 {    width: 220px;	float:left;margin-bottom:5px;}
.sortTop .mod-sub {    margin-bottom: 10px;}
.sortTop .mod-sub h3 {	background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;    background-position: 0 -170px;font-size: 100%;    height: 23px;    margin-bottom: 10px;    padding: 0 0 0 20px;}
.picList2 {position: relative;zoom: 1;height: 135px;}
.picList2 dt {margin-left: 110px;font-size: 12px;font-weight: normal;text-indent: -3px;position: relative;zoom: 1;}
.picList2 dt a {font-weight: bold;}
.picList2 dd.pic {margin: 0;position: absolute;left: 0;top: 0;}
.picList2 dd.pic img {	vertical-align: middle;width: 96px;height: 120px;border: 1px solid #999;background: #fff;padding: 2px;}
.picList2 dd {margin-left: 110px;}
.picList2 dd.intro {color: #646464;}
.sortTop .mod-sub li {height: 20px;line-height: 20px;position: relative;zoom: 1;overflow: hidden;}
span.sort {color: #999;}
.sortTop .mod-sub li {line-height: 20px;}
.mod-sub dl {display: block;-webkit-margin-before: 1em;-webkit-margin-after: 1em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;}
.mod-sub ul, ol {list-style: none outside none;}
.txt_tab li {padding-left: 34px;}
.txt_tab li a {width:165px;float:left;}
.txt_tab li span {display: inline-block;float: right;height: 22px;line-height: 22px;text-align: right;width: auto;}


.clearfix:after {content: ".";display: block;height: 0;clear: both;visibility: hidden;}
.clearfix {display: block;}
.content, .content-lr, .content-rl {position: relative;zoom: 1;}
#wrap {text-align: left;}
.mr10 {margin-right: 10px;}
.main, .sidebar {display: inline;}
.w230 {width: 230px;}
.content-lr .main {float: left;}
.mod-1 {margin-bottom: 10px;}
.mod-hd, .tab-menuWrapper {height: 30px;background-position: 0 -447px;background-repeat: repeat-x;position: relative;zoom: 1;}
.mod-1 .mod-hd {background-image: none;height: 28px;border: 1px solid #ccc;position: relative;zoom: 1;overflow: hidden;}
.mod-hd h2 {font-size: 14px;line-height: 30px;padding-left: 10px;color: #fff;}
.mod-1 .mod-hd h2 {color: #000;}
.mod-hd-m {background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;}
.mod-hd-m, .tab-menu-m {position: absolute;top: 4px;right: 5px;width: 35px;background-position: 30px -240px;line-height: 26px;}
.mod-1 .mod-hd-m {background-position: 30px -211px;}
.mod-hd-m a, .tab-menu-m a {font-size: 12px;}
.mod-1 .mod-hd-m a {color: #000;}
.mod-bd, .J_tab-content {border: 1px solid #ccc;border-top: 0 none;padding: 10px;position: relative;zoom: 1;background:none;}
.picList3 {position: relative;zoom: 1;height: 96px;background: url(<?=$tplurl?>images/fy-bg-201005.png) repeat-x 0 103px;padding-bottom: 9px;margin-bottom: 5px;}
.picList3 dt {height:20px;overflow:hidden;margin-left: 90px;font-size: 12px;font-weight: normal;text-indent: -3px;position: relative;zoom: 1;}
.picList3 dt a {font-weight: bold;}
.picList3 dd.pic {margin: 0;position: absolute;left: 0;top: 0;}
.picList3 dd.pic img {width: 72px;height: 90px;border: 1px solid #d1d1d1;background: #fff;padding: 2px;}
.picList3 dd {margin-left: 90px;}
.picList3 dd.author {color: #656565;}
.picList3 dd {margin-left: 90px;}
.picList3 dd.intro {height:60px;overflow:hidden;color: #999;width: 118px;}


.topList3 {background: url(<?=$tplurl?>images/fy-line-201005.png) repeat;}
.topList3 li{background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;}
.topList3 li {height: 22px;line-height: 22px;overflow: hidden;position: relative;zoom: 0;}
.topList3 li span {margin-left:15px;background: #ffffff;}
.topList3 li span.author {position: absolute;top: 0;right: 0;padding: 0 0 0 5px;margin: 0;display: inline-table;}

.topList3_list {background: url(<?=$tplurl?>images/fy-line-201005.png) repeat;}
.topList3_list li{background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;}
.topList3_list li {height: 22px;line-height: 22px;overflow: hidden;position: relative;zoom: 0;}
.topList3_list li span {margin-left:2px;}
.topList3_list li span.author {position: absolute;top: 0;right: 0;padding: 0 0 0 5px;margin: 0;display: inline-table;}

li.No1 {background-position: -380px -15px;}
li.No2 {background-position: -380px -39px;}
li.No3 {background-position: -380px -63px;}
li.No4 {background-position: -380px -87px;}
li.No5 {background-position: -380px -111px;}
li.No6 {background-position: -380px -135px;}
li.No7 {background-position: -380px -159px;}
li.No8 {background-position: -380px -183px;}
li.No9 {background-position: -380px -207px;}
li.No10 {background-position: -380px -231px;}
li.No11 {background-position: -380px -255px;}
li.No12 {background-position: -380px -279px;}
li.No13 {background-position: -380px -303px;}
li.No14 {background-position: -380px -327px;}
li.No15 {background-position: -380px -351px;}
.content-lr .sidebar {float: right;}

</style>

<div id="main">

<?php $_nvpin_hengfu_ad_1=_ctag_parse(array("ename" => "nvpin_hengfu_ad_1","tclass" => "farchives","limits" => "1","casource" => "41","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_nvpin_hengfu_ad_1 as $v){_aenter($v);?>
	<div class="adwimg" style="width:950px;"><a href="<?=$v['advurl']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "adimg_950_50","tclass" => "image","disabled" => "0","tname" => "$v[advimg]","maxwidth" => "950","maxheight" => "50",));if(!empty($u)){?>	<img width="950" height="50" src="<?=$u['url']?>" border="0" /><?php } unset($u);?></a></div><?php _aquit();} unset($_nvpin_hengfu_ad_1,$v);?>


<div class="tab J_tab" style="width:350px; float:left; ">
	 <!-- 重磅推荐&大神推荐 -->
	<div class="tab-menuWrapper" style="height:0px;"></div>
	<div class="J_tab-content" style="border: none; padding: 0px; display: block;">
		<div class="mod-bd" style="height: 360px;">
			<?php $_nvpinshouyetuwentuijian=_ctag_parse(array("ename" => "nvpinshouyetuwentuijian","tclass" => "archives","disabled" => "0","limits" => "2","caidson" => "1","casource" => "1","caids" => "3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "favorites_desc","orderby1" => "mpraises_desc","closed" => "-1","abover" => "-1",));foreach($_nvpinshouyetuwentuijian as $v){_aenter($v);?>
			<dl class="picList1">
					<dt><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
					<dd class="pic"><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank"><img src="<?=$v['thumb']?>" alt="<?=$v['subject']?>"></a></dd>
                                        <dt>作者：<?=$v['author']?></a></dt>
					<dd class="intro"><?php echo _utag_parse(array("ename" => "abstract120","tclass" => "odeal","disabled" => "0","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
					<dd class="upd"><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl><?php _aquit();} unset($_nvpinshouyetuwentuijian,$v);?>

		</div>
	</div>
	<!--END 重磅推荐&强力推荐 -->
</div>

<div id="txtbox" class="k1" style="width:375px;float:left;margin-left:8px;height: 383px;padding-left:5px;">
	<br>
	<h2 style="font-size: 18px;font-family: "黑体","宋体";font-weight: normal;text-align: center;margin: 16px 0 12px;">
		<?php $_nvpinshouyedawenzituig1=_ptag_parse(array("ename" => "nvpinshouyedawenzituig1","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "49","orderby" => "vieworder_asc","validperiod" => "1","length" => "10",));foreach($_nvpinshouyedawenzituig1 as $v){_aenter($v);?>
	    <a style="color: #d91c23;" href="<?=$v['advurl']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_nvpinshouyedawenzituig1,$v);?>

	</h2>
	
	<ul class="list2col clearfix">
		<?php $_nvpinshouyeshoutuiliebiao1=_ptag_parse(array("ename" => "nvpinshouyeshoutuiliebiao1","tclass" => "farchives","disabled" => "0","casource" => "51","orderby" => "vieworder_desc","validperiod" => "1","length" => "10",));foreach($_nvpinshouyeshoutuiliebiao1 as $v){_aenter($v);?>
	                    <li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['advurl']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_nvpinshouyeshoutuiliebiao1,$v);?>

	</ul>
	<br><br>
	<h2 style="font-size: 18px;font-family: "黑体","宋体";font-weight: normal;text-align: center;margin: 16px 0 12px;">
		<?php $_nvpinshouyedawenzituig2=_ptag_parse(array("ename" => "nvpinshouyedawenzituig2","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "49","orderby" => "vieworder_asc","validperiod" => "1","length" => "10",));foreach($_nvpinshouyedawenzituig2 as $v){_aenter($v);?>
	    <a style="color: #d91c23;" href="<?=$v['advurl']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_nvpinshouyedawenzituig2,$v);?>

	</h2>
	
	<ul class="list2col clearfix">
		<?php $_nvpinshouyeshoutuilist2=_ptag_parse(array("ename" => "nvpinshouyeshoutuilist2","tclass" => "farchives","disabled" => "0","casource" => "36","orderby" => "vieworder_desc","validperiod" => "1","length" => "10",));foreach($_nvpinshouyeshoutuilist2 as $v){_aenter($v);?>
	                    <li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['advurl']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_nvpinshouyeshoutuilist2,$v);?>

	</ul>
</div>

<div class="tab J_tab" style="width:205px;height:385px;overflow:hidden;float:right;margit:5px;margin-left: 5px;">
	<div class="tab-menuWrapper">
		<h2 class="J_tab-menu active"><span>全站强推</span></h2>
		<div class="tab-menu-m"><a href="/index.php?caid=24&action=tuijian" target="_blank">更多</a></div>
	</div>
	<div class="tab-contentWrapper">
		<div class="J_tab-content" style="display: block;">
			<ul class="list1">
               	<?php $_nanpinxiaoshuoqingtui=_ptag_parse(array("ename" => "nanpinxiaoshuoqingtui","tclass" => "farchives","disabled" => "0","limits" => "15","casource" => "22","orderby" => "vieworder_asc","validperiod" => "1","orderstr" => "xs_pai ASC","length" => "10",));foreach($_nanpinxiaoshuoqingtui as $v){_aenter($v);?>
	    <li><span class="sort">[<?=$v['xs_type']?>]</span>《<a target="_blank" href="<?=$v['xs_link']?>" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject20","tclass" => "odeal","disabled" => "0","tname" => "$v[subject]","trim" => "26",));?>
</a>》</li><?php _aquit();} unset($_nanpinxiaoshuoqingtui,$v);?>

      		</ul>
		</div>
	</div>
</div>


      
<div class="blank3"></div>
<?php $_nvpin_hengfu_ad_2=_ctag_parse(array("ename" => "nvpin_hengfu_ad_2","tclass" => "farchives","limits" => "1","casource" => "42","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_nvpin_hengfu_ad_2 as $v){_aenter($v);?>
	<div class="adwimg" style="width:950px;"><a href="<?=$v['advurl']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "adimg_950_50","tclass" => "image","disabled" => "0","tname" => "$v[advimg]","maxwidth" => "950","maxheight" => "50",));if(!empty($u)){?>	<img width="950" height="50" src="<?=$u['url']?>" border="0" /><?php } unset($u);?></a></div><?php _aquit();} unset($_nvpin_hengfu_ad_2,$v);?>


<div class="picList1" style="width:270px;height:150px;float:left;border: 1px solid #ccc;">
	<?php $_nvpintuwenxiaoshuotuijianzuo=_ctag_parse(array("ename" => "nvpintuwenxiaoshuotuijianzuo","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "57","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_nvpintuwenxiaoshuotuijianzuo as $v){_aenter($v);?>
	        <dt><a target="_blank" title="<?=$v['subject']?>" href="<?=$v['xs_link']?>"><?=$v['subject']?></a></dt>
    <dd class="pic"><a target="_blank" title="<?=$v['subject']?>" href="<?=$v['xs_link']?>">
    <img style="width:111px;height:145px;" alt="<?=$v['subject']?>" src="<?=$v['xs_fengmian']?>"></a></dd>
    <dd class="intro"><?php echo _utag_parse(array("ename" => "xiaoshuomiaoshu46","tclass" => "odeal","disabled" => "0","tname" => "$v[xs_miaoshu]","dealhtml" => "clearhtml","trim" => "92",));?>
...</dd>
    <dd class="upd"><a target="_blank" title="<?=$v['subject']?>" href="<?=$v['xs_link']?>">阅读>></a></dd><?php _aquit();} unset($_nvpintuwenxiaoshuotuijianzuo,$v);?>

</div>

<div style="width:395px;height:150px;float:left;margin-left:5px; border: 1px solid #ccc;">
	<ul class="list2col clearfix" style="list-style: none;">
		<?php $_nvpinshouyeshoutuilist3=_ptag_parse(array("ename" => "nvpinshouyeshoutuilist3","tclass" => "farchives","disabled" => "0","casource" => "54","orderby" => "vieworder_desc","validperiod" => "1","length" => "10",));foreach($_nvpinshouyeshoutuilist3 as $v){_aenter($v);?>
<li style="margin-top:4px;margin-left: 5px;font-size: 13px;"><a href="archive.php?aid=37" target="_blank" title="<?=$v['subject']?>"><span style="color:#000;font-size: 13px;"><?=$v['subject']?></span></a></li><?php _aquit();} unset($_nvpinshouyeshoutuilist3,$v);?>

	</ul>
</div>


<div class="picList1" style="width:270px;height:150px;float:right;border: 1px solid #ccc;">
	<?php $_nvpintuwenxiaoshuotuijianyou=_ctag_parse(array("ename" => "nvpintuwenxiaoshuotuijianyou","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "58","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_nvpintuwenxiaoshuotuijianyou as $v){_aenter($v);?>
	            <dt><a target="_blank" title="<?=$v['subject']?>" href="<?=$v['xs_link']?>"><?=$v['subject']?></a></dt>
    <dd class="pic"><a target="_blank" title="<?=$v['subject']?>" href="<?=$v['xs_link']?>">
    <img style="width:111px;height:145px;" alt="<?=$v['subject']?>" src="<?=$v['xs_fengmian']?>"></a></dd>
    <dd class="intro"><?php echo _utag_parse(array("ename" => "xiaoshuomiaoshu46","tclass" => "odeal","disabled" => "0","tname" => "$v[xs_miaoshu]","dealhtml" => "clearhtml","trim" => "92",));?>
...</dd>
    <dd class="upd"><a target="_blank" title="<?=$v['subject']?>" href="<?=$v['xs_link']?>">阅读>></a></dd><?php _aquit();} unset($_nvpintuwenxiaoshuotuijianyou,$v);?>

</div>

<div class="blank3"></div>

<div style="width:230px;float:left">
	<div id="lm2" class="lmc" style="width:230px;float:left;">
		<dl><dt>点击榜<span><a href="/index.php?caid=24&action=dianji">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_nvpindianjibang=_ctag_parse(array("ename" => "nvpindianjibang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "1","caids" => "3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "clicks_desc","closed" => "-1","abover" => "-1",));foreach($_nvpindianjibang as $v){_aenter($v);?>
	                        <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_nvpindianjibang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
	<br>
	<div id="lm2" class="lmc" style="width:230px;float:left;">
		<dl><dt>订阅榜<span><a href="/index.php?caid=24&action=dingyue">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_nvpindingyuebang=_ctag_parse(array("ename" => "nvpindingyuebang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "1","caids" => "3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "favorites_desc","closed" => "-1","abover" => "-1",));foreach($_nvpindingyuebang as $v){_aenter($v);?>
	                            <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_nvpindingyuebang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
</div>

<div class="content-lr clearfix" style="width:710px;margin-left:10px;float:right;">
    <!--第三部分 开始--> 
	<?php $_nvpin_tuwenliebiao=_ctag_parse(array("ename" => "nvpin_tuwenliebiao","tclass" => "catalogs","disabled" => "0","limits" => "6","nsid" => "-1","listby" => "ca","casource" => "1","caids" => "3,15,16,18,19,20",));foreach($_nvpin_tuwenliebiao as $v){_aenter($v);?>
	<div class="main w230 mr10" style="width:230px;margin:0px;margin-left:6px;">
      <div class="mod-1">
        <!-- <?=$v['title']?>新书榜 -->
        <div class="mod-hd">
          <h2><?=$v['title']?></h2>
          <div class="mod-hd-m"><a href="<?=$v['listurl']?>" title="更多" target="_blank">更多</a></div>
        </div>
        <div class="mod-bd">
          <?php $_nvpin_jihuo_tuwenshuoming=_ctag_parse(array("ename" => "nvpin_jihuo_tuwenshuoming","tclass" => "archives","disabled" => "0","limits" => "1","caidson" => "1","casource" => "2","ccids1" => "32","chsource" => "2","chids" => "4","orderby" => "createdate_desc","orderby1" => "mclicks_desc","closed" => "-1","abover" => "-1","wherestr" => "a.thumb != \'\'",));foreach($_nvpin_jihuo_tuwenshuoming as $v){_aenter($v);?>
	<dl class="picList3">
	<dt>《<a href="<?=$v['arcurl']?>" target="_blank" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</dt>
	<dd class="pic"><a href="<?=$v['arcurl']?>" target="_blank" title="<?=$v['subject']?>"><img src="<?=$v['thumb']?>" alt="《<?=$v['subject']?>》"></a></dd>
        <dd class="intro" style="height:auto;" title="<?php echo _utag_parse(array("ename" => "abstract60","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "60",));?>
 ..."><?php echo _utag_parse(array("ename" => "abstract60","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "60",));?>
 ...</dd>
</dl><?php _aquit();} unset($_nvpin_jihuo_tuwenshuoming,$v);?>

                  <ul class="topList3_list" style="background:none;">
                  <?php $_nvpin_jihuo_list=_ctag_parse(array("ename" => "nvpin_jihuo_list","tclass" => "archives","disabled" => "0","limits" => "6","caidson" => "1","casource" => "2","ccids1" => "32","chsource" => "2","chids" => "4","orderby" => "createdate_desc","orderby1" => "mclicks_desc","closed" => "-1","abover" => "-1","wherestr" => "a.thumb != \'\'",));foreach($_nvpin_jihuo_list as $v){_aenter($v);?>
					<? if($v['sn_row']!==1) { ?><li style="background-image:none;">
<span style="color:#656565;margin-left:-1px;">[<?=$v['catalog']?>]</span>
<span><a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></span>
</li><? } ?><?php _aquit();} unset($_nvpin_jihuo_list,$v);?>

                  </ul>
        </div>
        <!-- END 武侠仙侠新书榜 -->
      </div>
    </div><?php _aquit();} unset($_nvpin_tuwenliebiao,$v);?>

</div>

<div class="blank3"></div>

<?php $_nvpin_xinshu_paihangbang=_ctag_parse(array("ename" => "nvpin_xinshu_paihangbang","tclass" => "catalogs","disabled" => "0","limits" => "6","nsid" => "-1","listby" => "ca","casource" => "1","caids" => "3,15,16,18,19,20",));foreach($_nvpin_xinshu_paihangbang as $v){_aenter($v);?>
<div class="main w230 mr10" style="width:232px;float:left;margin:0px;margin-left:5px;">
      <div class="mod-1">
        <!-- <?=$v['title']?>新书榜 -->
        <div class="mod-hd">
          <h2><?=$v['title']?>新书榜</h2>
          <div class="mod-hd-m"><a href="<?=$v['listurl']?>" title="更多" target="_blank">更多</a></div>
        </div>
        <div class="mod-bd">
          <?php $_nanpin_xinshu_tuwenshuoming=_ctag_parse(array("ename" => "nanpin_xinshu_tuwenshuoming","tclass" => "archives","disabled" => "0","limits" => "1","caidson" => "1","casource" => "2","ccids1" => "32","chsource" => "2","chids" => "4","orderby" => "createdate_desc","orderby1" => "mclicks_desc","closed" => "-1","abover" => "-1","wherestr" => "a.thumb != \'\'",));foreach($_nanpin_xinshu_tuwenshuoming as $v){_aenter($v);?>
		<dl class="picList3">
	<dt>《<a href="<?=$v['arcurl']?>" target="_blank" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</dt>
	<dd class="pic"><a href="<?=$v['arcurl']?>" target="_blank" title="<?=$v['subject']?>"><img src="<?=$v['thumb']?>" alt="《<?=$v['subject']?>》"></a></dd>
        <dd class="author">作者：<?=$v['author']?></dd>
        <dd class="intro" title="<?php echo _utag_parse(array("ename" => "abstract60","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "60",));?>
 ..."><?php echo _utag_parse(array("ename" => "abstract60","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "60",));?>
 ...</dd>
</dl><?php _aquit();} unset($_nanpin_xinshu_tuwenshuoming,$v);?>

                  <ul class="topList3">
                  <?php $_nanpin_xinshu_list_15=_ctag_parse(array("ename" => "nanpin_xinshu_list_15","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "2","ccids1" => "32","chsource" => "2","chids" => "4","orderby" => "createdate_desc","orderby1" => "mclicks_desc","closed" => "-1","abover" => "-1","wherestr" => "a.thumb != \'\'",));foreach($_nanpin_xinshu_list_15 as $v){_aenter($v);?>
	<? if($v['sn_row']!=1) { ?><li class="No<?=$v['sn_row']?>"><span>《<a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</span>
<span class="author"><?=$v['author']?></span></li><? } ?><?php _aquit();} unset($_nanpin_xinshu_list_15,$v);?>

                  </ul>
        </div>
        <!-- END 武侠仙侠新书榜 -->
      </div>
    </div><?php _aquit();} unset($_nvpin_xinshu_paihangbang,$v);?>


<div style="width:232px;float:left;margin:0px;margin-left:5px;" class="main w230 mr10">
	<div class="mod-1">
	<div class="mod-hd">
		<h2>最新签约作品榜</h2>
		<div class="mod-hd-m"></div>
	</div>
	<div class="mod-bd">
		<?php $_nvpin_zuixinxiaoshuo_list=_ctag_parse(array("ename" => "nvpin_zuixinxiaoshuo_list","tclass" => "archives","disabled" => "0","limits" => "1","caidson" => "1","casource" => "1","caids" => "14","chsource" => "2","chids" => "4","orderby" => "createdate_desc","closed" => "-1","abover" => "-1",));foreach($_nvpin_zuixinxiaoshuo_list as $v){_aenter($v);?>
	    <dl class="picList3">
    <?php $__sub_nvpin_gengmeitongren_img=_ctag_parse(array("ename" => "_sub_nvpin_gengmeitongren_img","tclass" => "archives","limits" => "1","caidson" => "1","casource" => "2","chsource" => "2","chids" => "4","orderby" => "favorites_desc","closed" => "-1","abover" => "-1",));foreach($__sub_nvpin_gengmeitongren_img as $v){_aenter($v);?>
<dl class="picList3">
    <dt>《<a href="<?=$v['arcurl']?>" target="_blank" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</dt>
    <dd class="pic"><a href="<?=$v['arcurl']?>" target="_blank" title="<?=$v['subject']?>"><img src="<?=$v['thumb']?>" alt="《<?=$v['subject']?>》"></a></dd>
        <dd class="author">作者：<?=$v['author']?></dd>
        <dd class="intro" title="<?php echo _utag_parse(array("ename" => "abstract60","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "60",));?>
 ..."><?php echo _utag_parse(array("ename" => "abstract60","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "60",));?>
 ...</dd>
</dl><?php _aquit();} unset($__sub_nvpin_gengmeitongren_img,$v);?>
        
</dl>
<ul class="topList3">
    <?php $__sub_nvpin_gengmeitongren_list=_ctag_parse(array("ename" => "_sub_nvpin_gengmeitongren_list","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "2","chsource" => "2","chids" => "4","orderby" => "createdate_desc","closed" => "-1","abover" => "-1",));foreach($__sub_nvpin_gengmeitongren_list as $v){_aenter($v);?>
	    <? if($v['sn_row'] != 1) { ?><li class="No<?=$v['sn_row']?>"><span>《<a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</span>
<span class="author"><?=$v['author']?></span></li><? } ?><?php _aquit();} unset($__sub_nvpin_gengmeitongren_list,$v);?>
        
</ul><?php _aquit();} unset($_nvpin_zuixinxiaoshuo_list,$v);?>

	</div>
	</div>
</div>

<div style="width:232px;float:left;margin:0px;margin-left:5px;" class="main w230 mr10">
	<div class="mod-1">
	<div class="mod-hd">
		<h2>完本精选</h2>
		<div class="mod-hd-m"></div>
	</div>
	<div class="mod-bd">
		<?php $_nvping_wanbenjingxuan_list=_ctag_parse(array("ename" => "nvping_wanbenjingxuan_list","tclass" => "archives","disabled" => "0","limits" => "1","caidson" => "1","casource" => "1","caids" => "14","chsource" => "2","chids" => "4","orderby" => "createdate_asc","closed" => "-1","abover" => "-1",));foreach($_nvping_wanbenjingxuan_list as $v){_aenter($v);?>
	    <dl class="picList3">
    <?php $__sub_nvpin_wanbenjingxuan_img=_ctag_parse(array("ename" => "_sub_nvpin_wanbenjingxuan_img","tclass" => "archives","disabled" => "0","limits" => "1","caidson" => "1","casource" => "2","chsource" => "2","chids" => "4","orderby" => "createdate_asc","closed" => "-1","abover" => "-1",));foreach($__sub_nvpin_wanbenjingxuan_img as $v){_aenter($v);?>
	<dl class="picList3">
    <dt>《<a href="<?=$v['arcurl']?>" target="_blank" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</dt>
    <dd class="pic"><a href="<?=$v['arcurl']?>" target="_blank" title="<?=$v['subject']?>"><img src="<?=$v['thumb']?>" alt="《<?=$v['subject']?>》"></a></dd>
        <dd class="author">作者：<?=$v['author']?></dd>
        <dd class="intro" title="<?php echo _utag_parse(array("ename" => "abstract60","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "60",));?>
 ..."><?php echo _utag_parse(array("ename" => "abstract60","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "60",));?>
 ...</dd>
</dl><?php _aquit();} unset($__sub_nvpin_wanbenjingxuan_img,$v);?>
        
</dl>
<ul class="topList3">
    <?php $__sub_nvpin_wanbenjingxuan_list=_ctag_parse(array("ename" => "_sub_nvpin_wanbenjingxuan_list","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "2","chsource" => "2","chids" => "4","orderby" => "createdate_asc","closed" => "-1","abover" => "-1",));foreach($__sub_nvpin_wanbenjingxuan_list as $v){_aenter($v);?>
	    <? if($v['sn_row'] != 1) { ?><li class="No<?=$v['sn_row']?>"><span>《<a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</span>
<span class="author"><?=$v['author']?></span></li><? } ?><?php _aquit();} unset($__sub_nvpin_wanbenjingxuan_list,$v);?>
        
</ul><?php _aquit();} unset($_nvping_wanbenjingxuan_list,$v);?>

	</div>
	</div>
</div>



<div class="blank3"></div>


<div style="width:230px;float:left;margin-left:2px;">
	<div id="lm2" class="lmc" style="width:230px;float:right;">
		<dl><dt>连载精品<span></span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_nvpindingyuebang=_ctag_parse(array("ename" => "nvpindingyuebang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "1","caids" => "3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "favorites_desc","closed" => "-1","abover" => "-1",));foreach($_nvpindingyuebang as $v){_aenter($v);?>
	                            <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_nvpindingyuebang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
	<br>
	<div id="lm2" class="lmc" style="width:230px;float:right;height:282px;">
		<dl><dt>热点精品<span></span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_nvpindianjibang=_ctag_parse(array("ename" => "nvpindianjibang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "1","caids" => "3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "clicks_desc","closed" => "-1","abover" => "-1",));foreach($_nvpindianjibang as $v){_aenter($v);?>
	                        <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_nvpindianjibang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
</div>

<div id="divboxd" style="width:470px;float:left;margin-left:7px;">
<div id="lm4"><dl>
<dt><img src="<?=$tplurl?>images/ico_gx.gif"  align="absmiddle" /><b>最新小说更新列表</b><span class="rright"><a href="/index.php?caid=22">更多&gt;&gt;</a></span></dt>
<dd><div id="txttd4"><div class="txttb4 txtbg1"><ul><?php $_list_newlist=_ctag_parse(array("ename" => "list_newlist","tclass" => "archives","disabled" => "0","limits" => "21","caidson" => "1","casource" => "2","chsource" => "2","chids" => "4","orderstr" => "a.abnew DESC","closed" => "-1","abover" => "-1",));foreach($_list_newlist as $v){_aenter($v);?>
	        <li><span class="urs4 cGray">[<?=$v['catalog']?>]</span> <span class="urs5"><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></span>

<?php $h=_ctag_parse(array("tclass" => "archive","aid" => "$v[abnew]","album" => "0",));if(!empty($h)){_aenter($h);?>
<span class="urs3 cGray"><?php echo _utag_parse(array("ename" => "gx_min","tclass" => "date","tname" => "$h[createdate]","date" => "m-d","time" => "H:i",));?>
</span><a href="<?=$h['arcurl']?>" title="<?=$h['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$h[subject]","trim" => "30",));?>
</a><? if(($h['ccid3'])) { ?><font style="color:red">[VIP]</font><? } ?><?php _aquit();} unset($h);?>


</li><?php _aquit();} unset($_list_newlist,$v);?>
</ul></div></div></dd>
</dl></div>
</div>

<div style="width:230px;float:right;">
	<div id="lm2" class="lmc" style="width:230px;float:right;">
		<dl><dt>打赏榜<span><a href="/index.php?caid=24&action=dashang">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_nvpindianjibang=_ctag_parse(array("ename" => "nvpindianjibang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "1","caids" => "3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "clicks_desc","closed" => "-1","abover" => "-1",));foreach($_nvpindianjibang as $v){_aenter($v);?>
	                        <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_nvpindianjibang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
	<br>
	<div id="lm2" class="lmc" style="width:230px;float:right;height:282px;">
		<dl><dt>推荐榜<span><a href="/index.php?caid=24&action=tuijian">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_nvpindingyuebang=_ctag_parse(array("ename" => "nvpindingyuebang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "1","caids" => "3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "favorites_desc","closed" => "-1","abover" => "-1",));foreach($_nvpindingyuebang as $v){_aenter($v);?>
	                            <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_nvpindingyuebang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
</div>


<div class="blank3"></div>
<?php $_nvpin_hengfu_ad_3=_ctag_parse(array("ename" => "nvpin_hengfu_ad_3","tclass" => "farchives","limits" => "1","casource" => "43","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_nvpin_hengfu_ad_3 as $v){_aenter($v);?>
	<div class="adwimg" style="width:950px;"><a href="<?=$v['advurl']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "adimg_950_50","tclass" => "image","disabled" => "0","tname" => "$v[advimg]","maxwidth" => "950","maxheight" => "50",));if(!empty($u)){?>	<img width="950" height="50" src="<?=$u['url']?>" border="0" /><?php } unset($u);?></a></div><?php _aquit();} unset($_nvpin_hengfu_ad_3,$v);?>



</div>
<div id="links"><b>友情链接：</b><?php $_txtflinklist=_ctag_parse(array("ename" => "txtflinklist","tclass" => "farchives","limits" => "10","cols" => "1","casource" => "1","orderby" => "vieworder_asc",));foreach($_txtflinklist as $v){_aenter($v);?>
<a href="<?=$v['linkurl']?>" title="<?=$v['subject']?>" target=_blank><?=$v['subject']?></a><?php _aquit();} unset($_txtflinklist,$v);?>
<br /><?php $_picflinklist=_ctag_parse(array("ename" => "picflinklist","tclass" => "farchives","limits" => "10","cols" => "1","casource" => "2","orderby" => "vieworder_asc",));foreach($_picflinklist as $v){_aenter($v);?>
<a href="<?=$v['linkurl']?>" title="<?=$v['linktxt']?>"><?php $u=_utag_parse(array("tclass" => "image","tname" => "$v[piclink]","maxwidth" => "88","maxheight" => "31","emptyurl" => "images/common/logo.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$u['subject']?>"><?php } unset($u);?></a><?php _aquit();} unset($_picflinklist,$v);?>
</div>
<div id="foot">
<span>
<?php $_all_dibu=_ctag_parse(array("ename" => "all_dibu","tclass" => "farchives","limits" => "100","cols" => "1","casource" => "11","orderby" => "vieworder_asc",));foreach($_all_dibu as $v){_aenter($v);?>
<a href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a>　|　<?php _aquit();} unset($_all_dibu,$v);?>

<a href="/adminm.php?action=archives&nmuid=2">作者投稿</a>
　|　
<a href="/adminm.php?action=payonline">支付中心</a>
　|　
<a href="<?=$cms_abs?>register.php" >会员注册</a>
</span>
<p id="copyright"><?=$copyright?>  Powered by <a href="<?=$hosturl?>" target="_blank"><?=$hostname?></a> v2013 &copy; 2013-2015 Inc.</a><br><?=$cms_icpno?> </p>
</div>
</body>
</html>