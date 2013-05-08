<?php
include_once dirname(__FILE__).'/include/general.inc.php';
include_once dirname(__FILE__).'/include/common.fun.php';
include_once M_ROOT.'./include/archive.fun.php';
include_once M_ROOT.'./include/archive.cls.php';
$cmsclosed && message(empty($cmsclosedreason) ? 'defaultclosedreason' : mnl2br($cmsclosedreason));
parse_str(un_virtual($_SERVER['QUERY_STRING']));
$aid = empty($aid) ? 0 : max(0,intval($aid));
$page = empty($page) ? 1 : max(1,intval($page));

!$aid && message('choosearchive');
!($commu = read_cache('commu',5)) && message('choosecommuitem');
empty($commu['available']) && message('commuitemclo');

$arc = new cls_archive();
$arc->arcid($aid);
!$arc->aid && message('choosearchive');
!$arc->archive['checked'] && message('poinarcnoche'); 
!arc_allow($arc->archive,'aread') && message('noarchbrowspermis');
!($commu = read_cache('commu',$channels[$arc->archive['chid']]['cuid'])) && message('noavailablecommuitem');
(!$commu['available'] || $commu['cclass'] != 'purchase') && message('noavailablecommuitem');

//根据当前文档所在的子站重新处理缓存
switch_cache($arc->archive['sid']);
$sid = $arc->archive['sid'];
if_siteclosed($sid);
cache_merge($commu,'commu',$sid);
if(@!$tplname = $commu['cutpl']) message('defpurchaserecordtemp');
$arc->detail_data();
$_da = &$arc->archive;
arc_parse($_da);

$_mp = array();
$_mp['durlpre'] = $cms_abs.'purchases.php?aid='.$arc->aid.'&page={$page}';
$_mp['static'] = 0;
$_mp['nowpage'] = max(1,intval($page));
_aenter($_da,1);
@extract($btags);
extract($_da,EXTR_OVERWRITE);
tpl_refresh($tplname);
@include M_ROOT."template/$templatedir/pcache/$tplname.php";

$_content = ob_get_contents();
ob_clean();
mexit($_content);
?>