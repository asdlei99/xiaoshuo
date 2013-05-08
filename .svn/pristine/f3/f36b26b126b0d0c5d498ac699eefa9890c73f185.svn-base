<?php
define('M_ANONYMOUS', TRUE);
$mode = empty($mode) ? 'arc' : trim($mode);
include_once dirname(__FILE__).'/include/general.inc.php';
if(!$enablestatic) mexit();//Ã»ÓÐÆôÓÃ¾²Ì¬
include_once M_ROOT.'./include/common.fun.php';
if($mode == 'arc'){
	!($aid = empty($aid) ? 0 : max(0,intval($aid))) && mexit();
	$addno = empty($addno) ? 0 : max(0,intval($addno));
	$addno = !$addno ? '' : $addno;
	$needstatic = $db->result_one("SELECT needstatic$addno FROM {$tblprefix}archives_sub WHERE aid='$aid'");
	if(!$needstatic || $needstatic > $timestamp) mexit();
	include_once M_ROOT.'./include/arc_static.fun.php';
	arc_static($aid,$addno,!$debugtag);
}elseif($mode == 'cnindex'){
	parse_str($_SERVER['QUERY_STRING'],$temparr);
	$cnstr = cnstr($temparr);
	if($cnstr){
		$needstatic = $db->result_one("SELECT ineedstatic FROM {$tblprefix}cnodes WHERE ename='$cnstr'");
	}elseif($sid){
		$needstatic = $db->result_one("SELECT ineedstatic FROM {$tblprefix}subsites WHERE sid='$sid'");
	}else{
		$needstatic = $db->result_one("SELECT value FROM {$tblprefix}mconfigs WHERE varname='ineedstatic'");
	}
	if(!$needstatic || $needstatic > $timestamp) mexit();
	include_once M_ROOT.'./include/cn_static.fun.php';
	index_static($cnstr,!$debugtag);
}elseif($mode == 'cnlist'){
	parse_str($_SERVER['QUERY_STRING'],$temparr);
	if(!($cnstr = cnstr($temparr))) mexit();
	$needstatic = $db->result_one("SELECT lneedstatic FROM {$tblprefix}cnodes WHERE ename='$cnstr'");
	if(!$needstatic || $needstatic > $timestamp) mexit();
	include_once M_ROOT.'./include/cn_static.fun.php';
	list_static($cnstr,0,!$debugtag);
}elseif($mode == 'cnbk'){
	parse_str($_SERVER['QUERY_STRING'],$temparr);
	if(!($cnstr = cnstr($temparr))) mexit();
	$needstatic = $db->result_one("SELECT bkneedstatic FROM {$tblprefix}cnodes WHERE ename='$cnstr'");
	if(!$needstatic || $needstatic > $timestamp) mexit();
	include_once M_ROOT.'./include/cn_static.fun.php';
	list_static($cnstr,1,!$debugtag);
}
mexit();

?>
