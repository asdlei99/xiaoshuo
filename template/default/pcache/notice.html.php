<?php _mpinfo(array("ename" => "header_notice","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "3","orderby" => "createdate_desc","validperiod" => "1","length" => "10",));?>
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
<div id="head">
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
<td width="60px"><a href="<?=$cmsurl?>search.php?sid=<?=$sid?>&searchword=吞天神帝&searchsubmit=1&x=40&y=12">吞天神帝</a></td>
<td width="60px"><a href="<?=$cmsurl?>search.php?sid=<?=$sid?>&searchword=特种教师&searchsubmit=1&x=40&y=12">特种教师</a></td>
<td width="60px"><a href="<?=$cmsurl?>search.php?sid=<?=$sid?>&searchword=江北女匪&searchsubmit=1&x=40&y=12">江北女匪</a></td>

</form>
</tr>
</table>
</div></div>
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
		ind=1;
		if(ccid3==6) ind=5;
		if(ccid7==38) ind=3;
	}
	if(caid==14 || caid==3 || caid==15 || caid==16 || caid==18 || caid==19  || caid==20) {
		ind=2;
		if(ccid3==6) ind=5;
		if(ccid7==38) ind=3;
	}
	if (caid == 22) {
		ind = 4;
	}
	if(caid=='') ind=0;
	
	$('.tagdhnew_01 ul li').eq(ind).addClass('selected').siblings().removeClass('selected');
	$('.tagdhnew_02 .center > div').eq(ind).show().siblings().hide();
	if(ind==0 || ind==3 || ind==5 || ind==4) $('.tagdhnew_02').css({'height':'0','overflow':'hidden'});
});
</script>
<!--  -->
<div id="menu">
	<div class="tagdhnew_01">
		<div class="left">
			<ul>
				<li class="indexTag"><a title="小说 首页" href="<?=$cms_abs?>">首页</a></li>
				<li ><a title="男频" href="<?php $v=_ctag_parse(array("ename" => "xs_menunode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">男频</a></li>
				<li ><a title="女频" href="<?php $v=_ctag_parse(array("ename" => "xs_nvpinnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "14",));if(!empty($v)){_aenter($v);?>
		<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">女频</a></li>
				<!--<?php $_main_menus=_ctag_parse(array("ename" => "main_menus","tclass" => "catalogs","limits" => "10","cols" => "1","listby" => "ca","casource" => "1","caids" => "8,9,10",));foreach($_main_menus as $v){_aenter($v);?>
<li><a href="<?=$v['listurl']?>"  title="<?=$v['title']?>"><?=$v['title']?></a></li><?php _aquit();} unset($_main_menus,$v);?>

				<li onmouseover="showmenu(4)"><a title="全本小说" href="<?php $_quanben_list=_ctag_parse(array("ename" => "quanben_list","tclass" => "catalogs","disabled" => "0","nsid" => "-1","listby" => "co6","cosource6" => "1","ccids6" => "36","cainherit" => "1",));foreach($_quanben_list as $v){_aenter($v);?>
<?=$v['indexurl']?><?php _aquit();} unset($_quanben_list,$v);?>
">全本小说</a></li>
				<li><?php $v=_ctag_parse(array("ename" => "ztnode","tclass" => "cnode","listby" => "ca","casource" => "11",));if(!empty($v)){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($v);?>
</li>-->
				<li ><a title="排行榜" href="<?php $v=_ctag_parse(array("ename" => "pai_index","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "1","cosource7" => "38","urlmode" => "caid",));if(!empty($v)){_aenter($v);?>
	            <?=$v['indexurl']?><?php _aquit();} unset($v);?>
