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
</head>
<body>
<!-- 顶部 begin -->
<div id="top">
<div class="left orangea"><script language="javascript"  src="<?=$cms_abs?>login.php?mode=js&sid=<?=$sid?>"></script></div>
<div class="right">【<a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<?=$cms_abs?>');" style="cursor:hand">设为首页</a>】【<a href="#" onClick="javascript:window.external.AddFavorite('<?=$cms_abs?>','<?=$cmsname?>');">收藏本站</a>】</div>
</div>
<!-- 首体 begin -->
<div id="head" style="border: 1px #e0e0e0 solid;">
<div class="left"><a href="<?=$cms_abs?>" ><img src="<?=$cms_abs?><?=$cmslogo?>" /></a></div>
<div class="right">
<div class="r1"><ul>
<?php $_txt_banner=_ctag_parse(array("ename" => "txt_banner","tclass" => "farchives","limits" => "3","cols" => "1","casource" => "5","orderby" => "vieworder_desc",));foreach($_txt_banner as $v){_aenter($v);?>
<li><a href="<?=$v['advurl']?>" target="_blank" title="<?=$v['alttext']?>"><?=$v['subject']?></a></li><?php _aquit();} unset($_txt_banner,$v);?>

</ul></div>
<div class="r2"><div class="search" id="searchbox" style="width:650px;margin-top:30px;">
<table cellpadding="0">
<tr>
<form id="searchform" action="<?=$cmsurl?>search.php?sid=<?=$sid?>" method="get" target="_blank">
<td width="30px" valign="middle"><img src="<?=$tplurl?>images/ico_search.gif" /></td>
<td width="60px;" valign="middle"><b>站内搜索</b></td>
<td width="100px;" id="seach_y"><input name="searchword" value="推荐热门小说" type="text" style="width:260px" maxlength="18" onclick="this.value=''" /></td>
<td width="60px;"><input type="hidden" name="searchsubmit" value="1"><input src="<?=$tplurl?>images/b_s.gif"  type="image" width="52" height="21" id="Image12" /></td>

<td width="40px">热词：</td>
<td width="220px"><?php $_search_reci_list=_ctag_parse(array("ename" => "search_reci_list","tclass" => "farchives","limits" => "3","casource" => "56","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_search_reci_list as $v){_aenter($v);?>
	<b><a target="_blank" href="<?=$v['rc_link']?>" <? if($v['rc_tuchu']) { ?>style="color:#FF0000;"<? } ?>><?=$v['subject']?></a></b><?php _aquit();} unset($_search_reci_list,$v);?>
</td>

</form>
</tr>
</table>
</div></div>
</div>
</div>
<!-- 首体 begin -->
<script type="text/javascript">

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

</script>
<!--  -->
<div id="menu">
<div class="blank3"></div>
	
	
<!--<div class="h1"><ul>
<li><a href="<?=$cms_abs?>">首页</a></li>
<li onmouseover="showmenu(1)"><a href="<?php $v=_ctag_parse(array("ename" => "xs_menunode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">男频</a></li>
<li onmouseover="showmenu(6)"><a href="<?php $v=_ctag_parse(array("ename" => "xs_nvpinnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "14",));if(!empty($v)){_aenter($v);?>
		<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">女频</a></li>
<?php $_main_menus=_ctag_parse(array("ename" => "main_menus","tclass" => "catalogs","limits" => "10","cols" => "1","listby" => "ca","casource" => "1","caids" => "8,9,10",));foreach($_main_menus as $v){_aenter($v);?>
<li><a href="<?=$v['listurl']?>"  title="<?=$v['title']?>"><?=$v['title']?></a></li><?php _aquit();} unset($_main_menus,$v);?>

<li onmouseover="showmenu(4)"><a href="<?php $_quanben_list=_ctag_parse(array("ename" => "quanben_list","tclass" => "catalogs","disabled" => "0","nsid" => "-1","listby" => "co6","cosource6" => "1","ccids6" => "36","cainherit" => "1",));foreach($_quanben_list as $v){_aenter($v);?>
<?=$v['indexurl']?><?php _aquit();} unset($_quanben_list,$v);?>
">全本小说</a></li>
<li><?php $v=_ctag_parse(array("ename" => "ztnode","tclass" => "cnode","listby" => "ca","casource" => "11",));if(!empty($v)){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($v);?>
</li>
<li onmouseover="showmenu(3)"><a href="<?php $v=_ctag_parse(array("ename" => "pai_index","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "1","cosource7" => "38","urlmode" => "caid",));if(!empty($v)){_aenter($v);?>
	            <?=$v['indexurl']?><?php _aquit();} unset($v);?>
