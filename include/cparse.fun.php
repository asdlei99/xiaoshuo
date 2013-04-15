<?php
!defined('M_COM') && exit('No Permission');
function cnstr($temparr){
	global $cotypes;
	$vararr = array('caid');
	foreach($cotypes as $coid => $cotype) $cotype['sortable'] && $vararr[] = 'ccid'.$coid;
	$cnstr = '';
	foreach($temparr as $k => $v) if(in_array($k,$vararr) && $v = max(0,intval($v))) $cnstr .= ($cnstr ? '&' : '').$k.'='.$v;
	unset($vararr,$temparr,$cotype);
	return $cnstr;
}
function cn_htmldir($cnstr,$sid=0,$wri = 0){//返回 子站目录/顶级栏目/分类1/ 的格式
	global $cnhtmldir,$subsites,$catalogs;
	$dirstr = $sid ? $subsites[$sid]['dirname'].'/' : ($cnhtmldir ? $cnhtmldir.'/' : '');//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	if($cnstr){
		parse_str($cnstr,$idsarr);
		$i = false;
		$topid = 0;
		foreach($idsarr as $k => $v){
			if($k != 'caid') $k = str_replace('ccid','',$k);
			$item = $k == 'caid' ? read_cache('catalog',$v,'',$sid) : read_cache('coclass',$k,$v);
			if(!$i){//首序类系
				$items = $k == 'caid' ? read_cache('catalogs','','',$sid) : read_cache('coclasses',$k,$v);
				$topid = cn_upid($v,$items);//有可能是本身也可能是其它的栏目
				$dirstr .= $items[$topid]['dirname'].'/';
				$wri && mmkdir(M_ROOT.$dirstr,0);
				unset($items);
			}
			if($i || $topid != $v){
				$dirstr .= $item['dirname'].'/';
				$wri && mmkdir(M_ROOT.$dirstr,0);
			}
			$i = true;
		}
		unset($item,$idsarr);
	}
	return $dirstr;
}

function cn_blank($cnstr,$pstr='i',$sid=0,$force=0){//force:强行删除旧文件，强行覆盖第一个文件，为0时为修复链接
	global $homedefault;
	if($cnstr || $sid){
		$dirstr = cn_htmldir($cnstr,$sid,1);
		$suffix = $sid ? (($cnstr ? '&' : '')."sid=$sid") : '';
		foreach(array('l','bk') as $var){
			if($force && in_str($var,$pstr)) m_unlink(M_ROOT.$dirstr.($var == 'l' ? '{$page}.html' : 'bk_{$page}.html'));
		}
		if(in_str('i',$pstr) && ($force || !is_file(M_ROOT.$dirstr.$homedefault))) @str2file(blank_content("index.php?$cnstr$suffix"),M_ROOT.$dirstr.$homedefault);
		if(in_str('l',$pstr) && ($force || !is_file(M_ROOT.$dirstr.'1.html'))) @str2file(blank_content("list.php?$cnstr$suffix"),M_ROOT.$dirstr.'1.html');
		if(in_str('bk',$pstr) && ($force || !is_file(M_ROOT.$dirstr.'bk_1.html'))) @str2file(blank_content("list.php?bk=1&$cnstr$suffix"),M_ROOT.$dirstr.'bk_1.html');
	}
}
function cn_pmids($cnstr,$sid=0){//类目阅读权限
	global $cotypes;
	parse_str($cnstr,$idsarr);
	$pmids = array();
	foreach($idsarr as $k => $v){
		$coid = $k == 'caid' ? 0 : str_replace('ccid','',$k);
		$item = !$coid ? read_cache('catalog',$v,'',$sid) : (@$cotypes[$coid]['permission'] ? read_cache('coclass',$coid,$v) : array());
		!empty($item['crpmid']) && $pmids[] = $item['crpmid'];
	}
	unset($item,$idsarr);
	return $pmids;
}
function cn_parsearr($cnstr,$sid=0,$listby=-1,$source=''){//$listby:-1列最后一个id,0列栏目项，数字列某个类系
	global $m_thumb;
	parse_str($cnstr,$idsarr);
	$infos = array();
	$i = 0;
	$num = count($idsarr);
	foreach($idsarr as $k => $v){
		$i ++;
		$coid = $k == 'caid' ? 0 : intval(str_replace('ccid','',$k));
		if($item = $k == 'caid' ? read_cache('catalog',$v,'',$sid) :  read_cache('coclass',$coid,$v)){
			$infos[$k == 'caid' ? 'caid' : "ccid$coid"] = $v;
			$infos[$k == 'caid' ? 'catalog' : 'ccid'.$coid.'title'] = $item['title'];
			if($k == 'caid') $infos['sid'] = $item['sid'];
			if((($listby == -1) && ($i == $num)) || (!$listby && $k == 'caid') || (($listby > 0) && ($listby == $coid))){
				$infos += $item;
				$source && $m_thumb->config[$source] = array('id' => $k,'mode' => $coid ? 'cc' : 'ca','smode' => '',);
			}
		}
	}
	if(!isset($infos['sid'])) $infos['sid'] = $sid;
	unset($item,$idsarr);
	return $infos;
}
function re_cnode(&$item,&$cnstr,&$cnode){
	global $cms_abs,$sid;
	if($cnode){
		foreach(array('indexurl','listurl','bkurl') as $var) $item[$var] = $cnode[$var]; 
		$item['alias'] = empty($cnode['alias']) ? $item['title'] : $cnode['alias'];
		$item['rss'] = $cms_abs.'rss.php'.(empty($cnstr) ? '' : "?$cnstr").($sid ? ((empty($cnstr) ? '?' : '&')."sid=$sid") : '');
	}else{
		foreach(array('index','list','bk') as $var) $item[$var.'url'] = '#';
	}
}
?>