<?php
define('NOROBOT', TRUE);
include_once dirname(__FILE__).'/include/general.inc.php';
include_once M_ROOT."./include/admin.fun.php";
include_once M_ROOT."./include/adminm.fun.php";
load_cache('mmsgs,mlangs,mmnmenus,mmnlangs,usualurls,currencys,permissions');
$langs = &$mlangs;
if (empty($action)) {	//自动跳到个人主页
	header('Location:/adminm.php?action=memberstate');
	exit();
}
$action = empty($action) ? 'index' : $action;
if($inajax){
	aheader();
}else{
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?=$mcharset?>" />
<title><?=lang('madmincenter').' - '.$cmsname?></title>
<link href="images/adminm/style.css" rel="stylesheet" type="text/css" />
<link href="images/adminm/zhongxin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="include/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">var IXDIR = 'images/admina/', charset = '<?=$mcharset?>',allowfloatwin = '<?=$mallowfloatwin?>',floatwidth='<?=$mfloatwinwidth?>',floatheight='<?=$mfloatwinheight?>'</script>
<script type="text/javascript" src="include/js/langs.js"></script>
<script type="text/javascript" src="include/js/common.js"></script>
<script type="text/javascript" src="include/js/adminm.js"></script>
<script type="text/javascript" src="include/js/floatwin.js"></script>
<script type="text/javascript" src="include/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="include/js/calendar.js"></script>
<script type="text/javascript" src="include/js/tree.js"></script>
</head>

<body style="width:960px;margin:auto;">
<div id="append_parent"></div><?php
}

//定义各个标签的子标签
$subMenu_pays = array( 'crrecords' => '积分记录', 'pays' => '充值记录', 'payonline' => '在线充值', 'crexchange' => '兑换积分');
$subMenu_member = array('memberinfo' => '基本信息', 'memberpwd' => '修改密码');
//'pmsend' => '发送消息'
$subMenu_pmbox = array('pmbox' => '我的消息');
$subMenu_fav = array('favorites' => '我的书架', 'newread' => '最近阅读');

