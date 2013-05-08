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
</div>
</div>
<style type="text/css">
#lm2{width:306px;float:left;height:265px;margin-right:3px;margin-left:3px;}
#menu #menu_1{display:none;}
#menu #menu_3{display:block;}
</style>
<script type="text/javascript">
function changecla(id){
    var arcid1 = id.slice(-2,-1);
    var arcid2 = id.slice(-2);
    for(var i=1; i<=3; i++){
        $("font_" + arcid1 + i).className = "";
        $("dd_" + arcid1 + i).style.display = "none";
    }
    $("font_" + arcid2).className = "act";
    $("dd_" + arcid2).style.display = "";
    
}

$(document).ready(function(){
	var paren = $(".list_wz ul");
	paren.each(function(i,e){
		$(e).find(".table_td").live("mouseover",function(){
			$(this).parent().find(".table_td").attr("class", "table_td");
			$(this).parent().find(".table_td movehover").attr("class","table_td");
			$(this).attr("class","table_td movehover");	
		});
	});
});


</script>
<style type="text/css">
.boyRank .rankRightList {border-color: #CECECE;}
.rankRightList {width: 247px; border: 1px solid #CECECE;margin-left: 10px;margin-bottom:5px;float: left;position: relative;display: inline;overflow: hidden;}
.boyRank .rankRightList h3 {background: #f0f0f0;}
.rankRightList h3 {height: 29px;line-height: 29px;padding-left: 20px;font-size: 14px;color: #333;font-weight: bold;background: url("<?=$tplurl?>images/bg_lm.jpg") repeat-x scroll 0 0 transparent;color: #CC3300;font-weight: bold;height: 25px;line-height: 25px;overflow: hidden;padding-left: 8px;}
.rankRightNr1 ul {height: 270px;padding: 5px;}
.rankRightNr1 li {height: 26px;color: #333;line-height: 26px;font-size: 12px;border-bottom: 1px dotted #ccc;position: relative;}
.rankRightNr1 .bookid {display: inline-block;font-size: 13px;color: #333;width: 22px;text-align: right;}
.rankRightNr1 .amout {height: 13px;color: #666;position: absolute;right: 6px;top: 2px;width: 48px;text-align: right;}
.rankRightNr1 .bookname {height: 13px;left: 22px;color: #1A53FF;word-wrap: break-word;}
.rankRightNr1 a:link {color: #1952FF;}
.rankRightNr1 a:visited {color: #551A8B;}
.rankRightNr1 a {color: #1952FF;text-decoration: none;}
.rankRightList a:HOVER { color: #ff0000;}

.tit_r {height: 35px;line-height: 35px;background: url(<?=$tplurl?>images/tit_bg.png) no-repeat 0 -35px;}
.tit_r h2 {height: 35px;overflow: hidden;padding-left: 15px;font-size: 16px;font-weight: bold;text-align: left;padding-top: 7px;}
.c1row {background: url(<?=$tplurl?>images/tit1.gif) no-repeat 0 0;color: #a37d1e;}
.con790 {border: #e1e3e2 1px solid;border-width: 0 1px 1px;padding-bottom: 10px;width: 100%;overflow: hidden;background: url(<?=$tplurl?>images/con790_bg.png) repeat-x #fff;}
.list_wz {border-top: #e5e5e5 1px solid;background: #fff;}
.list_wz ul {width: 780px;overflow: hidden;background: url(<?=$tplurl?>images/table.png) left top;}
.list_wz li {float: left;width: 780px;height: 36px;line-height: 36px;overflow: hidden;}
.movehover {background: #fffce7;}
.list_wz .table_th {font-weight: bold;color: #7e7e7e;background: #efefef;}
.list_wz .table_th div, .table_td div {text-align: left;}
.list_wz li div {float: left;}
.list_wz .table_th .n {text-align: center;}
.list_wz .table_th .lb {text-align: center;}
.list_wz .zp {width: 140px;padding-left: 5px;font-weight: bold;}
.list_wz .zj {width: 180px;}
.list_wz .table_th .time {text-align: center;}
.list_wz .zz {width: 90px;padding-left: 15px;}
.list_wz .zt {width: 40px;}
.list_wz .bd {width: 55px;}
.list_wz .table_td .n {color: #aaaaaa;}
.list_wz .n {width: 40px;text-align: center;font-weight: bold;}
.list_wz .lb {padding-left: 10px;width: 66px;text-align: center;}
.list_wz .zp {width: 140px;padding-left: 5px;font-weight: bold;}
.list_wz .zp a, .list_wz .zp a:visited {color: #1886ac;}
.list_wz .zj {width: 180px;}
.list_wz .time {width: 125px;}
.list_wz .zz {width: 90px;padding-left: 15px;}
.list_wz .table_td .zt {color: #000;}
.list_wz .bd {width: 55px;text-align: center;}
</style>
<div id="main">

    	<div style="width:150px;float:left;border: 1px solid #ccc;padding:5px;">
	
	
		<h3>小说排行榜</h3>
		<ul>
			<li><a href="/index.php?caid=24&action=dianji">点击榜&gt;&gt;</a></li>
			<li><a href="/index.php?caid=24&action=shoucang">收藏榜&gt;&gt;</a></li>
			<li><a href="/index.php?caid=24&action=pingjia">评价榜&gt;&gt;</a></li>
			<li><a href="/index.php?caid=24&action=tuijian">推荐榜&gt;&gt;</a></li>
			<li><a href="/index.php?caid=24&action=dingyue">订阅榜&gt;&gt;</a></li>
			<li><a href="/index.php?caid=24&action=dashang">打赏榜&gt;&gt;</a></li>
			<li><a href="/index.php?caid=24&action=zuixin">最新小说&gt;&gt;</a></li>
			
		</ul>
	 
		
		
		<h3><a href="/index.php?caid=1&ccid7=38">男频小说排行榜</a></h3>
		<ul>
			<li><a href="/index.php?caid=2&ccid7=38">都市·异能&gt;&gt;</a></li>
			<li><a href="/index.php?caid=4&ccid7=38">玄幻·奇幻&gt;&gt;</a></li>
			<li><a href="/index.php?caid=5&ccid7=38">武侠·仙侠&gt;&gt;</a></li>
			<li><a href="/index.php?caid=6&ccid7=38">历史·军事&gt;&gt;</a></li>
			<li><a href="/index.php?caid=7&ccid7=38">网游·竞技&gt;&gt;</a></li>
			<li><a href="/index.php?caid=17&ccid7=38">科幻·灵异&gt;&gt;</a></li>
		</ul>
		
		<h3><a href="/index.php?caid=14&ccid7=38">女频小说排行榜</a></h3>
		<ul>
			<li><a href="/index.php?caid=3&ccid7=38">都市·言情&gt;&gt;</a></li>
			<li><a href="/index.php?caid=15&ccid7=38">穿越·重生&gt;&gt;</a></li>
			<li><a href="/index.php?caid=16&ccid7=38">青春·校园&gt;&gt;</a></li>
			<li><a href="/index.php?caid=18&ccid7=38">古装·宫斗&gt;&gt;</a></li>
			<li><a href="/index.php?caid=19&ccid7=38">玄幻·女强&gt;&gt;</a></li>
			<li><a href="/index.php?caid=20&ccid7=38">同人·耽美&gt;&gt;</a></li>
		</ul>
		
		<!-- 
		<h3>作者排行榜</h3>
		<ul>
			<li><a href="">作者财富榜&gt;&gt;</a></li>
			<li><a href="#">作者更新榜&gt;&gt;</a></li>
			<li><a href="#">作者粉丝榜&gt;&gt;</a></li>
		</ul>
		
		<h3>读者排行榜</h3>
		<ul>
			<li><a href="#">vip书友榜&gt;&gt;</a></li>
			<li><a href="#">读者打赏榜&gt;&gt;</a></li>
			<li><a href="#">读者推荐榜&gt;&gt;</a></li>
			<li><a href="#">读者评价榜&gt;&gt;</a></li>
		</ul>	
		 -->
		
	</div>

<?php
error_reporting(ALL);
/**
dianji => 小说点击榜
shoucang => 小说收藏榜
pingjia => 小说评价榜
tuijian => 小说推荐榜
zuixin => 最新小说榜
dingyue => 小说订阅榜
dashang => 打赏榜
*/
$action = $_GET['action'] == '' ? 'dianji' : $_GET['action'];

$title = '';

$isNotShuzi = false;

switch($action) {
	case 'dianji':
		$title = '小说点击榜';
		$sql = "SELECT *, clicks as shuzhi FROM xs_archives WHERE ucid=5 ORDER BY clicks DESC LIMIT 0, 100";
		break;
	case 'shoucang' :
		$title = '小说收藏榜';
		$sql = "SELECT *, favorites as shuzhi FROM xs_archives WHERE ucid=5 ORDER BY favorites DESC LIMIT 0, 100";
		break;
	case 'pingjia':
		$title = '小说评价榜';
		$sql = "SELECT *, comments as shuzhi FROM xs_archives WHERE ucid=5 ORDER BY comments DESC LIMIT 0, 100";
		break;
	case 'tuijian':
		$title = '小说推荐榜';
		$sql = "SELECT *, praises as shuzhi FROM xs_archives WHERE ucid=5 ORDER BY praises DESC LIMIT 0, 100";
		break;
	case 'zuixin':
		$title = '最新小说榜';
		$sql = "SELECT * FROM xs_archives WHERE ucid=5 ORDER BY createdate DESC LIMIT 0, 100";
		$isNotShuzi = true;
		break;
	case 'dingyue':
		$title = '小说订阅榜';
		$sql = "select arc.*, sum(sub.cridstr) AS shuzhi
				from xs_archives as arc
				left join xs_subscribes as sub on sub.aid in(
					select alb.aid from xs_albums as alb where alb.pid=arc.aid
				)
				where arc.ucid=5
				GROUP BY aid
				order by sub.cridstr DESC LIMIT 0, 100";
		//$sql = "SELECT *, orders as shuzhi FROM xs_archives WHERE ucid=5 ORDER BY orders DESC LIMIT 0, 100";
		$isNotShuzi = true;
		break;
	case 'dashang':
		$title = '小说打赏榜';
		$sql = "SELECT *, praises as shuzhi FROM xs_archives WHERE ucid=5 ORDER BY praises DESC LIMIT 0, 100";
		break;
	default:
		header('Location:/index.php');
		eixt();
		break;
}
$query = $db->query($sql);
$result = $db->fetch_all($query);

?>


    <div style="width:780px;float:right;border:1px solid #ccc;">
        <div class="tit_r">
			<h2 class="c1row"><?php echo $title;?></h2>
		</div>
<div class="list_wz">
				<ul>
					<li class="table_th">
						<div class="n">排名</div>
						<div class="lb">类别</div>
						<div class="zp">作品</div>
						<div class="zj">最新章节</div>
						<div class="time">更新时间</div>
						<div class="zz">作者</div>
						<div class="zt">状态</div>
						<?php
							if ($isNotShuzi == false) {
								echo '<div class="bd">榜单数值</div>';
							}
						?>
						
					</li>
<?php
if (!empty($result)) {
	foreach ($result as $key => $r) {
		//获取该小说最后更新文章信息
		$sql = "select a5.* from xs_archives as a5, (select a1.aid from xs_albums as a1 LEFT JOIN xs_archives_1 as a2 ON a2.aid=a1.aid WHERE a1.pid='".$r['aid']."') as a4 WHERE a5.aid=a4.aid  ORDER BY a5.createdate DESC LIMIT 1";
		$wz = $db->fetch_one($sql);
		if (!empty($wz)) {
			$zj = $wz['subject'];
			$dt = date('Y-m-d H:i' ,$wz['createdate']);
			$zjid = $wz['aid'];
		} else {
			$zj = '--';
			$dt = '';
			$zjid = '';
		}
		//获取小说的制定类别
		$sql = "SELECT * from xs_catalogs WHERE caid=".$r['caid'];
		$lb = $db->fetch_one($sql);
		if (!empty($lb)) {
			$lb = $lb['title'];
		} else {
			$lb = '';
		}

		echo '<li class="table_td">';
		echo '<div class="n">'.($key+1).'</div>';
		echo '<div class="lb">[<a href="/index.php?caid='.$r['caid'].'" target="_blank">'.$lb.'</a>]</div>	';
		echo '<div class="zp"><a target="_blank" title="'.$r['subject'].'" href="/archive.php?aid='.$r['aid'].'">'.$r['subject'].'</a></div>';
		if ($zjid !== '') {
			echo '<div class="zj"><a target="_blank" title="'.$zj.'" href="/archive.php?aid='.$zjid.'">'.$zj.'</a></div>';
			echo '<div class="time">'.$dt.'</div>';
		} else {
			echo '<div class="zj">'.$zj.'</div>';
			echo '<div class="time">--</div>';
		}
		
		echo '<div class="zz">'.$r['author'].'</div>';
		if ($r['abover'] == 1){
			echo '<div class="zt">完结</div>';
		} else {
			echo '<div class="zt">连载</div>';
		}
		if ($isNotShuzi == false) {
			echo '<div class="bd">'.(isset($r['shuzhi']) ? $r['shuzhi'] : '').'</div>';
		}
		echo '</li>';
	}
}
?>
				</ul>
			</div>    
    
    
    </div>
</div>
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