">排行榜</a></li>
				<li ><a href="/index.php?caid=22" title="书库">书库</a></li>
				<li><a href="<?=$cms_abs?>adminm.php" target="_blank" title="会员中心">会员中心</a></li>
			</ul>
		</div>
	</div>
	<div class="tagdhnew_02">
		<div class="center">
			<div></div>
			<div id="menu_1"><?php $v=_ctag_parse(array("ename" => "outxsnode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
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
			<!--<div id="menu_3"><?php $v=_ctag_parse(array("ename" => "outphnode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?php $_ph_sen_list=_ctag_parse(array("ename" => "ph_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","coinherit7" => "38","urlmode" => "caid",));foreach($_ph_sen_list as $v){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_ph_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
			<div id="menu_2"><?php $v=_ctag_parse(array("ename" => "outvipnode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?php $_vip_sen_list=_ctag_parse(array("ename" => "vip_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","coinherit3" => "6","urlmode" => "caid",));foreach($_vip_sen_list as $v){_aenter($v);?>
<a href="<?=$v['listurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_vip_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
			<div id="menu_4"><?php $v=_ctag_parse(array("ename" => "outqbnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?php $_qb_sen_list=_ctag_parse(array("ename" => "qb_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","coinherit6" => "36","urlmode" => "caid",));foreach($_qb_sen_list as $v){_aenter($v);?>
<a href="<?=$v['listurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_qb_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
			<div id="menu_5"><?php $v=_ctag_parse(array("ename" => "outztnode","tclass" => "cnode","listby" => "ca","casource" => "11",));if(!empty($v)){_aenter($v);?>
<?php $_zt_sen_list=_ctag_parse(array("ename" => "zt_sen_list","tclass" => "catalogs","limits" => "100","listby" => "ca","casource" => "2",));foreach($_zt_sen_list as $v){_aenter($v);?>
<a href="<?=$v['listurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_zt_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>-->
		</div>
	</div>
	
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
.search .but {
float: left;
margin: 5px 0 0 0;
border: 0;
width: 51px;
height: 24px;
line-height: 24px;
font-size: 14px;
color: #fff;
background-position: 0 -19px;
cursor: pointer;
}	
</style>
<div class="repeat_bg searchBox"> 
    <div class="searchBox_inner"> 
      <ul stat_flag="st_t-gg:头部公告" class="ico1 listTeseXs"> 
        <?php $_header_notice=_ptag_parse(array("ename" => "header_notice","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "3","orderby" => "createdate_desc","validperiod" => "1","length" => "10",));foreach($_header_notice as $v){_aenter($v);?>
<li><a style="color:#F00" href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a></li> <?php _aquit();} unset($_header_notice,$v);?>

      </ul> 
      
      <p stat_flag="st_ss-ci:搜索热词" class="ico1 search_rc" style="width:auto;">搜索热词：<b><a target="_blank" href="<?=$cmsurl?>search.php?sid=<?=$sid?>&searchword=吞天神帝&searchsubmit=1&x=40&y=12" style="color:#FF0000;">吞天神帝</a></b><b><a target="_blank" href="<?=$cmsurl?>search.php?sid=<?=$sid?>&searchword=特种教师&searchsubmit=1&x=40&y=12">特种教师</a></b><b><a target="_blank" href="<?=$cmsurl?>search.php?sid=<?=$sid?>&searchword=江北女匪&searchsubmit=1&x=40&y=12">江北女匪</a></b></p> 
      <div class="search"> 
        <form name="form" id="searchform" action="<?=$cmsurl?>search.php?sid=<?=$sid?>" method="get" target="_blank">                                                     
                <span>
                <input style="width:162px;" id="queryString" name="searchword" title="搜索图书" autocomplete="off" x-webkit-speech="" x-webkit-grammar="builtin:translate">                            
                </span>                            
                <input type="submit" value="搜索" class="but">                            
            </form>
      </div> 
    </div> 
</div>
<style type="text/css">
.center{width:950px; margin:10px auto;}
.centerl{float:left;width:200px; text-align:center;}
.centerl li{width:100%;}
.centerl li a{display:inline-block; width:100%; height:25px; line-height:25px;}
.centerl li a:hover{background:#FDF1D7;}
.centerr{float:left; width:730px; padding-left:15px; border-left:1px solid #999;}
</style>
<div class="center">
    <div class="centerl">
    	<ul>
        <?php $_webnoticeone=_ctag_parse(array("ename" => "webnoticeone","tclass" => "farchives","limits" => "10","cols" => "1","casource" => "3","orderby" => "vieworder_desc",));foreach($_webnoticeone as $v){_aenter($v);?>
<li><a href="<?=$v['arcurl']?>" id="on<?=$v['aid']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></li><?php _aquit();} unset($_webnoticeone,$v);?>

        </ul>
    </div>
    
    <div class="centerr">
    <h1><?=$subject?></h1>
        <?=$content?>
    </div>
    </div>
</div>
<script type="text/javascript">
document.getElementById("on<?=$aid?>").style.background="#FDF1D7";
</script>
<div class="blank9"></div>
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