if(!$memberid){
	$message_class = 'curbox';
	echo '<div class="area col"><div class="conBox"><div class="con_con"><div class="main_area">';
	include_once M_ROOT.'./adminm/nopermission.inc.php';
}
$curuser->sub_data();
if(!$infloat && !$inajax){?>
<div id="header" class="area">
	<div class="logo"><a href="<?=$_SERVER['SCRIPT_NAME']?>"><img src="<?=$mcenterlogo ? $mcenterlogo : 'images/adminm/logo_member.png'?>" alt="<?=$cmstitle?>" width="260" height="50" /></a></div>
	
	<div class="rCon">
		<div class="material">
			<ul><?php if($memberid){?>
				<li><a href="login.php?action=logout"><?=lang('logout')?></a></li>
				<li><a href="<?=$cmsurl?>" target="_blank"><?=lang('websiteindex')?> | </a></li>
				<li><a href="/index.php?caid=1&ccid7=38" target="_blank">排行榜 | </a></li>
				<li><a href="/index.php?caid=22" target="_blank">书库 | </a></li>
				<li><a href="/index.php?caid=14" target="_blank">女频 | </a></li>
				<li><a href="/index.php?caid=1" target="_blank">男频 | </a></li>
				<li><a href="?action=memberinfo"><?=lang('msetting')?></a> | </li>
				<li><a href="?action=memberstate"><?=lang('欢迎您 <b>%s</b>',$curuser->info['nicename'])?></a> | </li><?php }else{?>
				<li><a href="login.php"  onclick="return floatwin('open_member',this)"><?=lang('login')?></a> | </li>
				<li><a href="register.php"  onclick="return floatwin('open_member',this)"><?=lang('register')?></a> | </li>
				<li><a href="lostpwd.php"  onclick="return floatwin('open_member',this)"><?=lang('getpwd')?></a> | </li>
				<?php }?>
			</ul>
		</div>
		<div id="shortcut">			
			<ul><?php
			//输出常用菜单
foreach($usualurls as $v){
	if($v['ismc'] && $v['available'] && $curuser->pmbypmids('menu',$v['pmid'])){
		if(($tmp=strpos($v['logo'],'#'))!==false) $v['logo']=substr($v['logo'],0,$tmp);
		echo "\n				<li><a href=\"$v[url]\"".($v['onclick'] ? " onclick=\"$v[onclick]\"" : '').($v['newwin'] ? ' target="_blank"' : '').'>'.($v['logo']?"<img src=\"$v[logo]\" width=\"28\" height=\"24\" align=\"absmiddle\" />":'')."<b>$v[title]</a></b></li>";
	}
}
?>
			</ul>		
		</div>		 
	</div>	
</div>

<div class="sekuai"></div>	

<div class="area col">
	<div class="left fB bigmenu" style="display:none;">
		<ul><li class="nobg"><a href="adminm.php"><?=lang('mindex')?></a></li><?php
	$submenustr = '';
	$menukeys = array();
	
	foreach($mmnmenus as $k => $v){
		if ($k != 13) continue;
		$pu='';
		$tmp=array();
		$menukeys[] = $k;
		foreach($v as $key => $arr){
			$linkstr = "<a href=\"$arr[0]\"".(empty($arr[3]) ? '' : " onclick=\"$arr[3]\"").(empty($arr[2]) ? '' : " target=\"_blank\"").">";
			if($curuser->pmbypmids('menu',empty($arr[1]) ? 0 : $arr[1])){
				$tmp[] = "<li id='left_menu_{$key}'>".$linkstr.$mmnlangs['mmenuitem_'.$key]."</a></li>";
				$pu || $pu = $linkstr;
			}
		}
		if(count($tmp)){
			echo "<li id=\"mainmenu_$k\">".$pu.$mmnlangs["mmenutype_$k"].'</a></li>';
			$submenustr .= "\n			<ul id=\"submenus_$k\" style=\"\">\n				".join($tmp,"\n				")."\n			</ul>";
		}
	}?></ul>
	</div>
	<div class="conBox">
		<div class="rightcon"><?php
}
if($action == 'index'){
	include_once M_ROOT.'./adminm/index.inc.php';
}else{?>
		<div class="con_con"><?php if(!$infloat&&!$inajax){?>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="smallmenu_td">
			<div id="leftmenu" class="smallmenu">
				<h3>个人中心</h3>
				<?=$submenustr?>
			</div>
<script type="text/javascript">
!function (){
	function u(s){var i = s.indexOf('?'), k = s.indexOf('#');return s.substr(i != -1 ? i : 0, k != -1 ? k : s.length)}
	var i,l,k,p,a=$id('leftmenu').getElementsByTagName('a'),x=u(location.href);
	for(i=0,l=a.length;i<l;i++){
		a[i].argv=u(a[i].href);
		if(x==a[i].argv){k=i;break}
	}
	if(k===undefined)for(i=0,l=a.length;i<l;i++)if((!k || a[i].argv.length > a[k].argv.length) && a[i].argv==x.substr(0,a[i].argv.length))k=i;
	if(k!==undefined){
		a=a[k].parentNode;
		a.className='hover';
		a=a.parentNode;
		a.style.display='';
		if(!(k=/(\d+)$/.exec(a.id)))return;
		$id('mainmenu_'+k[1]).className='s1';
	}
}();
$(document).ready(function(){
	var paren = $(".smallmenu ul");
	paren.each(function(i,e){
		$(e).find("li").live("mouseover",function(){
			var he = $('.smallmenu .hover');
			$(this).parent().find("li").attr("class", "");
			$(this).parent().find("li .ahover").attr("class","");
			$(this).attr("class", "ahover");
			$(he).attr('class', 'hover');
		});
	});
	paren.each(function(i,e){
		$(e).find("li").live("mouseout",function(){
			var he = $('.smallmenu .hover');
			$(this).attr("class", "");
			$(he).attr('class', 'hover');
		});
	});


	var action_payonline = 9;
	var action_crexchange = 9;
	var action_pays = 9;
	var action_memberpwd = 1;
	var action_memberinfo = 1;
	var action_pmsend = 27;
	var action_newread = 18;
	if (action_<?php echo $action;?> !== undefined) {
		$('#left_menu_'+action_<?php echo $action;?>).addClass('hover');
	}
	
});

</script>
					</td>
					<td valign="top"><? }?>
			<div class="main_area" style="padding-right:0px;">	<?php
	include_once M_ROOT.'./adminm/'.$action.'.inc.php';
}
mcfooter();
?>