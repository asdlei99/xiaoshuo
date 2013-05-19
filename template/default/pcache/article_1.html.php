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
<script type="text/javascript">var CMS_ABS='<?=$cms_abs?>',IXDIR = '<?=$tplurl?>css/', charset = 'gbk',allowfloatwin = '1',floatwidth='400',floatheight='400'</script>
<script type="text/javascript" src="<?=$cms_abs?>include/js/langs.js"></script>
<script type="text/javascript" src="<?=$cms_abs?>include/js/common.js"></script>
<script type="text/javascript" src="<?=$cms_abs?>include/js/floatwin.js"></script>
<div id="append_parent"></div>
</div>
</div>

<style type="text/css">
.c11, .c11 a, .c11 a:visited {color: #24a3ce;}
.rightSide dl {margin: 12px 10px;border: #ccc 1px solid;font-size: 14px;font-weight: bold;}
.rightSide dl {margin: 12px 10px;border: #ccc 1px solid;font-size: 14px;font-weight: bold;}
.rightSide ul {margin: 12px 10px;}
.rightSide li {height: 18px;line-height: 18px;overflow: hidden;}    
.container #contents{ line-height:180%;}
.container #contents .pbr {
	margin-top:15px;
	display: block;
}
</style>

<?php
//记录当前会员最近阅读的小说
if (isset($curuser->info['mid'])) {
	//如果有用户登录
	//获取该章节所属小说的 aid
	$part = $db->fetch_one('SELECT * FROM xs_albums where aid=\''.$aid.'\'');
	if (!empty($part)) {
		//查找是否已经添加
		$mid = $curuser->info['mid'];
		$pid = $part['pid'];
		$sql = "select * from xs_newread where mid='".$mid."' and aid='".$pid."'";
		$isResult = $db->fetch_one($sql);
		if (empty($isResult)) {
			$time = time();
			$sql = 'INSERT into xs_newread (`mid`, `aid`, `readtime`) VALUES("'.$mid.'", "'.$pid.'", "'.$time.'")';
			$db->query($sql);
		} else {
			$db->query("update xs_newread set readtime='".time()."' where mid='".$mid."' and aid='".$pid."'");
		}
	}
}
?>

<div id="main">
		<div class="read_tit">
			<div id="setting">
				<div id="fontColor">
					<strong>选择背景颜色：</strong>
					<span onclick="setBgCollor('#abdce5')">1</span>
					<span onclick="setBgCollor('#e7f4fe')">2</span>
					<span onclick="setBgCollor('#e7eeda')">3</span>
					<span onclick="setBgCollor('#eae6da')">4</span>
					<span onclick="setBgCollor('#efe8ea')">5</span>
					<span onclick="setBgCollor('#f0ebe3')">6</span>
					<span onclick="setBgCollor('#e5e9e8')">7</span>
					<span onclick="setBgCollor('#ececed')">8</span>
				</div>
				<div id="fontSize">
					<strong>选择字号：</strong>
					<span onclick="setBgFont(24)">特大</span>
					<span onclick="setBgFont(18)">大</span>
					<span onclick="setBgFont(16)">中</span>
					<span onclick="setBgFont(14)">小</span>
				</div>
			</div>
			<div class="btn right">
				<ul>
					<li><a href="/comments.php?aid=<?php $a=_ctag_parse(array("ename" => "arc_nav_id","tclass" => "archive","disabled" => "0","album" => "4",));if(!empty($a)){_aenter($a);?>
<?=$a['aid']?><?php _aquit();} unset($a);?>
" target="_blank">发表评论</a></li>
					<li><a href="/archive.php?aid=<?php $a=_ctag_parse(array("ename" => "arc_nav_id","tclass" => "archive","disabled" => "0","album" => "4",));if(!empty($a)){_aenter($a);?>
<?=$a['aid']?><?php _aquit();} unset($a);?>
" target="_blank">返回目录</a></li>
					<!-- <li><a href="javascript:ajax_favorite('<?=$aid?>');">添加书签</a></li> -->
					<li><?php $v=_ctag_parse(array("ename" => "xiaoshuo_shangyizhang","tclass" => "acontext","disabled" => "0","chid" => "4",));if(!empty($v)){_aenter($v);?>
	    <a href="<?=$v['arcurl']?>" class="btn" id="shangyizhanga">上一章</a><?php _aquit();} unset($v);?>
