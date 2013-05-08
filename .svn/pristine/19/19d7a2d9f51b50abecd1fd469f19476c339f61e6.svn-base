<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?=$mcharset?>">
<title><?=$mname?>的个人空间 - <?=$cmsname?> - <?=$hostname?></title>
<meta name="keywords" content="<?=$cmskeyword?>">
<meta name="description" content="<?=$cmsdescription?>">
<link type="text/css" rel="stylesheet" href="<?=$tplurl?>css/space.css" />
<script type="text/javascript">var cmsUrl = "<?=$cms_abs?>";</script>
<script src="<?=$tplurl?>js/common.js" type="text/javascript" language="javascript"></script>
<script src="<?=$tplurl?>js/ajax.js" type="text/javascript" language="javascript"></script>
<script src="<?=$tplurl?>js/commu.js" type="text/javascript" language="javascript"></script>
</head>
<style type="text/css">
#nav .on<?=$mcaid?>{background:#fff;text-decoration:none;color:#800000}
#left .menu<?=$ucid?>{background:#fff url("<?=$tplurl?>images/li_ggao.gif") 30px center no-repeat;text-decoration:none;}
</style>
<body>
<div id="wrap">
<div id="header">
<h1><a href="<?=$cmsurl?>" ><img src="<?=$cmsurl?><?=$cmslogo?>"></a></h1>
<div class="topnav">
<h2><a href="<?=$cmsurl?>mspace/?mid=<?=$mid?>"><?=$nicename?>的个人空间</a></h2>
<h3><?=$intro?></h3>
<p>所属会员组：<?php $u=_utag_parse(array("ename" => "menbergroup","tclass" => "fromid","type" => "grouptype3","idsoruce" => "0",));if(!empty($u)){?><?=$u['cname']?><?php } unset($u);?><?php $u=_utag_parse(array("ename" => "zujicname","tclass" => "fromid","type" => "grouptype5","idsoruce" => "0",));if(!empty($u)){?>&nbsp;|&nbsp;<?=$u['cname']?><?php } unset($u);?> <a href="<?=$cmsurl?>adminm.php">[会员中心]</a><a href="<?=$cmsurl?>login.php?action=logout">[退出]</a></p></div>
<div id="nav"><a href="<?=$cmsurl?>mspace/?mid=<?=$mid?>" class="oncaid">首页</a><?php $_space_nav=_ctag_parse(array("ename" => "space_nav","tclass" => "mcatalogs","limits" => "10","listby" => "ca",));foreach($_space_nav as $v){_aenter($v);?>
<a href="<?=$v['listurl']?>" class="on<?=$v['mcaid']?>"><?=$v['title']?></a><?php _aquit();} unset($_space_nav,$v);?>
</div>
</div>
<div id="main">
<div id="left">
<ul class="m_b8"><?php $_men_list=_ctag_parse(array("ename" => "men_list","tclass" => "mcatalogs","disabled" => "0","limits" => "20","listby" => "uc",));foreach($_men_list as $v){_aenter($v);?>
<li><a href="<?=$v['listurl']?>" class="menu<?=$v['ucid']?>"><?=$v['title']?></a></li><?php _aquit();} unset($_men_list,$v);?>
</ul>
<dl><dt>推荐文章</dt><dd><?php $_space_rec=_ctag_parse(array("ename" => "space_rec","tclass" => "archives","limits" => "10","cols" => "1","closed" => "-1","abover" => "-1",));foreach($_space_rec as $v){_aenter($v);?>
<a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a><?php _aquit();} unset($_space_rec,$v);?>
</dd></dl>
<dl><dt>热门文章</dt><dd><?php $_space_hot=_ctag_parse(array("ename" => "space_hot","tclass" => "archives","limits" => "10","cols" => "1","orderby" => "clicks_desc","closed" => "-1","abover" => "-1",));foreach($_space_hot as $v){_aenter($v);?>
<a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a><?php _aquit();} unset($_space_hot,$v);?>
</dd></dl>
<dl><dt>最新文章</dt><dd><?php $_space_new=_ctag_parse(array("ename" => "space_new","tclass" => "archives","limits" => "10","cols" => "1","closed" => "-1","abover" => "-1",));foreach($_space_new as $v){_aenter($v);?>
<a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a><?php _aquit();} unset($_space_new,$v);?>
</dd></dl>
</div>
<div id="right">
<dl><dt>会员信息</dt><dd><h1><?php $u=_utag_parse(array("ename" => "photo_66_66","tclass" => "image","tname" => "$photo","maxwidth" => "66","maxheight" => "66","thumb" => "1","emptyurl" => "userfiles/image/20090429/29152624b84c8910e39540.jpg",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>"><?php } unset($u);?></h1>
用户名：<?=$mname?><br />
性别：<?=$gender?><br />
生日：<?php echo _utag_parse(array("ename" => "birthday","tclass" => "date","tname" => "$birthday","date" => "Y-m-d",));?>
<br />
E-Mail：<?=$email?><br />
注册时间：<?php echo _utag_parse(array("ename" => "regdate","tclass" => "date","tname" => "$regdate","date" => "Y-m-d","time" => "H:i",));?>
<br /><br /></dd></dl>
<dl><dt>统计信息</dt><dd>文档：<?=$archives?>篇<br />评论：<?=$comments?>篇<br />信息：<?=$freeinfos?>篇<br />网币：<?=$currency2?>个<br /><br /></dd></dl>
</div>
<div id="container">
<div class="site m_b8"><span>当前位置：</span><a href="#">首页</a>&nbsp;>>&nbsp;<?php $_m_nav=_ctag_parse(array("ename" => "m_nav","tclass" => "mnownav",));foreach($_m_nav as $v){_aenter($v);?>
> <a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_m_nav,$v);?>
</div>
<table cellpadding="0" cellspacing="5" border="0"><tr><?php $_space_xs=_ctag_parse(array("ename" => "space_xs","tclass" => "archives","limits" => "3","cols" => "1","closed" => "-1","abover" => "-1",));foreach($_space_xs as $v){_aenter($v);?>
<td><a href="<?=$v['arcurl']?>" target="_blank"><?php $u=_utag_parse(array("tclass" => "image","tname" => "$v[thumb]","maxwidth" => "105","maxheight" => "137","thumb" => "1",));if(!empty($u)){?><img src="<?=$u['url_s']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$u['subject']?>"><?php } unset($u);?><span><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</span></a></td><?php _aquit();} unset($_space_xs,$v);?>
</tr></table>
<h1>最近更新</h1>
<?php $_duanpianlist_m=_ctag_parse(array("ename" => "duanpianlist_m","tclass" => "archives","limits" => "7","caidson" => "1","casource" => "1","caids" => "10","chids" => "","space" => "1","closed" => "-1","abover" => "-1",));foreach($_duanpianlist_m as $v){_aenter($v);?>
<dl>
<h2><a href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a></h2>
<dt><?php echo _utag_parse(array("ename" => "hotindex_abs_160","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "160",));?>
</dt>
<dd><a href="<?=$v['arcurl']?>" target="_blank">[查看详细]</a></dd>
</dl><?php _aquit();} unset($_duanpianlist_m,$v);?>

</div>
</div>
<div id="footer" style="clear:both">
<span>
<a href="" >关于我们</a>　|　
<a href="" >联系我们</a>　|　
<a href="" >合作伙伴</a>　|　
<a href="" >会员注册</a>　|　
<a href="" >帮助中心</a>　|　
<a href="" >意见反馈</a>　|　
<a href=""  >网站地图</a></span>
<p id="copyright"><?=$copyright?></p>
</div>