">排行榜</a></li>
<li><a href="<?=$cms_abs?>adminm.php" target="_blank">会员中心</a></li>
<li onmouseover="showmenu(2)"><a href="<?php $v=_ctag_parse(array("ename" => "vipnode","tclass" => "cnode","casource" => "1","listby" => "co3","cosource3" => "6","urlmode" => "caid",));if(!empty($v)){_aenter($v);?>
<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">VIP专区</a></li>
</ul></div>
<div class="h2" id="menu_1">
<div class="left"><a>男频&gt;&gt;</a></div>
<div class="right"><?php $v=_ctag_parse(array("ename" => "outxsnode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?php $_xs_sen_list=_ctag_parse(array("ename" => "xs_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","urlmode" => "caid",));foreach($_xs_sen_list as $v){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_xs_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
</div>
<div class="h2" id="menu_6">
<div class="left"><a>女频&gt;&gt;</a></div>
<div class="right"><?php $v=_ctag_parse(array("ename" => "outnpxsnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "14",));if(!empty($v)){_aenter($v);?>
<?php $_xs_sen_list=_ctag_parse(array("ename" => "xs_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","urlmode" => "caid",));foreach($_xs_sen_list as $v){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_xs_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
</div>
<div class="h2" id="menu_2">
<div class="left"><a>&lt;&lt; VIP小说频道</a></div>
<div class="right"><?php $v=_ctag_parse(array("ename" => "outvipnode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?php $_vip_sen_list=_ctag_parse(array("ename" => "vip_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","coinherit3" => "6","urlmode" => "caid",));foreach($_vip_sen_list as $v){_aenter($v);?>
<a href="<?=$v['listurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_vip_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
</div>

<div class="h2" id="menu_3">
<div class="left"><a>&lt;&lt; 排行榜</a></div>
<div class="right"><?php $v=_ctag_parse(array("ename" => "outphnode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?php $_ph_sen_list=_ctag_parse(array("ename" => "ph_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","coinherit7" => "38","urlmode" => "caid",));foreach($_ph_sen_list as $v){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_ph_sen_list,$v);?>
<?php _aquit();} unset($v);?>
<?php $v=_ctag_parse(array("ename" => "outphnode2","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "14",));if(!empty($v)){_aenter($v);?>
	<?php $_ph_sen_list=_ctag_parse(array("ename" => "ph_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","coinherit7" => "38","urlmode" => "caid",));foreach($_ph_sen_list as $v){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_ph_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
</div>

<div class="h2" id="menu_4">
<div class="left"><a>全本小说&gt;&gt;</a></div>
<div class="right"><?php $v=_ctag_parse(array("ename" => "outqbnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?php $_qb_sen_list=_ctag_parse(array("ename" => "qb_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","coinherit6" => "36","urlmode" => "caid",));foreach($_qb_sen_list as $v){_aenter($v);?>
<a href="<?=$v['listurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_qb_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
</div>

<div class="h2" id="menu_5">
<div class="left" style="display: none;"><a>&lt;&lt; 专题</a></div>
<div class="right" style="display: none;"><?php $v=_ctag_parse(array("ename" => "outztnode","tclass" => "cnode","listby" => "ca","casource" => "11",));if(!empty($v)){_aenter($v);?>
<?php $_zt_sen_list=_ctag_parse(array("ename" => "zt_sen_list","tclass" => "catalogs","limits" => "100","listby" => "ca","casource" => "2",));foreach($_zt_sen_list as $v){_aenter($v);?>
<a href="<?=$v['listurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_zt_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
</div>-->

<style type="text/css">
.remen_xu{}
.remen_xu li {width: 268px;height: 26px;line-height: 26px;font-size: 12px;position: relative;background: url(<?=$tplurl?>images/girltitbgall.png) no-repeat;display: list-item;text-align: -webkit-match-parent;list-style: none outside none;background-position: -468px -44px;}
.remen_xu span {font-weight:bold; margin-left: 5px;display:inline-block;width: 16px;height: 14px;text-align: center;font-size: 10px;line-height: 14px;font-family: Verdana;}
.remen_xu p {	background: #FFF;padding: 0 2px;display: inline;margin: 0;}
.remen_xu em {	color: #007F00;position: absolute;font-size: 12px;top: 1px;right: 0;background: #FFF;padding: 0 2px;}

.tut03 {margin-top:10px;height: 22px;line-height: 22px;background: #f6f6f6;padding: 0 0 0 2px;border-bottom: 2px solid #9a9a9a;}
.tut03 h2 {float: left;width: 91px;height: 26px;line-height: 26px;margin: -4px 0 0 0;background: #fff;border: 2px solid #9a9a9a;border-width: 2px 2px 0 2px;text-align: center;font-size: 12px;}
.tut03 h2 {line-height: 26px;text-align: center;font-size: 12px;font-weight: bold;}
.shu_hot {line-height: 22px;float: right;padding-right: 15px;}
.shu_hot a:visited {color: #FF0000;}
.shu_hot a {color: #FF0000;}
</style>

<div id="main">
<div id="left" style="width:950px">
<div class="divbox" style="width:950px;margin-bottom: 5px;">

<div style="width:950px;height：120px;border-top:solid 5px #F3F3F3;padding:24px 150px 8px;overflow:hidden;background: url(<?=$tplurl?>images/newindexbg1.png) repeat-x 0 -160px;">
	<div style="margin-right:150px;width:250px;height:120px;float:left;overflow:hidden;text-align:center;">
		<h2 style="position:absolute;left:-9999px;font-size:0;height:0;">男生版</h2>
		<a href="index.php?caid=1" title="男频" style="background: url(<?=$tplurl?>images/nboy2forie6.jpg) no-repeat 0 0;display: block;width: 250px;height: 80px;line-height: 20px;cursor: pointer;" target="_blank"></a>
		<?php $_index_nanpin_list=_ctag_parse(array("ename" => "index_nanpin_list","tclass" => "catalogs","disabled" => "0","limits" => "6","nsid" => "-1","listby" => "ca","casource" => "1","caids" => "2,4,5,6,7,17","urlmode" => "caid",));foreach($_index_nanpin_list as $v){_aenter($v);?>
	<a href="<?=$v['indexurl']?>"><?=$v['title']?></a>&#160;&#160;  <? if($v['sn_row']==3) { ?> <br /> <? } ?><?php _aquit();} unset($_index_nanpin_list,$v);?>

	</div>
	<div style="margin-right:50px;width:250px;height:120px;float:left;overflow:hidden;text-align:center;">
		<h2 style="position:absolute;left:-9999px;font-size:0;height:0;">女生版</h2>
		<a href="index.php?caid=14" title="女频" style="background: url(<?=$tplurl?>images/ngirl2forie6.jpg) no-repeat 0 0;display: block;width: 250px;height: 80px;line-height: 20px;cursor: pointer;" target="_blank"></a>
		<?php $_index_nvpin_list=_ctag_parse(array("ename" => "index_nvpin_list","tclass" => "catalogs","disabled" => "0","limits" => "6","nsid" => "-1","listby" => "ca","casource" => "1","caids" => "3,15,16,18,19,20","urlmode" => "caid",));foreach($_index_nvpin_list as $v){_aenter($v);?>
			<a href="<?=$v['indexurl']?>"><?=$v['title']?></a> &nbsp;&nbsp;    <? if($v['sn_row']==3) { ?> <br /> <? } ?><?php _aquit();} unset($_index_nvpin_list,$v);?>

	</div>
</div>


</div>
<div class="blank3"></div>
<?php $_index_hengfu_ad_1=_ctag_parse(array("ename" => "index_hengfu_ad_1","tclass" => "farchives","limits" => "1","casource" => "39","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_index_hengfu_ad_1 as $v){_aenter($v);?>
<div class="adwimg" style="width:950px;"><a href="<?=$v['advurl']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "adimg_950_50","tclass" => "image","disabled" => "0","tname" => "$v[advimg]","maxwidth" => "950","maxheight" => "50",));if(!empty($u)){?>	<img width="950" height="50" src="<?=$u['url']?>" border="0" /><?php } unset($u);?></a></div><?php _aquit();} unset($_index_hengfu_ad_1,$v);?>


<div id="lm3"><dl>
<dd>
<div style="width:300px;float:left;margin-left:10px;">
	<div class="tut03">        
	    <h2><a target="_blank" href="/index.php?caid=1">热点男性小说</a></h2>        
	    <span class="shu_hot"></span>        
	</div>
	<?php $_index_nanpin_img_list=_ctag_parse(array("ename" => "index_nanpin_img_list","tclass" => "archives","disabled" => "0","limits" => "1","nsid" => "-1","caidson" => "1","casource" => "1","caids" => "1","chsource" => "2","chids" => "4","orderby" => "comments_desc","closed" => "-1","abover" => "-1","wherestr" => "a.thumb != \'\'",));foreach($_index_nanpin_img_list as $v){_aenter($v);?>
	                            
<div style="float:left;margin:5px;"><a target="_blank" href="<?=$v['arcurl']?>"><?php $u=_utag_parse(array("ename" => "thumb_110_145","tclass" => "image","disabled" => "0","tname" => "$v[thumb]","maxwidth" => "110","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?>	    <img src="<?=$u['url_s']?>"  width="120" height="150" title="<?=$v['subject']?>"><?php } unset($u);?></a></div>
    <div class="txtpic_fm_r" style="width:160px;float:left;">
    <div style="padding:5px 0" class="font14"><a target="_blank" href="<?=$v['arcurl']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></div>
    <div>作者：<span style="color:#007F00;"><?=$v['author']?></span></div>
    <span class="orange_u"><?php echo _utag_parse(array("ename" => "hotindex_abs_100","tclass" => "odeal","disabled" => "0","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "90","wordlink" => "1",));?>
...  <br /><A href="<?=$v['arcurl']?>"  target=_blank>点击阅读</A>
&nbsp;
<a onclick="javascript:ajax_favorite('<?=$v['aid']?>');" href="javascript:;">加入书架</a>
</span>
    </div><?php _aquit();} unset($_index_nanpin_img_list,$v);?>

	<div class="blank3"></div>
	<div class="remen_xu" style="325px;margin-left:5px;">
		<ul>
			<?php $_index_nanpin_remenlist=_ctag_parse(array("ename" => "index_nanpin_remenlist","tclass" => "archives","disabled" => "0","nsid" => "-1","caidson" => "1","casource" => "1","caids" => "1","chsource" => "2","chids" => "4","orderby" => "comments_desc","closed" => "-1","abover" => "-1",));foreach($_index_nanpin_remenlist as $v){_aenter($v);?>
		<? if($v['sn_row']!=1) { ?>
<li><span><?=$v['sn_row']?></span><p>《<a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</p><em><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</em></li>
<? } ?><?php _aquit();} unset($_index_nanpin_remenlist,$v);?>

		</ul>
	</div>
</div>

<div style="width:300px;float:left;padding-left:10px;border-left:dotted 1px #DFDFDF;">
	<div class="tut03">        
	    <h2><a target="_blank" href="/index.php?caid=14">热点女性小说</a></h2>        
	    <span class="shu_hot"></span>        
	</div>
	<?php $_index_nvpin_img_list=_ctag_parse(array("ename" => "index_nvpin_img_list","tclass" => "archives","disabled" => "0","limits" => "1","nsid" => "-1","caidson" => "1","casource" => "1","caids" => "14","chsource" => "2","chids" => "4","orderby" => "comments_desc","closed" => "-1","abover" => "-1","wherestr" => "a.thumb != \'\'",));foreach($_index_nvpin_img_list as $v){_aenter($v);?>
	                            
<div style="float:left;margin:5px;"><a target="_blank" href="<?=$v['arcurl']?>"><?php $u=_utag_parse(array("ename" => "thumb_110_145","tclass" => "image","disabled" => "0","tname" => "$v[thumb]","maxwidth" => "110","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?>	    <img src="<?=$u['url_s']?>"  width="120" height="150" title="<?=$v['subject']?>"><?php } unset($u);?></a></div>
    <div class="txtpic_fm_r" style="width:160px;float:left;">
    <div style="padding:5px 0" class="font14"><a target="_blank" href="<?=$v['arcurl']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></div>
    <div>作者：<span style="color:#007F00;"><?=$v['author']?></span></div>
    <span class="orange_u"><?php echo _utag_parse(array("ename" => "hotindex_abs_100","tclass" => "odeal","disabled" => "0","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "90","wordlink" => "1",));?>
... <br /> <A href="<?=$v['arcurl']?>"  target=_blank>点击阅读</A>
&nbsp;
<a onclick="javascript:ajax_favorite('<?=$v['aid']?>');" href="javascript:;">加入书架</a>
</span>
    </div><?php _aquit();} unset($_index_nvpin_img_list,$v);?>

	<div class="blank3"></div>
	<div class="remen_xu" style="325px;margin-left:5px;margin-right:150px;">
		<ul>
			<?php $_index_nvpin_remenlist=_ctag_parse(array("ename" => "index_nvpin_remenlist","tclass" => "archives","disabled" => "0","nsid" => "-1","caidson" => "1","casource" => "1","caids" => "14","chsource" => "2","chids" => "4","orderby" => "comments_desc","closed" => "-1","abover" => "-1",));foreach($_index_nvpin_remenlist as $v){_aenter($v);?>
				<? if($v['sn_row']!=1) { ?>
<li><span><?=$v['sn_row']?></span><p>《<a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</p><em><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</em></li>
<? } ?><?php _aquit();} unset($_index_nvpin_remenlist,$v);?>

		</ul>
	</div>
</div>

<div style="width:300px;float:right;padding-left:10px;border-left:dotted 1px #DFDFDF;">
	<div class="tut03">        
	    <h2><a target="_blank" href="/index.php?caid=1&ccid7=38">读者推荐小说</a></h2>        
	    <span class="shu_hot"></span>        
	</div>
	<?php $_index_quanzhan_img_list=_ctag_parse(array("ename" => "index_quanzhan_img_list","tclass" => "archives","disabled" => "0","limits" => "1","nsid" => "-1","caidson" => "1","casource" => "1","caids" => "14,1","chsource" => "2","chids" => "4","orderby" => "favorites_desc","closed" => "-1","abover" => "-1","wherestr" => "a.thumb != \'\'",));foreach($_index_quanzhan_img_list as $v){_aenter($v);?>
	                                
<div style="float:left;margin:5px;"><a target="_blank" href="<?=$v['arcurl']?>"><?php $u=_utag_parse(array("ename" => "thumb_110_145","tclass" => "image","disabled" => "0","tname" => "$v[thumb]","maxwidth" => "110","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?>	    <img src="<?=$u['url_s']?>"  width="120" height="150" title="<?=$v['subject']?>"><?php } unset($u);?></a></div>
    <div class="txtpic_fm_r" style="width:160px;float:left;">
    <div style="padding:5px 0" class="font14"><a target="_blank" href="<?=$v['arcurl']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></div>
    <div>作者：<span style="color:#007F00;"><?=$v['author']?></span></div>
    <span class="orange_u"><?php echo _utag_parse(array("ename" => "hotindex_abs_100","tclass" => "odeal","disabled" => "0","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "90","wordlink" => "1",));?>
... <br /> <A href="<?=$v['arcurl']?>"  target=_blank>点击阅读</A>
&nbsp;
<a onclick="javascript:ajax_favorite('<?=$v['aid']?>');" href="javascript:;">加入书架</a>
</span>
    </div><?php _aquit();} unset($_index_quanzhan_img_list,$v);?>

	<div class="blank3"></div>
	<div class="remen_xu" style="325px;margin-left:5px;margin-right:150px;">
		<ul>
			<?php $_index_quanzhan_remenlist=_ctag_parse(array("ename" => "index_quanzhan_remenlist","tclass" => "archives","disabled" => "0","nsid" => "-1","caidson" => "1","casource" => "1","caids" => "14,1","chsource" => "2","chids" => "4","orderby" => "favorites_desc","closed" => "-1","abover" => "-1",));foreach($_index_quanzhan_remenlist as $v){_aenter($v);?>
	                <? if($v['sn_row']!=1) { ?>
<li><span><?=$v['sn_row']?></span><p>《<a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a>》</p><em><?php echo _utag_parse(array("ename" => "author10","tclass" => "odeal","disabled" => "0","tname" => "$v[author]","trim" => "10",));?>
</em></li>
<? } ?><?php _aquit();} unset($_index_quanzhan_remenlist,$v);?>

		</ul>
	</div>
</div>

</dd></dl></div>
<div class="blank3"></div>
<?php $_index_hengfu_ad_2=_ctag_parse(array("ename" => "index_hengfu_ad_2","tclass" => "farchives","limits" => "1","casource" => "40","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_index_hengfu_ad_2 as $v){_aenter($v);?>
<div class="adwimg" style="width:950px;"><a href="<?=$v['advurl']?>" title="<?=$v['subject']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "adimg_950_50","tclass" => "image","disabled" => "0","tname" => "$v[advimg]","maxwidth" => "950","maxheight" => "50",));if(!empty($u)){?>	<img width="950" height="50" src="<?=$u['url']?>" border="0" /><?php } unset($u);?></a></div><?php _aquit();} unset($_index_hengfu_ad_2,$v);?>

</div>


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