</li>
					<li><?php $v=_ctag_parse(array("ename" => "xiaoshuo_xiayizhang","tclass" => "acontext","disabled" => "0","next" => "1","chid" => "4",));if(!empty($v)){_aenter($v);?>
	    <a href="<?=$v['arcurl']?>" class="btn" id="xiayizhanga">下一章</a><?php _aquit();} unset($v);?>
</li>
				</ul>
			</div>
		</div>
    <div class="container" style="width:740px;float: left;background-color: #E5ECF3">
        <div id="arc_title" style="height:auto;background:none;"><!-- <h1><?php $a=_ctag_parse(array("ename" => "arc_nav_xx","tclass" => "archive","disabled" => "0","album" => "4",));if(!empty($a)){_aenter($a);?>
<a href="<?=$a['arcurl']?>" title="<?=$a['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$a[subject]","trim" => "30",));?>
</a><?php _aquit();} unset($a);?>
 </h1> -->
        
        <div class="info"><span>
        	<span>小说:<?php $a=_ctag_parse(array("ename" => "arc_nav_xx","tclass" => "archive","disabled" => "0","album" => "4",));if(!empty($a)){_aenter($a);?>
<a href="<?=$a['arcurl']?>" title="<?=$a['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$a[subject]","trim" => "30",));?>
</a><?php _aquit();} unset($a);?>
</span>&nbsp;&nbsp;
        	<span>作者:<?php $a=_ctag_parse(array("ename" => "arc_nav_zuozhe","tclass" => "archive","disabled" => "0","album" => "4",));if(!empty($a)){_aenter($a);?>
	<a href="<?=$a['arcurl']?>" title="<?=$a['author']?>"><?=$a['author']?></a><?php _aquit();} unset($a);?>
</span>&nbsp;&nbsp;
        	<!-- 
        	<a href="javascript:alt_font('contents','12');" class="font12">小</a>
            <a href="javascript:alt_font('contents','14');" class="font14">中</a>
            <a href="javascript:alt_font('contents','16');" class="font16">大</a>
        	 -->
            </span>   更新时间: <?php echo _utag_parse(array("ename" => "createdate_all","tclass" => "date","tname" => "$createdate","date" => "Y-m-d","time" => "H:i",));?>
 |  字数: <font id="cms_content_counts"><?=$bytenum?></font></div>
            <h1 style="border-bottom:#BFBFBF 1px dashed;font-size:26px;line-height:40px;padding:10px 0 15px;border:none;"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$subject","trim" => "30",));?>
</h1>
            </div>
        <div id="contents" style="padding:0 42px 20px;border:none;">
        <?php
         $content = strip_tags($content);
	$content = str_replace('&nbsp;', '', $content);
	$content = str_replace(' ', '', $content);
	$content = str_replace('	', '', $content);
        $content = str_replace(chr(32), "", $content);
        $content = str_replace(chr(13), "<p class='pbr'> </p>&nbsp;&nbsp;&nbsp;&nbsp;", $content);

		
		echo '&nbsp;&nbsp;&nbsp;&nbsp;'.$content; 
        ?>
        <div class="blank18"></div> <?=$mpnav?>     
        </div>
  <div class="blank18"></div>
  <!-- 
        <div class="shuping" align="center">
            <a href="javascript:ajax_praise('<?=$aid?>');" class="btn">我顶(<font id="cms_praises">0</font>)</a>
            <a href="javascript:ajax_debase('<?=$aid?>');" class="btn">我踩(<font id="cms_debases">0</font>)</a>
            <a href="<?=$cms_abs?>report.php?aid=<?=$aid?>" class="btn" onclick="return floatwin('open_report',this,800,300)">举报<font>&nbsp;</font></a>
        </div>
   -->
  <div class="blank18"></div>
    <div class="blank9"></div>
    <div class="read_tit" style="padding-left: 250px;">
			<div class="btn">
				<ul>
					<li id="shangyipian"><?php $v=_ctag_parse(array("ename" => "xiaoshuo_shangyizhang","tclass" => "acontext","disabled" => "0","chid" => "4",));if(!empty($v)){_aenter($v);?>
	    <a href="<?=$v['arcurl']?>" class="btn" id="shangyizhanga">上一章</a><?php _aquit();} unset($v);?>
</li>
					<li><a href="/archive.php?aid=<?php $a=_ctag_parse(array("ename" => "arc_nav_id","tclass" => "archive","disabled" => "0","album" => "4",));if(!empty($a)){_aenter($a);?>
