<?
!defined('M_COM') && exit('No Permisson');
function load_cache($cacstr='',$sid=0){//仅限读取非细分缓存//$istpl读取模板方面的缓存
	global $templatedir;
	$ret = '';
	if(empty($cacstr)) return $ret;
	$arr = array_filter(explode(',',$cacstr));
	foreach($arr as $cac){
		$cac = trim($cac);
		if(empty($cac)) continue;
		$cacdir = cache_dir($cac,$sid);
		global $$cac,${$cac.'_'.$sid};
		if(@include_once $cacdir.'/'.$cac.'.cac.php'){
			$$cac = ${$cac.'_'.$sid};
		}else{
			$$cac = ${$cac.'_'.$sid} = array();
			$ret .= ($ret ? ',' : '').$cac;
		}
	}
	return $ret;
}
function cache_merge(&$sources,$cactype,$sid=0){
	if(!$sid) return;
	global $subsites;
	load_cache('subsites');
	if($cactype == 'channels'){
		foreach($sources as $k => $v) $sources[$k]['available'] = empty($subsites[$sid]['channels'][$k]['available']) ? 0 : 1;
	}elseif($cactype == 'channel'){
		$sources['available'] = empty($subsites[$sid]['channels'][$sources['chid']]['available']) ? 0 : 1;
		$arr = array('arctpl','arctpl1','arctpl2','marctpl','pretpl','srhtpl','addtpl',);
		$plus_mode = 'cache_merge';@include M_ROOT."./include/arcplus.inc.php";
		foreach($arr as $k) $sources[$k] = empty($subsites[$sid]['channels'][$sources['chid']][$k]) ? '' : $subsites[$sid]['channels'][$sources['chid']][$k];
		unset($arr);
	}elseif($cactype == 'commus'){
		foreach($sources as $k => $v) $sources[$k]['available'] = empty($subsites[$sid]['commus'][$k]['available']) ? 0 : 1;
	}elseif($cactype == 'commu'){
		$sources['available'] = empty($subsites[$sid]['commus'][$sources['cuid']]['available']) ? 0 : 1;
		$arr = array('cutpl','addtpl',);
		foreach($arr as $k) $sources[$k] = empty($subsites[$sid]['commus'][$sources['cuid']][$k]) ? '' : $subsites[$sid]['commus'][$sources['cuid']][$k];
	}elseif($cactype == 'btags'){
		global $cms_abs,$timestamp;
		$sources['tplurl'] = $cms_abs."template/".$subsites[$sid]['templatedir']."/";
		$sources['siteurl'] = $cms_abs."index.php?sid=$sid";//静态与动态之分
		$sources['sid'] = $sid;
		foreach(array('cmslogo','cmstitle','cmskeyword','cmsdescription','hometpl',) as $var){
			$sources[$var] = $subsites[$sid][$var];
		}
	}
}
function switch_cache($nsid = 0){
	global $channels,$catalogs,$cnodes,$commus,$mtpls,$sptpls,$btags,$utags,$ctags,$ptags,$rtags,$sid,$subsites,$templatedir;
	if($nsid == $sid) return;
	load_cache('catalogs,cnodes,mtpls,sptpls,utags,ctags,ptags,rtags',$nsid);
	foreach(array('channels','btags','commus',) as $var) cache_merge($$var,$var,$nsid);
	$nsid && $templatedir = $subsites[$nsid]['templatedir'];
}

function cache2file($carr,$cname,$ctype='',$sid=0){//$ctype细分缓存需要指定
	if(!is_array($carr) || empty($cname)) return;
	$cacstr = var_export($carr,TRUE);
	$cacdir = cache_dir($ctype,$sid);
	mmkdir($cacdir);
	if(@$fp = fopen($cacdir.'/'.$cname.'.cac.php','wb')){
		$cname .= '_'.$sid;
		fwrite($fp,"<?php\n\$$cname = $cacstr ;\n?>");
		fclose($fp);
	}
}

