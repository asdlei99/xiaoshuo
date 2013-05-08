<?
include_once dirname(__FILE__).'/include/general.inc.php';
include_once M_ROOT.'./include/common.fun.php';
parse_str(un_virtual($_SERVER['QUERY_STRING']),$temparr);

//´¦Àí×ÓÕ¾id
$nsid = empty($temparr['sid']) ? 0 : max(0,intval($temparr['sid']));
if($nsid && empty($subsites[$nsid])) $nsid = 0;
switch_cache($nsid);
$sid = $nsid;
if_siteclosed($sid);
@extract($btags);

$page = empty($temparr['page']) ? 1 :  max(1, intval($temparr['page']));
$isbk = empty($temparr['bk']) ? 0 : 1;
$cnstr = cnstr($temparr);

if($cnstr && ($cnode = cnodearr($cnstr,$sid))){
	!$curuser->pmbypmids('cread',cn_pmids($cnstr,$sid)) && message('nocatabrowseperm');
}else message('choosecatacnod');

if($cache1circle && (!$listcachenum || $page <= $listcachenum)){
	$cachefile = htmlcac_dir('cn','',1).cac_namepre($isbk ? 'bk' : 'list',$cnstr).'_'.$page.'.php';
	if(is_file($cachefile) && (filemtime($cachefile) > ($timestamp - $cache1circle * 60))){
		mexit(read_htmlcac($cachefile));
	}
}

$_da = cn_parsearr($cnstr,$sid,-1);
re_cnode($_da,$cnstr,$cnode);
if(!($tplname = $isbk ? $cnode['bktpl'] : $cnode['listtpl'])) message('definereltem');

$_mp = array();
$_mp['durlpre'] = $cms_abs.en_virtual('list.php?'.($sid ? "sid=$sid&" : '').($isbk ? 'bk=1&' : '').$cnstr.'&page={$page}',1);;
$_mp['static'] = 0;
$_mp['nowpage'] = max(1,intval($page));
$_mp['s_num'] = $liststaticnum;

_aenter($_da,1);
extract($_da,EXTR_OVERWRITE);
tpl_refresh($tplname);
@include M_ROOT."template/$templatedir/pcache/$tplname.php";

$_content = ob_get_contents();
ob_clean();
if($enablestatic){
	$_content .= "<script language=\"javascript\" src=\"".$cms_abs."static.php?mode=".($isbk ? 'cnbk' : 'cnlist')."&fromd=1".($sid ? "&sid=$sid" : '').($cnstr ? "&$cnstr" : '')."\"></script>";
}elseif($cache1circle && (!$listcachenum || $page <= $listcachenum)) save_htmlcac($_content,$cachefile);
mexit($_content);
?>

