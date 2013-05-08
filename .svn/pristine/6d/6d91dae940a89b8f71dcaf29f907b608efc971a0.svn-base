<?
//$db = mysql_content('localhost', 'root', '111111');
//phpinfo();
//exit();
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

$cnstr = cnstr($temparr);
if($cnstr && ($cnode = cnodearr($cnstr,$sid))){
	if(!$curuser->pmbypmids('cread',cn_pmids($cnstr,$sid))) message('nocatabrowseperm');
}else $cnstr = '';

$cache1circle && $cachefile = htmlcac_dir('cn','',1).cac_namepre('index',$cnstr).'.php';
if($cache1circle && is_file($cachefile) && (filemtime($cachefile) > ($timestamp - $cache1circle * 60))) mexit(read_htmlcac($cachefile));

$_da = array();
if(!$cnstr){
	$tplname = !$sid ? $hometpl : $btags['hometpl'];
	$_da['rss'] = $cms_abs.'rss.php'.($sid ? "?sid=$sid" : '');
}else{
	$_da = cn_parsearr($cnstr,$sid,-1);
	re_cnode($_da,$cnstr,$cnode);
	$tplname = $cnode['indextpl'];
}
empty($tplname) && message('definereltem');

_aenter($_da,1);
extract($_da,EXTR_OVERWRITE);
tpl_refresh($tplname);
@include M_ROOT."template/$templatedir/pcache/$tplname.php";

$_content = ob_get_contents();
ob_clean();
if($enablestatic){
	$_content .= "<script language=\"javascript\" src=\"".$cms_abs."static.php?mode=cnindex&fromd=1".($sid ? "&sid=$sid" : '').($cnstr ? "&$cnstr" : '')."\"></script>";
}elseif($cache1circle) save_htmlcac($_content,$cachefile);
mexit($_content);

?>