<?=$a['aid']?><?php _aquit();} unset($a);?>
&addno=1" target="_blank">返回目录</a></li>
					<li id="xiayipian"><?php $v=_ctag_parse(array("ename" => "xiaoshuo_xiayizhang","tclass" => "acontext","disabled" => "0","next" => "1","chid" => "4",));if(!empty($v)){_aenter($v);?>
	    <a href="<?=$v['arcurl']?>" class="btn" id="xiayizhanga">下一章</a><?php _aquit();} unset($v);?>
</li>
				</ul>
			</div>
		</div>
    <div class="blank9"></div>
    </div>


    <div class="rightSide" id="rightSide" style="display: block;width:200px;float:right;background-color: ">
		<ul class="c11" style="margin-top:70px;">
			<h3><?=$catalog?>强推</h3> 
			<?php $_yueduyemianqiangtui=_ctag_parse(array("ename" => "yueduyemianqiangtui","tclass" => "archives","limits" => "10","caidson" => "1","casource" => "2","chsource" => "2","chids" => "4","orderby" => "praises_desc","closed" => "-1","abover" => "-1",));foreach($_yueduyemianqiangtui as $v){_aenter($v);?>
	<li>[<?=$v['sn_row']?>] <a href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a></li>  <?php _aquit();} unset($_yueduyemianqiangtui,$v);?>
  
		</ul>
		<ul class="c11">
			<h3>全站强推</h3>  
			<?php $_yueduyemianquanzhantuijian=_ctag_parse(array("ename" => "yueduyemianquanzhantuijian","tclass" => "archives","disabled" => "0","chsource" => "2","chids" => "4","orderby" => "favorites_desc","closed" => "-1","abover" => "-1",));foreach($_yueduyemianquanzhantuijian as $v){_aenter($v);?>
	    <li>[<?=$v['sn_row']?>] <a href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a></li>  <?php _aquit();} unset($_yueduyemianquanzhantuijian,$v);?>
   
		</ul>
		<ul class="c11">
			<h3>热点作品</h3>   
			<?php $_yueduyemianredianzuopin=_ctag_parse(array("ename" => "yueduyemianredianzuopin","tclass" => "archives","disabled" => "0","chsource" => "2","chids" => "4","orderby" => "comments_desc","closed" => "-1","abover" => "-1",));foreach($_yueduyemianredianzuopin as $v){_aenter($v);?>
	        <li>[<?=$v['sn_row']?>] <a href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a></li>  <?php _aquit();} unset($_yueduyemianredianzuopin,$v);?>
  
		</ul>
	</div>
</div>
<script type="text/javascript">

$(document).keyup(function(event){   
    if(event.keyCode == 37){   
        var prepage = $('#shangyizhanga').attr('href');
        if (prepage == undefined) {
    		alert('没有上一章节');
    	} else {
    		location.href = prepage;
    	}
    }else if(event.keyCode == 39){  
    	var nextpage = $('#xiayizhanga').attr('href');
    	if (nextpage == undefined) {
    		alert('没有下一章节');
    	} else {
    		location.href = nextpage;
    	}
    }   
}); 

//cms_content_counts
$(document).ready(function(){
	var content = $('#contents').text();
	var intLength=0
	for (var i = 0; i < content.length; i++) {
		if ((content.charCodeAt(i) < 0) || (content.charCodeAt(i) > 255))
			intLength=intLength+2   
	}
	//$('#cms_content_counts').text(intLength);
	
	setBgCollor('#e7f4fe');
	setBgFont(16);
	
	
});

  
$(':text,textarea').keyup(function(event){   
    event.stopPropagation();   
});

//设置背景颜色
function setBgCollor(color) {
	$("#contents").css({"background": 'none'});
	$("#contents").css({"background-color": color});
	$(".container").css({"background": 'none'});
	$(".container").css({"background-color": color});
	
}
//设置文字大小
function setBgFont(size) {
	$('#contents').css({'font-size': size+'px'});
	$('#contents p').css({'font-size': size+'px'});
}

function set_stat(s){
    var k, o;
    s = s['<?=$aid?>'];
    if(!s)return;
    for(k in s){
        o = $id('cms_' + k);
        if(o)o.innerHTML = s[k];
        o = $id('ccms_' + k);
        if(o)o.innerHTML = s[k];
    }
}
ajax_get_stat('<?=$aid?>', set_stat);

</script>
<div class="blank3"></div>
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
<?=$cms_counter?>
<script type="text/javascript" src="<?=$cms_abs?>ajax.php?action=mark&aid=<?=$aid?>">