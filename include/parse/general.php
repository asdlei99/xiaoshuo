<?php
function cn_allowstatic($urlstr){//类目页是否允许静态
	global $permissions,$sid;
	if(!$pmids = cn_pmids($urlstr,$sid)) return true;
	$vpmids = array();
	foreach($permissions as $k => $v) if(in_array($k,$pmids) && $v['cread']) $vpmids[] = $k;
	return $vpmids ? false : true;
}
function arc_allowstatic(&$archive){//文档页是否允许静态
	global $catalogs,$cotypes,$permissions,$vcps;
	if(empty($archive['checked'])) return false;
	if(!empty($vcps['sale'][$archive['salecp']])) return false;
	if($archive['rpmid'] > 0) return false;

	$pmids = array();
	$catalog = read_cache('catalog',$archive['caid'],'',$archive['sid']);
	if(!empty($catalog['taxcp']) && !empty($vcps['tax'][$catalog['taxcp']])) return false;
	if(!empty($catalog['rpmid']) && $archive['rpmid'] == -1) $pmids[] = $catalog['rpmid'];
	foreach($cotypes as $coid => $cotype){
		if($archive["ccid$coid"]){
			$coclass = read_cache('coclass',$coid,$archive["ccid$coid"]);
			if(!empty($coclass['taxcp']) && !empty($vcps['tax'][$coclass['taxcp']])) return false;
			if(!empty($cotype['permission']) && !empty($coclass['rpmid']) && $archive['rpmid'] == -1) $pmids[] = $coclass['rpmid'];
		}
	}
	unset($catalog,$coclass);
	if(!$pmids) return true;
	$vpmids = array();
	foreach($permissions as $k => $v) if(in_array($k,$pmids) && $v['aread']) $vpmids[] = $k;
	return $vpmids ? false : true;
}
function htmlcac_dir($mode='arc',$spath='',$wri=0){//结尾没有斜线
	$cacdir = M_ROOT."dynamic/htmlcac/$mode/";
	if($spath) $cacdir .= $spath.'/';
	$wri && mmkdir($cacdir);
	return $cacdir;
}

function cac_namepre($flag1='',$flag2=''){
	global $authkey,$sid;
	return ($sid ? "$sid_" : '').md5($flag1.$flag2.$authkey);
}
?>