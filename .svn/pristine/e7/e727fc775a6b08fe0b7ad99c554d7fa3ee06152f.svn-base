<?php
include_once dirname(__FILE__).'/include/general.inc.php';
include_once M_ROOT.'./include/common.fun.php';
include_once M_ROOT.'./include/refresh.fun.php';

if(empty($tname) || !($tag = read_tag('ctag',$tname))) mexit();
$_da = empty($data) ? array() : $data;
$querystr = md5($_SERVER['QUERY_STRING']);
$refarr = @parse_url($_SERVER['HTTP_REFERER']);
if(!$jsrefsource || empty($refarr['host']) || in_array($refarr['host'],explode("\r\n",$jsrefsource))){
	if($cachejscircle){
		$cachefile = htmlcac_dir('js','',1).cac_namepre($querystr).'.php';
		if(is_file($cachefile) && (filemtime($cachefile) > ($timestamp - $cachejscircle * 60))){
			js_write(read_htmlcac($cachefile));
			mexit();
		}
	}
	@extract($btags);
	_aenter($_da,1);
	$jsname = 'js_'.$tname;
	unset($tag['js']);
	js_refresh($tname,$tag,$jsname);
	ob_clean();
	@include M_ROOT."template/$templatedir/pcache/$jsname.php";
	$_content = ob_get_contents();
	ob_clean();
	js_write($_content);
	$cachejscircle && save_htmlcac($_content,$cachefile);
}
mexit();

?>