function sub_cache(&$carr,$m='',$nkey='',$ctype='',$keeps='',$sid=0){
	$keeparr = array_filter(explode(',',$keeps));
	foreach($carr as $k => $v){
		$x = empty($m) ? $v[$nkey] : $m;
		$y = (!$nkey || empty($v[$nkey])) ? '' : $v[$nkey];
		$cname = cache_name($ctype,$x,$y);
		cache2file($v,$cname,$ctype,$sid);
		if($keeps){
			foreach($v as $p => $q){
				if(!in_array($p,$keeparr)) unset($carr[$k][$p]);
			}
		}else $carr[$k] = '';
	}
}
function reload_cache($ctype,$m='',$n='',$sid=0){//强制重载缓存
	$cacdir = cache_dir($ctype,$sid);
	$cname = cache_name($ctype,$m,$n);
	if(@include $cacdir.'/'.$cname.'.cac.php'){
		$$cname = ${$cname.'_'.$sid};
	}else $$cname = array();
	return $$cname;
}
function cache_name($ctype='',$m='',$n=''){
	if($ctype == 'cnode'){
		$cname = str_replace('=','_',str_replace('&','__',$m));
	}elseif(in_array($ctype,array('usergroup','coclass','field','ffield','mfield','mafield'))){
		$cname = $ctype.'_'.$m.'_'.$n;
	}else{
		$m = str_replace('.','',$m);
		$cname = $ctype.$m;
	}
	return $cname;
}
function read_cache($ctype='',$m='',$n='',$sid=0){//读取细分缓存的函数
	$cacdir = cache_dir($ctype,$sid);
	$cname = cache_name($ctype,$m,$n);
	global $$cname,${$cname.'_'.$sid};
	if(@include_once $cacdir.'/'.$cname.'.cac.php'){
		$$cname = ${$cname.'_'.$sid};
	}else $$cname = ${$cname.'_'.$sid} = array();
	return $$cname;
}
function sys_cache($cname){
	global $$cname;
	@include_once M_ROOT.'./include/syscache/'.$cname.'.cac.php';
	if(!$$cname) $$cname = array();
}
function read_tag($ctype,$tname){//解析时将setting数组解出来使用
	global $sid;
	$ret = read_cache($ctype,$tname,'',$sid);
	$ret && $ret = array_merge($ret,$ret['setting']);
	unset($ret['setting']);
	return $ret;
}
function read_ncache($cname,$sid=0){
	$cacdir = cache_dir($cname,$sid);
	global ${$cname.'_'.$sid};
	if(@include_once $cacdir.'/'.$cname.'.cac.php'){
		return ${$cname.'_'.$sid};
	}
	return array();
}

function del_cache($ctype='',$m='',$n='',$sid=0){//删除细分缓存
	$cacdir = cache_dir($ctype,$sid);
	$cacname = cache_name($ctype,$m,$n);
	@unlink($cacdir.'/'.$cacname.'.cac.php');
	return;
}
function cache_dir($ctype='',$sid=0){//如果是节点的目录，应该传入什么样的参数?
	global $subsites,$templatedir;
	if(in_array($ctype,array('ctag','utag','ptag','rtag','ctags','utags','ptags','rtags','mtpls','sptpls','jstpls','csstpls','usualtags','tagclasses',))){
		$tpldir = $sid ? $subsites[$sid]['templatedir'] : $templatedir;
		return M_ROOT."./template/$tpldir/cache";
	}else{
		return M_ROOT.'./dynamic/cache'.($sid ? "/$sid" : '');
	}
}
function cnode_dir($cnstr,$sid,$wri=0){
	$cacdir = M_ROOT.'./dynamic/cache'.($sid ? "/$sid" : '').'/cnodes';
	$wri && mmkdir($cacdir);
	return $cacdir;
}

function cnode2file($carr,$cnstr,$sid=0){
	if(!is_array($carr) || empty($cnstr)) return;
	$cname = cache_name('cnode',$cnstr);
	$cacstr = var_export($carr,TRUE);
	if(@$fp = fopen(cnode_dir($cnstr,$sid,1).'/'.$cname.'.cac.php','wb')){
		$cname .= '_'.$sid;
		fwrite($fp,"<?php\n\$$cname = $cacstr ;\n?>");
		fclose($fp);
	}
}
function read_cnode($cnstr,$sid=0){
	if(!$cnstr) return array();
	$cname = cache_name('cnode',$cnstr);
	global ${$cname.'_'.$sid};
	if(@!include_once cnode_dir($cnstr,$sid).'/'.$cname.'.cac.php'){
		${$cname.'_'.$sid} = array();
	}
	return ${$cname.'_'.$sid};
}
function del_cnode($cnstr,$sid=0){//删除节点缓存
	if(!$cnstr) return;
	@unlink(cnode_dir($cnstr,$sid).'/'.cache_name('cnode',$cnstr).'.cac.php');
	return;
}

?>