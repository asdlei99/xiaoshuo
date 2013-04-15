<?
include_once './../include/general.inc.php';
include_once M_ROOT.'./include/common.fun.php';
include_once M_ROOT.'./include/parse.fun.php';
$cmsclosed && message(empty($cmsclosedreason) ? lang('defaultclosedreason') : mnl2br($cmsclosedreason));
$mspacedisabled && message(lang('mspacedisabled'));
parse_str(un_virtual($_SERVER['QUERY_STRING']));
$mid = empty($mid) ? 0 : max(0,intval($mid));
$mcaid = empty($mcaid) ? 0 : max(0,intval($mcaid));
$ucid = empty($ucid) ? 0 : max(0,intval($ucid));
include_once M_ROOT.'./include/mparse.fun.php';

$temparr = array('mid' => $mid,'mcaid' => $mcaid,'ucid' => $ucid,);

$cnstr = ($mcaid ? "mcaid=$mcaid" : '').($ucid ? "&ucid=$ucid" : '');
$cachemscircle && $cachefile = htmlcac_dir('ms','m'.($mid % 100),1).cac_namepre($mid,$cnstr).'.php';
if($cachemscircle && is_file($cachefile) && (filemtime($cachefile) > ($timestamp - $cachemscircle * 60))){
	mexit(read_htmlcac($cachefile));
}

$_da = array_merge($_da,mcn_parsearr($temparr));
$tplname = mcn_tpl($temparr,'index');
if(!$tplname) message('definereltem');

_aenter($_da,1);
@extract($btags);
extract($_da,EXTR_OVERWRITE);
tpl_refresh($tplname);
@include M_ROOT."template/$templatedir/pcache/$tplname.php";

$_content = ob_get_contents();
ob_clean();
$cachemscircle && save_htmlcac($_content,$cachefile);
mexit($_content);
?>

