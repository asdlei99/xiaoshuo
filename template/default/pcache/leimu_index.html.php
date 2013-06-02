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
<TITLE><?php echo isset($subject) ? $subject.' - ' : ''; ?><?=$cmstitle?> - <?=$cmsname?> - <?=$hostname?>-<?php $v=_ctag_parse(array("ename" => "list_tit","tclass" => "cnmod",));if(!empty($v)){_aenter($v);?>
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
	<?php
	if (isset($caid)) {
		echo "caid = '".$caid."';";
	}
	?>
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
<div style="height:1px;width:960px;clear: both;"></div>
<style type="text/css">
.tab {margin-bottom: 10px;text-align: left;}
.tab-menuWrapper{background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-position: 0 -447px;background-repeat: repeat-x;position: relative;zoom: 1;padding: 4px 0 0 5px;height: 26px;}
.J_tab-menu, .J_tab-menu span, .tab-menuWrapper .active{background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;}
.J_tab-menu {background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;background-position: left -311px;font-weight: bold;cursor: pointer;float: left;display: inline;margin-right: 2px;font-size: 14px;white-space: nowrap;}
.J_tab-menu span {cursor: pointer;font-size: 14px;white-space: nowrap;font-weight: bold;background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;display: block;height: 26px;line-height: 26px;padding: 0 8px;background-position: right -380px;}
.tab-menu-m {background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;position: absolute;top: 4px;right: 5px;width: 35px;background-position: 30px -240px;line-height: 26px;}
.tab-menu-m a {color: #fff;font-size: 12px;}
.J_tab-content {border: 1px solid #ccc;border-top: 0 none;padding: 10px;position: relative;zoom: 1;}

.J_tab-content ul {display: block;list-style-type: disc;-webkit-margin-before: 1em;-webkit-margin-after: 1em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;-webkit-padding-start: 40px;margin: 0;padding: 0;list-style: none outside none;}
.list1 li {overflow:hidden; display: list-item;text-align: -webkit-match-parent;position: relative;zoom: 1;line-height: 21px;height: 21px;border-bottom: 1px solid #e6e6e6;}
.list1 li span.sort {padding-left: 8px;color: #999;line-height: 21px;}
.clearfix {display: block;}
.list2col li {margin-top:1px;list-style: none outside none;display: list-item;text-align: -webkit-match-parent;background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;background-position: 0 -486px;padding-left: 12px;font-size: 14px;line-height: 24px;float: left;width: 45%;}
.list2col li a {color: #004d01;text-decoration: none;}
.list2col li a:hover {color: #F00;text-decoration:underline;}
.mod-bd {border: 1px solid #ccc;border-top: 0 none;padding: 10px;position: relative;zoom: 1;height: auto;background: url(<?=$tplurl?>images/fy-line-201005.png) repeat-x 0 165px;padding-bottom: 0;}
.picList1 {	position: relative;zoom: 1;height: 165px;margin-bottom: 10px;}
.picList1 dt {	display: block;margin-left: 135px;padding: 4px 0 0;font-size: 14px;font-weight: normal;text-indent: -7px;position: relative;zoom: 1;}
.picList1 dt a {font-weight: bold;}
.picList1 dd {margin-left: 135px;}
.picList1 dd.pic {margin: 0;position: absolute;left: 0;top: 0;}
.picList1 dd.pic img {vertical-align: middle;width: 120px;height: 150px;border: 1px solid #d1d1d1;background: #fff;padding: 1px;}
.picList1 dd.intro {margin-left: 135px;}
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
.txt_tab li a {width:170px;float:left;}
.txt_tab li span {display: inline-block;float: right;height: 22px;line-height: 22px;text-align: right;width: auto;}

.txt_tab_list li {padding-left: 34px;}
.txt_tab_list li a {width:150px;float:left;}
.txt_tab_list li span {display: inline-block;float: right;height: 22px;line-height: 22px;text-align: right;width: auto;}


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
.picList3 dd.intro {height:50px;overflow:hidden;color: #999;width: 118px;}
.topList3 {background: url(<?=$tplurl?>images/fy-line-201005.png) repeat;}
.topList3 li{background-image: url(<?=$tplurl?>images/fy-bg-201005.png);background-repeat: no-repeat;}
li.No1 {background-position: -380px -15px;}
.topList3 li span {background: #fff;margin-left: 16px;}
.topList3 li {height: 22px;line-height: 22px;overflow: hidden;position: relative;zoom: 0;}
.topList3 li span {margin-left:15px;}
.topList3 li span.author {position: absolute;top: 0;right: 0;padding: 0 0 0 5px;margin: 0;display: inline-table;}
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

.qyjp {border: 1px solid #CECECE;}
.qyjp dl {padding: 10px 0;margin-left: 5px;float: left;display: inline;width: 260px;}
.qyjp dt {display: block;float: left;margin-right: 5px;}
.qyjp img {display: inline-block;width: 120px;height: 146px;padding: 3px;border: 1px solid #ccc;vertical-align: top;}
.qyjp dd {float: left;width: 115px;height: 156px;line-height: 18px;position: relative;}
.qyjp dd h3 {color: #1886ac;margin-top:10px;margin-botton:10px;}
.qyjp dd a {color: #1886ac;}
.qyjp dd h4 {font-weight: 100;margin: 3px 0;font-size: 12px;}
.qyjp dd a {color: #1886ac;}
.qyjp dl p {width:213px;margin:0px;display: block;margin-bottom: 10px;text-indent: 2em;text-align: left;}
.qyjp dd p a {color: #2c2b2b;}
.qyjp dd span {bottom: 0;right: 0; position:absolute;right:43px;}
.qyjp dd span a {color: #ed590e;margin-right: 5px;}
</style>

<div id="main">

<?php $_leimu_hengfu_ad_1=_ctag_parse(array("ename" => "leimu_hengfu_ad_1","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "44","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_leimu_hengfu_ad_1 as $v){_aenter($v);?>
	<div class="adwimg" style="width:950px;"><a href="<?=$v['advurl']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "adimg_950_50","tclass" => "image","disabled" => "0","tname" => "$v[advimg]","maxwidth" => "950","maxheight" => "50",));if(!empty($u)){?>	<img width="950" height="50" src="<?=$u['url']?>" border="0" /><?php } unset($u);?></a></div><?php _aquit();} unset($_leimu_hengfu_ad_1,$v);?>


<div class="tab J_tab" style="width:350px; float:left;">
	 <!-- 重磅推荐&大神推荐 -->
	<div class="tab-menuWrapper" style="height:0px;"></div>
	<div class="J_tab-content" style="border: none; padding: 0px; display: block;">
		<div class="mod-bd" style="height:350px;">
<?php
if ($caid==2) {
?>
<?php $_fengmiantuwentuijian_dsyn=_ctag_parse(array("ename" => "fengmiantuwentuijian_dsyn","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "83","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_dsyn as $v){_aenter($v);?>
	<dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_dsyn,$v);?>

<?php
} elseif ($caid==4) {
?>
<?php $_fengmiantuwentuijian_xhqh=_ctag_parse(array("ename" => "fengmiantuwentuijian_xhqh","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "92","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_xhqh as $v){_aenter($v);?>
	<dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_xhqh,$v);?>

<?php
} elseif ($caid==5) {
?>
<?php $_fengmiantuwentuijian_wxxx=_ctag_parse(array("ename" => "fengmiantuwentuijian_wxxx","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "101","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_wxxx as $v){_aenter($v);?>
	<dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_wxxx,$v);?>

<?php
} elseif ($caid==6) {
?>
<?php $_fengmiantuwentuijian_lsjs=_ctag_parse(array("ename" => "fengmiantuwentuijian_lsjs","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "110","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_lsjs as $v){_aenter($v);?>
	<dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_lsjs,$v);?>

<?php
} elseif ($caid==7) {
?>
<?php $_fengmiantuwentuijian_wyjj=_ctag_parse(array("ename" => "fengmiantuwentuijian_wyjj","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "119","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_wyjj as $v){_aenter($v);?>
	<dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_wyjj,$v);?>

<?php
} elseif ($caid==17) {
?>
<?php $_fengmiantuwentuijian_khly=_ctag_parse(array("ename" => "fengmiantuwentuijian_khly","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "128","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_khly as $v){_aenter($v);?>
	<dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_khly,$v);?>

<?php
} elseif ($caid==3) {
?>
<?php $_fengmiantuwentuijian_dsyq=_ctag_parse(array("ename" => "fengmiantuwentuijian_dsyq","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "156","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_dsyq as $v){_aenter($v);?>
	    <dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_dsyq,$v);?>

<?php
} elseif ($caid==15) {
?>
<?php $_fengmiantuwentuijian_cycs=_ctag_parse(array("ename" => "fengmiantuwentuijian_cycs","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "165","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_cycs as $v){_aenter($v);?>
	    <dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_cycs,$v);?>

<?php
} elseif ($caid==16) {
?>
<?php $_fengmiantuwentuijian_qcxy=_ctag_parse(array("ename" => "fengmiantuwentuijian_qcxy","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "174","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_qcxy as $v){_aenter($v);?>
	    <dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_qcxy,$v);?>

<?php
} elseif ($caid==18) {
?>
<?php $_fengmiantuwentuijian_gzgd=_ctag_parse(array("ename" => "fengmiantuwentuijian_gzgd","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "183","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_gzgd as $v){_aenter($v);?>
	    <dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_gzgd,$v);?>

<?php
} elseif ($caid==19) {
?>
<?php $_fengmiantuwentuijian_xhnq=_ctag_parse(array("ename" => "fengmiantuwentuijian_xhnq","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "192","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_xhnq as $v){_aenter($v);?>
	    <dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_xhnq,$v);?>

<?php
} elseif ($caid==20) {
?>
<?php $_fengmiantuwentuijian_trdm=_ctag_parse(array("ename" => "fengmiantuwentuijian_trdm","tclass" => "farchives","disabled" => "0","limits" => "2","casource" => "201","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fengmiantuwentuijian_trdm as $v){_aenter($v);?>
	    <dl class="picList1">
<dt><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?=$v['subject']?></a></dt>
          <dd class="pic"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dd>
          <dt>作者：<?=$v['author']?></a></dt>
          <dd class="intro"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</dd>
          <dd class="upd"><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank">［点击阅读］</a></dd>
</dl>
<?php _aquit();} unset($_fengmiantuwentuijian_trdm,$v);?>

<?php
}
?>
		</div>
	</div>
	<!--END 重磅推荐&强力推荐 -->
</div>

<div id="txtbox" class="k1" style="width:375px;float:left;margin-left:7px;height:372px;padding-left:5px;">
	<br>
	<h2 style="font-size: 18px;font-family: "黑体","宋体";font-weight: normal;text-align: center;margin: 16px 0 12px;">
<?php
if ($caid==2) {
?>
<?php $_dawenzilianshang_dsyn=_ctag_parse(array("ename" => "dawenzilianshang_dsyn","tclass" => "farchives","limits" => "1","casource" => "84","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_dsyn as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_dsyn,$v);?>

<?php
} elseif ($caid==4) {
?>
<?php $_dawenzilianshang_xhqh=_ctag_parse(array("ename" => "dawenzilianshang_xhqh","tclass" => "farchives","limits" => "1","casource" => "93","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_xhqh as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_xhqh,$v);?>

<?php
} elseif ($caid==5) {
?>
<?php $_dawenzilianshang_wxxx=_ctag_parse(array("ename" => "dawenzilianshang_wxxx","tclass" => "farchives","limits" => "1","casource" => "102","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_wxxx as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_wxxx,$v);?>

<?php
} elseif ($caid==6) {
?>
<?php $_dawenzilianshang_lsjs=_ctag_parse(array("ename" => "dawenzilianshang_lsjs","tclass" => "farchives","limits" => "1","casource" => "111","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_lsjs as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_lsjs,$v);?>

<?php
} elseif ($caid==7) {
?>
<?php $_dawenzilianshang_wyjj=_ctag_parse(array("ename" => "dawenzilianshang_wyjj","tclass" => "farchives","limits" => "1","casource" => "120","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_wyjj as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_wyjj,$v);?>

<?php
} elseif ($caid==17) {
?>
<?php $_dawenzilianshang_khly=_ctag_parse(array("ename" => "dawenzilianshang_khly","tclass" => "farchives","limits" => "1","casource" => "129","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_khly as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_khly,$v);?>

<?php
} elseif ($caid==3) {
?>
<?php $_dawenzilianshang_dsyq=_ctag_parse(array("ename" => "dawenzilianshang_dsyq","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "157","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_dsyq as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_dsyq,$v);?>

<?php
} elseif ($caid==15) {
?>
<?php $_dawenzilianshang_cycs=_ctag_parse(array("ename" => "dawenzilianshang_cycs","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "166","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_cycs as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_cycs,$v);?>

<?php
} elseif ($caid==16) {
?>
<?php $_dawenzilianshang_qcxy=_ctag_parse(array("ename" => "dawenzilianshang_qcxy","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "175","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_qcxy as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_qcxy,$v);?>

<?php
} elseif ($caid==18) {
?>
<?php $_dawenzilianshang_gzgd=_ctag_parse(array("ename" => "dawenzilianshang_gzgd","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "184","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_gzgd as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_gzgd,$v);?>

<?php
} elseif ($caid==19) {
?>
<?php $_dawenzilianshang_xhnq=_ctag_parse(array("ename" => "dawenzilianshang_xhnq","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "193","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_xhnq as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_xhnq,$v);?>

<?php
} elseif ($caid==20) {
?>
<?php $_dawenzilianshang_trdm=_ctag_parse(array("ename" => "dawenzilianshang_trdm","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "202","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianshang_trdm as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianshang_trdm,$v);?>

<?php
}
?>

	</h2>
	
	<ul class="list2col clearfix">
<?php
if ($caid==2) {
?>
<?php $_xiaowenzilianshang_dsyn=_ctag_parse(array("ename" => "xiaowenzilianshang_dsyn","tclass" => "farchives","limits" => "10","casource" => "85","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_dsyn as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_dsyn,$v);?>

<?php
} elseif ($caid==4) {
?>
<?php $_xiaowenzilianshang_xhqh=_ctag_parse(array("ename" => "xiaowenzilianshang_xhqh","tclass" => "farchives","limits" => "10","casource" => "94","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_xhqh as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_xhqh,$v);?>

<?php
} elseif ($caid==5) {
?>
<?php $_xiaowenzilianshang_wxxx=_ctag_parse(array("ename" => "xiaowenzilianshang_wxxx","tclass" => "farchives","limits" => "10","casource" => "103","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_wxxx as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_wxxx,$v);?>

<?php
} elseif ($caid==6) {
?>
<?php $_xiaowenzilianshang_lsjs=_ctag_parse(array("ename" => "xiaowenzilianshang_lsjs","tclass" => "farchives","limits" => "10","casource" => "112","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_lsjs as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_lsjs,$v);?>

<?php
} elseif ($caid==7) {
?>
<?php $_xiaowenzilianshang_wyjj=_ctag_parse(array("ename" => "xiaowenzilianshang_wyjj","tclass" => "farchives","limits" => "10","casource" => "121","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_wyjj as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_wyjj,$v);?>

<?php
} elseif ($caid==17) {
?>
<?php $_xiaowenzilianshang_khly=_ctag_parse(array("ename" => "xiaowenzilianshang_khly","tclass" => "farchives","limits" => "10","casource" => "130","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_khly as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_khly,$v);?>

<?php
} elseif ($caid==3) {
?>
<?php $_xiaowenzilianshang_dsyq=_ctag_parse(array("ename" => "xiaowenzilianshang_dsyq","tclass" => "farchives","disabled" => "0","casource" => "158","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_dsyq as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_dsyq,$v);?>

<?php
} elseif ($caid==15) {
?>
<?php $_xiaowenzilianshang_cycs=_ctag_parse(array("ename" => "xiaowenzilianshang_cycs","tclass" => "farchives","disabled" => "0","casource" => "167","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_cycs as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_cycs,$v);?>

<?php
} elseif ($caid==16) {
?>
<?php $_xiaowenzilianshang_qcxy=_ctag_parse(array("ename" => "xiaowenzilianshang_qcxy","tclass" => "farchives","disabled" => "0","casource" => "176","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_qcxy as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_qcxy,$v);?>

<?php
} elseif ($caid==18) {
?>
<?php $_xiaowenzilianshang_gzgd=_ctag_parse(array("ename" => "xiaowenzilianshang_gzgd","tclass" => "farchives","disabled" => "0","casource" => "185","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_gzgd as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_gzgd,$v);?>

<?php
} elseif ($caid==19) {
?>
<?php $_xiaowenzilianshang_xhnq=_ctag_parse(array("ename" => "xiaowenzilianshang_xhnq","tclass" => "farchives","disabled" => "0","casource" => "194","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_xhnq as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_xhnq,$v);?>

<?php
} elseif ($caid==20) {
?>
<?php $_xiaowenzilianshang_trdm=_ctag_parse(array("ename" => "xiaowenzilianshang_trdm","tclass" => "farchives","disabled" => "0","casource" => "203","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianshang_trdm as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianshang_trdm,$v);?>

<?php
}
?>

	</ul>
	<br><br>
	<h2 style="font-size: 18px;font-family: "黑体","宋体";font-weight: normal;text-align: center;margin: 16px 0 12px;">
<?php
if ($caid==2) {
?>
<?php $_dawenzilianxia_dsyn=_ctag_parse(array("ename" => "dawenzilianxia_dsyn","tclass" => "farchives","limits" => "1","casource" => "86","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_dsyn as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_dsyn,$v);?>

<?php
} elseif ($caid==4) {
?>
<?php $_dawenzilianxia_xhqh=_ctag_parse(array("ename" => "dawenzilianxia_xhqh","tclass" => "farchives","limits" => "1","casource" => "95","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_xhqh as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_xhqh,$v);?>

<?php
} elseif ($caid==5) {
?>
<?php $_dawenzilianxia_wxxx=_ctag_parse(array("ename" => "dawenzilianxia_wxxx","tclass" => "farchives","limits" => "1","casource" => "104","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_wxxx as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_wxxx,$v);?>

<?php
} elseif ($caid==6) {
?>
<?php $_dawenzilianxia_lsjs=_ctag_parse(array("ename" => "dawenzilianxia_lsjs","tclass" => "farchives","limits" => "1","casource" => "113","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_lsjs as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_lsjs,$v);?>

<?php
} elseif ($caid==7) {
?>
<?php $_dawenzilianxia_wyjj=_ctag_parse(array("ename" => "dawenzilianxia_wyjj","tclass" => "farchives","limits" => "1","casource" => "122","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_wyjj as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_wyjj,$v);?>

<?php
} elseif ($caid==17) {
?>
<?php $_dawenzilianxia_khly=_ctag_parse(array("ename" => "dawenzilianxia_khly","tclass" => "farchives","limits" => "1","casource" => "131","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_khly as $v){_aenter($v);?>
<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_khly,$v);?>

<?php
} elseif ($caid==3) {
?>
<?php $_dawenzilianxia_dsyq=_ctag_parse(array("ename" => "dawenzilianxia_dsyq","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "159","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_dsyq as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_dsyq,$v);?>

<?php
} elseif ($caid==15) {
?>
<?php $_dawenzilianxia_cycs=_ctag_parse(array("ename" => "dawenzilianxia_cycs","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "168","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_cycs as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_cycs,$v);?>

<?php
} elseif ($caid==16) {
?>
<?php $_dawenzilianxia_qcxy=_ctag_parse(array("ename" => "dawenzilianxia_qcxy","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "177","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_qcxy as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_qcxy,$v);?>

<?php
} elseif ($caid==18) {
?>
<?php $_dawenzilianxia_gzgd=_ctag_parse(array("ename" => "dawenzilianxia_gzgd","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "186","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_gzgd as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_gzgd,$v);?>

<?php
} elseif ($caid==19) {
?>
<?php $_dawenzilianxia_xhnq=_ctag_parse(array("ename" => "dawenzilianxia_xhnq","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "195","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_xhnq as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_xhnq,$v);?>

<?php
} elseif ($caid==20) {
?>
<?php $_dawenzilianxia_trdm=_ctag_parse(array("ename" => "dawenzilianxia_trdm","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "204","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_dawenzilianxia_trdm as $v){_aenter($v);?>
	<a style="color: #d91c23;" href="<?=$v['link']?>" target="_blank" title="<?=$v['subject']?>"><?=$v['subject']?></a><?php _aquit();} unset($_dawenzilianxia_trdm,$v);?>

<?php
}
?>

	</h2>
	
	<ul class="list2col clearfix">
<?php
if ($caid==2) {
?>
<?php $_xiaowenzilianxia_dsyn=_ctag_parse(array("ename" => "xiaowenzilianxia_dsyn","tclass" => "farchives","limits" => "10","casource" => "87","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_dsyn as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_dsyn,$v);?>

<?php
} elseif ($caid==4) {
?>
<?php $_xiaowenzilianxia_xhqh=_ctag_parse(array("ename" => "xiaowenzilianxia_xhqh","tclass" => "farchives","limits" => "10","casource" => "96","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_xhqh as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_xhqh,$v);?>

<?php
} elseif ($caid==5) {
?>
<?php $_xiaowenzilianxia_wxxx=_ctag_parse(array("ename" => "xiaowenzilianxia_wxxx","tclass" => "farchives","limits" => "10","casource" => "105","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_wxxx as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_wxxx,$v);?>

<?php
} elseif ($caid==6) {
?>
<?php $_xiaowenzilianxia_lsjs=_ctag_parse(array("ename" => "xiaowenzilianxia_lsjs","tclass" => "farchives","limits" => "10","casource" => "114","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_lsjs as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_lsjs,$v);?>

<?php
} elseif ($caid==7) {
?>
<?php $_xiaowenzilianxia_wyjj=_ctag_parse(array("ename" => "xiaowenzilianxia_wyjj","tclass" => "farchives","limits" => "10","casource" => "123","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_wyjj as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_wyjj,$v);?>

<?php
} elseif ($caid==17) {
?>
<?php $_xiaowenzilianxia_khly=_ctag_parse(array("ename" => "xiaowenzilianxia_khly","tclass" => "farchives","limits" => "10","casource" => "132","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_khly as $v){_aenter($v);?>
<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_khly,$v);?>

<?php
} elseif ($caid==3) {
?>
<?php $_xiaowenzilianxia_dsyq=_ctag_parse(array("ename" => "xiaowenzilianxia_dsyq","tclass" => "farchives","disabled" => "0","casource" => "160","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_dsyq as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_dsyq,$v);?>

<?php
} elseif ($caid==15) {
?>
<?php $_xiaowenzilianxia_cycs=_ctag_parse(array("ename" => "xiaowenzilianxia_cycs","tclass" => "farchives","disabled" => "0","casource" => "169","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_cycs as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_cycs,$v);?>

<?php
} elseif ($caid==16) {
?>
<?php $_xiaowenzilianxia_qcxy=_ctag_parse(array("ename" => "xiaowenzilianxia_qcxy","tclass" => "farchives","disabled" => "0","casource" => "178","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_qcxy as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_qcxy,$v);?>

<?php
} elseif ($caid==18) {
?>
<?php $_xiaowenzilianxia_gzgd=_ctag_parse(array("ename" => "xiaowenzilianxia_gzgd","tclass" => "farchives","disabled" => "0","casource" => "187","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_gzgd as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_gzgd,$v);?>

<?php
} elseif ($caid==19) {
?>
<?php $_xiaowenzilianxia_xhnq=_ctag_parse(array("ename" => "xiaowenzilianxia_xhnq","tclass" => "farchives","disabled" => "0","casource" => "196","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_xhnq as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_xhnq,$v);?>

<?php
} elseif ($caid==20) {
?>
<?php $_xiaowenzilianxia_trdm=_ctag_parse(array("ename" => "xiaowenzilianxia_trdm","tclass" => "farchives","disabled" => "0","casource" => "205","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_xiaowenzilianxia_trdm as $v){_aenter($v);?>
	<li><a title="<?=$v['subject']?>" target="_blank" href="<?=$v['link']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_xiaowenzilianxia_trdm,$v);?>

<?php
}
?>

	</ul>
</div>

<div class="tab J_tab" style="width:205px;float:right;margit:5px;margin-left: 5px;">
	<div class="tab-menuWrapper">
		<h2 class="J_tab-menu active"><span><?=$catalog?>强推</span></h2>
		<div class="tab-menu-m"><a href="/index.php?caid=2&ccid7=38" target="_blank">更多</a></div>
	</div>
	<div class="tab-contentWrapper">
		<div class="J_tab-content" style="height: 319px;overflow: hidden;display: block;">
			<ul class="list1" style="overflow: hidden;">
<?php
if ($caid==2) {
?>
<?php $_fenleiqiangtui_dsyn=_ctag_parse(array("ename" => "fenleiqiangtui_dsyn","tclass" => "farchives","limits" => "15","casource" => "88","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_dsyn as $v){_aenter($v);?>
<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_dsyn,$v);?>

<?php
} elseif ($caid==4) {
?>
<?php $_fenleiqiangtui_xhqh=_ctag_parse(array("ename" => "fenleiqiangtui_xhqh","tclass" => "farchives","limits" => "15","casource" => "97","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_xhqh as $v){_aenter($v);?>
<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_xhqh,$v);?>

<?php
} elseif ($caid==5) {
?>
<?php $_fenleiqiangtui_wxxx=_ctag_parse(array("ename" => "fenleiqiangtui_wxxx","tclass" => "farchives","disabled" => "0","limits" => "15","casource" => "106","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_wxxx as $v){_aenter($v);?>
<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_wxxx,$v);?>

<?php
} elseif ($caid==6) {
?>
<?php $_fenleiqiangtui_lsjs=_ctag_parse(array("ename" => "fenleiqiangtui_lsjs","tclass" => "farchives","limits" => "15","casource" => "115","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_lsjs as $v){_aenter($v);?>
<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_lsjs,$v);?>

<?php
} elseif ($caid==7) {
?>
<?php $_fenleiqiangtui_wyjj=_ctag_parse(array("ename" => "fenleiqiangtui_wyjj","tclass" => "farchives","limits" => "15","casource" => "124","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_wyjj as $v){_aenter($v);?>
<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_wyjj,$v);?>

<?php
} elseif ($caid==17) {
?>
<?php $_fenleiqiangtui_khly=_ctag_parse(array("ename" => "fenleiqiangtui_khly","tclass" => "farchives","limits" => "15","casource" => "133","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_khly as $v){_aenter($v);?>
<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_khly,$v);?>

<?php
} elseif ($caid==3) {
?>
<?php $_fenleiqiangtui_dsyq=_ctag_parse(array("ename" => "fenleiqiangtui_dsyq","tclass" => "farchives","disabled" => "0","limits" => "15","casource" => "161","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_dsyq as $v){_aenter($v);?>
	<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_dsyq,$v);?>

<?php
} elseif ($caid==15) {
?>
<?php $_fenleiqiangtui_cycs=_ctag_parse(array("ename" => "fenleiqiangtui_cycs","tclass" => "farchives","disabled" => "0","limits" => "15","casource" => "170","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_cycs as $v){_aenter($v);?>
	<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_cycs,$v);?>

<?php
} elseif ($caid==16) {
?>
<?php $_fenleiqiangtui_qcxy=_ctag_parse(array("ename" => "fenleiqiangtui_qcxy","tclass" => "farchives","disabled" => "0","limits" => "15","casource" => "179","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_qcxy as $v){_aenter($v);?>
	<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_qcxy,$v);?>

<?php
} elseif ($caid==18) {
?>
<?php $_fenleiqiangtui_gzgd=_ctag_parse(array("ename" => "fenleiqiangtui_gzgd","tclass" => "farchives","disabled" => "0","limits" => "15","casource" => "188","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_gzgd as $v){_aenter($v);?>
	<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_gzgd,$v);?>

<?php
} elseif ($caid==19) {
?>
<?php $_fenleiqiangtui_xhnq=_ctag_parse(array("ename" => "fenleiqiangtui_xhnq","tclass" => "farchives","disabled" => "0","limits" => "15","casource" => "197","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_xhnq as $v){_aenter($v);?>
	    <li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_xhnq,$v);?>

<?php
} elseif ($caid==20) {
?>
<?php $_fenleiqiangtui_trdm=_ctag_parse(array("ename" => "fenleiqiangtui_trdm","tclass" => "farchives","disabled" => "0","limits" => "15","casource" => "206","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_fenleiqiangtui_trdm as $v){_aenter($v);?>
	<li>《<a target="_blank" href="/archive.php?aid=<?=$v['xsid']?>"><?=$v['subject']?></a>》</li><?php _aquit();} unset($_fenleiqiangtui_trdm,$v);?>

<?php
}
?>

      		</ul>
		</div>
	</div>
</div>
<style type="text/css">
.leimutu {border: 1px solid #CECECE;width:130px;float: left;margin-top:5px;margin-left:13px;height: 180px;overflow: hidden;margin-bottom: 5px;overflow: hidden;}
.leimutu b{float: left;   height: 145px; margin: 0 30px; width: 113px;text-align: center;}
.leimutu b u {margin-left:-40px;}
.leimutu b img {width: 110px;height: 137px;margin-top: 5px;}
.leimutu i {	color: #999999;    float: left;    font-size: 12px;    font-style: normal;    height: 16px;    line-height: 16px;    overflow: hidden;text-align: center;width: 100%;}
.leimutu  em {float: left;   font-size: 12px;   font-style: normal;   font-weight: bold;height: 22px;line-height: 22px;overflow: hidden;text-align: center;width: 100%;}
</style>
<div class="finish_list" style="width:736px; float:left;border: 1px solid #CECECE;height: 383px;">
<?php
if ($caid==2) {
?>
<?php $_shifujingpintuijian_dsyn=_ctag_parse(array("ename" => "shifujingpintuijian_dsyn","tclass" => "farchives","limits" => "10","casource" => "89","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_dsyn as $v){_aenter($v);?>
<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_dsyn,$v);?>

<?php
} elseif ($caid==4) {
?>
<?php $_shifujingpintuijian_xhqh=_ctag_parse(array("ename" => "shifujingpintuijian_xhqh","tclass" => "farchives","limits" => "10","casource" => "98","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_xhqh as $v){_aenter($v);?>
<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_xhqh,$v);?>

<?php
} elseif ($caid==5) {
?>
<?php $_shifujingpintuijian_wxxx=_ctag_parse(array("ename" => "shifujingpintuijian_wxxx","tclass" => "farchives","limits" => "10","casource" => "107","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_wxxx as $v){_aenter($v);?>
<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_wxxx,$v);?>

<?php
} elseif ($caid==6) {
?>
<?php $_shifujingpintuijian_lsjs=_ctag_parse(array("ename" => "shifujingpintuijian_lsjs","tclass" => "farchives","limits" => "10","casource" => "116","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_lsjs as $v){_aenter($v);?>
<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_lsjs,$v);?>

<?php
} elseif ($caid==7) {
?>
<?php $_shifujingpintuijian_wyjj=_ctag_parse(array("ename" => "shifujingpintuijian_wyjj","tclass" => "farchives","limits" => "10","casource" => "125","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_wyjj as $v){_aenter($v);?>
<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_wyjj,$v);?>

<?php
} elseif ($caid==17) {
?>
<?php $_shifujingpintuijian_khly=_ctag_parse(array("ename" => "shifujingpintuijian_khly","tclass" => "farchives","limits" => "10","casource" => "134","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_khly as $v){_aenter($v);?>
<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_khly,$v);?>

<?php
} elseif ($caid==3) {
?>
<?php $_shifujingpintuijian_dsyq=_ctag_parse(array("ename" => "shifujingpintuijian_dsyq","tclass" => "farchives","disabled" => "0","casource" => "162","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_dsyq as $v){_aenter($v);?>
	<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_dsyq,$v);?>

<?php
} elseif ($caid==15) {
?>
<?php $_shifujingpintuijian_cycs=_ctag_parse(array("ename" => "shifujingpintuijian_cycs","tclass" => "farchives","disabled" => "0","casource" => "171","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_cycs as $v){_aenter($v);?>
	<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_cycs,$v);?>

<?php
} elseif ($caid==16) {
?>
<?php $_shifujingpintuijian_qcxy=_ctag_parse(array("ename" => "shifujingpintuijian_qcxy","tclass" => "farchives","disabled" => "0","casource" => "180","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_qcxy as $v){_aenter($v);?>
	<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_qcxy,$v);?>

<?php
} elseif ($caid==18) {
?>
<?php $_shifujingpintuijian_gzgd=_ctag_parse(array("ename" => "shifujingpintuijian_gzgd","tclass" => "farchives","disabled" => "0","casource" => "189","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_gzgd as $v){_aenter($v);?>
	<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_gzgd,$v);?>

<?php
} elseif ($caid==19) {
?>
<?php $_shifujingpintuijian_xhnq=_ctag_parse(array("ename" => "shifujingpintuijian_xhnq","tclass" => "farchives","disabled" => "0","casource" => "198","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_xhnq as $v){_aenter($v);?>
	<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_xhnq,$v);?>

<?php
} elseif ($caid==20) {
?>
<?php $_shifujingpintuijian_trdm=_ctag_parse(array("ename" => "shifujingpintuijian_trdm","tclass" => "farchives","disabled" => "0","casource" => "207","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_shifujingpintuijian_trdm as $v){_aenter($v);?>
	<div class="leimutu">
      <b><u><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic_105_137","tclass" => "image","tname" => "$v[pic]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>" /><?php } unset($u);?></a></u></b>
      <i>[<?=$v['fenlei']?>]</i>
      <em><a href="/archive.php?aid=<?=$v['xsid']?>" title="<?=$v['subject']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></em>
</div>
<?php _aquit();} unset($_shifujingpintuijian_trdm,$v);?>

<?php
}
?>

</div>

<div class="tab J_tab" style="width:205px;float:right;margit:5px;margin-left: 5px;">
	<div class="tab-menuWrapper">
		<h2 class="J_tab-menu active"><span>全站强推</span></h2>
		<div class="tab-menu-m"><a href="/index.php?caid=24&action=tuijian" target="_blank">更多</a></div>
	</div>
	<div class="tab-contentWrapper">
		<div class="J_tab-content" style="display: block;">
			<ul class="list1">
               	 <?php $_leimu_quanzhanqiangtuilist=_ctag_parse(array("ename" => "leimu_quanzhanqiangtuilist","tclass" => "archives","disabled" => "0","limits" => "15","caidson" => "1","casource" => "1","caids" => "1,2,4,5,6,7,17,14,3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "scores_desc","closed" => "-1","abover" => "-1",));foreach($_leimu_quanzhanqiangtuilist as $v){_aenter($v);?>
<li><span class="sort">[<?=$v['catalog']?>]</span>《<a target="_blank" href="<?=$v['arcurl']?>" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject20","tclass" => "odeal","disabled" => "0","tname" => "$v[subject]","trim" => "26",));?>
</a>》</li><?php _aquit();} unset($_leimu_quanzhanqiangtuilist,$v);?>

      		</ul>
		</div>
	</div>
</div>


      
<div class="blank3"></div>
<?php $_leimu_hengfu_ad_2=_ctag_parse(array("ename" => "leimu_hengfu_ad_2","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "45","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_leimu_hengfu_ad_2 as $v){_aenter($v);?>
	    <div class="adwimg" style="width:950px;"><a href="<?=$v['advurl']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "adimg_950_50","tclass" => "image","disabled" => "0","tname" => "$v[advimg]","maxwidth" => "950","maxheight" => "50",));if(!empty($u)){?>	<img width="950" height="50" src="<?=$u['url']?>" border="0" /><?php } unset($u);?></a></div><?php _aquit();} unset($_leimu_hengfu_ad_2,$v);?>

<div class="blank3"></div>

</style>
<div style="width:200px;float:left">
	<div id="lm2" class="lmc" style="width:200px;float:left;">
		<dl><dt><?=$catalog?> 打赏榜<span><a href="/index.php?caid=24&action=dashang">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab_list" id="dd_11">
			<ul><?php $_leimu_dashangbang=_ctag_parse(array("ename" => "leimu_dashangbang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "2","caids" => "2,4,5,6,7,17","chsource" => "2","chids" => "4","orderby" => "orders_desc","closed" => "-1","abover" => "-1",));foreach($_leimu_dashangbang as $v){_aenter($v);?>
	                        <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_leimu_dashangbang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
	<br>
	<div id="lm2" class="lmc" style="width:200px;float:left;">
		<dl><dt><?=$catalog?> 订阅榜<span><a href="/index.php?caid=24&action=dingyue">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab_list" id="dd_11">
			<ul><?php $_leimu_dingyuebang=_ctag_parse(array("ename" => "leimu_dingyuebang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "2","caids" => "2,4,5,6,7,17","chsource" => "2","chids" => "4","orderby" => "orders_desc","closed" => "-1","abover" => "-1",));foreach($_leimu_dingyuebang as $v){_aenter($v);?>
	                                <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_leimu_dingyuebang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
</div>

<div class="content-lr clearfix qyjp" style="width:535px;margin-left:7px;float:left;height:542px;">
    <!--第三部分 开始--> 
<?php
if ($caid==2) {
?>
<?php $_zhongxinsifutuijian_dsyn=_ctag_parse(array("ename" => "zhongxinsifutuijian_dsyn","tclass" => "farchives","limits" => "4","casource" => "90","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_dsyn as $v){_aenter($v);?>
<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_dsyn,$v);?>

<?php
} elseif ($caid==4) {
?>
<?php $_zhongxinsifutuijian_xhqh=_ctag_parse(array("ename" => "zhongxinsifutuijian_xhqh","tclass" => "farchives","limits" => "4","casource" => "99","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_xhqh as $v){_aenter($v);?>
<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_xhqh,$v);?>

<?php
} elseif ($caid==5) {
?>
<?php $_zhongxinsifutuijian_wxxx=_ctag_parse(array("ename" => "zhongxinsifutuijian_wxxx","tclass" => "farchives","limits" => "4","casource" => "108","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_wxxx as $v){_aenter($v);?>
<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_wxxx,$v);?>

<?php
} elseif ($caid==6) {
?>
<?php $_zhongxinsifutuijian_lsjs=_ctag_parse(array("ename" => "zhongxinsifutuijian_lsjs","tclass" => "farchives","limits" => "4","casource" => "117","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_lsjs as $v){_aenter($v);?>
<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_lsjs,$v);?>

<?php
} elseif ($caid==7) {
?>
<?php $_zhongxinsifutuijian_wyjj=_ctag_parse(array("ename" => "zhongxinsifutuijian_wyjj","tclass" => "farchives","limits" => "4","casource" => "126","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_wyjj as $v){_aenter($v);?>
<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_wyjj,$v);?>

<?php
} elseif ($caid==17) {
?>
<?php $_zhongxinsifutuijian_khly=_ctag_parse(array("ename" => "zhongxinsifutuijian_khly","tclass" => "farchives","limits" => "4","casource" => "135","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_khly as $v){_aenter($v);?>
<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_khly,$v);?>

<?php
} elseif ($caid==3) {
?>
<?php $_zhongxinsifutuijian_dsyq=_ctag_parse(array("ename" => "zhongxinsifutuijian_dsyq","tclass" => "farchives","disabled" => "0","limits" => "4","casource" => "163","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_dsyq as $v){_aenter($v);?>
	<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_dsyq,$v);?>

<?php
} elseif ($caid==15) {
?>
<?php $_zhongxinsifutuijian_cycs=_ctag_parse(array("ename" => "zhongxinsifutuijian_cycs","tclass" => "farchives","disabled" => "0","limits" => "4","casource" => "172","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_cycs as $v){_aenter($v);?>
	<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_cycs,$v);?>

<?php
} elseif ($caid==16) {
?>
<?php $_zhongxinsifutuijian_qcxy=_ctag_parse(array("ename" => "zhongxinsifutuijian_qcxy","tclass" => "farchives","disabled" => "0","limits" => "4","casource" => "181","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_qcxy as $v){_aenter($v);?>
	<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_qcxy,$v);?>

<?php
} elseif ($caid==18) {
?>
<?php $_zhongxinsifutuijian_gzgd=_ctag_parse(array("ename" => "zhongxinsifutuijian_gzgd","tclass" => "farchives","disabled" => "0","limits" => "4","casource" => "190","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_gzgd as $v){_aenter($v);?>
	<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_gzgd,$v);?>

<?php
} elseif ($caid==19) {
?>
<?php $_zhongxinsifutuijian_xhnq=_ctag_parse(array("ename" => "zhongxinsifutuijian_xhnq","tclass" => "farchives","disabled" => "0","limits" => "4","casource" => "199","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_xhnq as $v){_aenter($v);?>
	<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_xhnq,$v);?>

<?php
} elseif ($caid==20) {
?>
<?php $_zhongxinsifutuijian_trdm=_ctag_parse(array("ename" => "zhongxinsifutuijian_trdm","tclass" => "farchives","disabled" => "0","limits" => "4","casource" => "208","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_zhongxinsifutuijian_trdm as $v){_aenter($v);?>
	<dl>
      <dt><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "pic","tclass" => "image","tname" => "$v[pic]","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url']?>" /><?php } unset($u);?></a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</h3>
            <h4>作者：<a href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert('<?=$v['xsid']?>');">[加入书架]</a><br>
            <a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid=<?=$v['xsid']?>" target="_blank"><?php echo _utag_parse(array("ename" => "jianjie120","tclass" => "odeal","tname" => "$v[jianjie]","dealhtml" => "clearhtml","trim" => "120",));?>
...</a></p>
      </dd>
</dl>
<?php _aquit();} unset($_zhongxinsifutuijian_trdm,$v);?>

<?php
}
?>
</div>

<div style="width:200px;float:right;">
	<div id="lm2" class="lmc" style="width:200px;float:left;">
		<dl><dt><?=$catalog?> 点击榜<span><a href="/index.php?caid=24&action=dianji">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab_list" id="dd_11">
			<ul><?php $_leimu_dianjibang=_ctag_parse(array("ename" => "leimu_dianjibang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "2","caids" => "2,4,5,6,7,17","chsource" => "2","chids" => "4","orderby" => "clicks_desc","closed" => "-1","abover" => "-1",));foreach($_leimu_dianjibang as $v){_aenter($v);?>
	                                <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_leimu_dianjibang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
	<br>
	<div id="lm2" class="lmc" style="width:200px;float:left;">
		<dl><dt><?=$catalog?> 推荐榜<span><a href="/index.php?caid=24&action=tuijian">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab_list" id="dd_11">
			<ul><?php $_leimu_tuijianbang=_ctag_parse(array("ename" => "leimu_tuijianbang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "2","caids" => "2,4,5,6,7,17","chsource" => "2","chids" => "4","orderby" => "praises_desc","closed" => "-1","abover" => "-1",));foreach($_leimu_tuijianbang as $v){_aenter($v);?>
	                            <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_leimu_tuijianbang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
</div>

<div class="blank3"></div>
<?php $_leimu_hengfu_ad_3=_ctag_parse(array("ename" => "leimu_hengfu_ad_3","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "46","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_leimu_hengfu_ad_3 as $v){_aenter($v);?>
	    <div class="adwimg" style="width:950px;"><a href="<?=$v['advurl']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "adimg_950_50","tclass" => "image","disabled" => "0","tname" => "$v[advimg]","maxwidth" => "950","maxheight" => "50",));if(!empty($u)){?>	<img width="950" height="50" src="<?=$u['url']?>" border="0" /><?php } unset($u);?></a></div><?php _aquit();} unset($_leimu_hengfu_ad_3,$v);?>

<div class="blank3"></div>


<div style="width:230px;float:left;margin-left:2px;">
	<div id="lm2" class="lmc" style="width:230px;float:right;">
		<dl><dt>最新入库<span><a href="/index.php?caid=24&action=zuixin">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_leimu_zuixinruku=_ctag_parse(array("ename" => "leimu_zuixinruku","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "2","caids" => "2,4,5,6,7,17","chsource" => "2","chids" => "4","orderby" => "createdate_desc","closed" => "-1","abover" => "-1",));foreach($_leimu_zuixinruku as $v){_aenter($v);?>
	                            <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_leimu_zuixinruku,$v);?>
</ul>
		</dd>
		</dl>
	</div>
	<br>
	<div id="lm2" class="lmc" style="width:230px;float:right;">
		<dl><dt>精品书评</span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_remenshupinglist=_ptag_parse(array("ename" => "remenshupinglist","tclass" => "outinfos","disabled" => "0","dsid" => "0","sqlstr" => "SELECT * FROM `xs_comments` ORDER BY votes1 DESC","length" => "10",));foreach($_remenshupinglist as $v){_aenter($v);?>
			<li><a href="comments.php?aid=<?=$v['aid']?>" title="<?=$v['content']?>" target="_blank" class="vip_<?=$v['sn_row']?>"><?php echo _utag_parse(array("ename" => "content24","tclass" => "odeal","tname" => "$v[content]","dealhtml" => "clearhtml","trim" => "24","wordlink" => "1",));?>
</a><span><?=$v['votes1']?></span></li><?php _aquit();} unset($_remenshupinglist,$v);?>
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
		<dl><dt>新书<span><a href="/index.php?caid=1&ccid7=38">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_quanzhan_xinshubang=_ctag_parse(array("ename" => "quanzhan_xinshubang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "1","caids" => "1,2,4,5,6,7,17,14,3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "createdate_desc","closed" => "-1","abover" => "-1",));foreach($_quanzhan_xinshubang as $v){_aenter($v);?>
	                                <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_quanzhan_xinshubang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
	<br>
	<div id="lm2" class="lmc" style="width:230px;float:right;">
		<dl><dt>推荐榜<span><a href="/index.php?caid=1&ccid7=38">更多&gt;&gt;</a></span></dt>
		<dd class="txt_tab" id="dd_11">
			<ul><?php $_quanzhan_tuijianbang=_ctag_parse(array("ename" => "quanzhan_tuijianbang","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "1","caids" => "1,2,4,5,6,7,17,14,3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "praises_desc","closed" => "-1","abover" => "-1",));foreach($_quanzhan_tuijianbang as $v){_aenter($v);?>
	                            <li><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>" target="_blank" class="vip_<?=$v['ccid3']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
<? if(($v['ccid3'])) { ?><font style="color:red;font-size:10px;">[VIP]</font><? } ?></a><span>&nbsp;</span></li><?php _aquit();} unset($_quanzhan_tuijianbang,$v);?>
</ul>
		</dd>
		</dl>
	</div>
</div>


<div class="blank3"></div>
<?php $_leimu_hengfu_ad_4=_ctag_parse(array("ename" => "leimu_hengfu_ad_4","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "47","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_leimu_hengfu_ad_4 as $v){_aenter($v);?>
	    <div class="adwimg" style="width:950px;"><a href="<?=$v['advurl']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "adimg_950_50","tclass" => "image","disabled" => "0","tname" => "$v[advimg]","maxwidth" => "950","maxheight" => "50",));if(!empty($u)){?>	<img width="950" height="50" src="<?=$u['url']?>" border="0" /><?php } unset($u);?></a></div><?php _aquit();} unset($_leimu_hengfu_ad_4,$v);?>



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