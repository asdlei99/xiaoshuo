<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
backallow('static') || amessage('no_apermission');
load_cache('cotypes,channels,currencys,permissions');
load_cache('catalogs,mtpls,cnodes',$sid);
cache_merge($channels,'channels',$sid);
include_once M_ROOT."./include/parse.fun.php";
include_once M_ROOT."./include/notice.cls.php";
$url_type = 'static';include 'urlsarr.inc.php';
if($action == 'archives') {
	$staticmode = empty($staticmode) ? 0 : max(0,intval($staticmode));
	$numperpic = empty($numperpic) ? 20 : min(500,max(20,intval($numperpic)));
	$caid = empty($caid) ? '0' : $caid;
	$chid = empty($chid) ? '0' : $chid;
	if(!isset($ptypestr)){
		$ptypes = empty($ptypes) ? array() : $ptypes;
		$ptypestr = implode(',',$ptypes);
	}else $ptypes = explode(',',$ptypestr);
	$indays = empty($indays) ? 0 : max(0,intval($indays));
	$outdays = empty($outdays) ? 0 : max(0,intval($outdays));
	$clicks = empty($clicks) ? 0 : max(0,intval($clicks));
	$comments = empty($comments) ? 0 : max(0,intval($comments));
	$wheresql = "WHERE a.sid=$sid AND a.checked='1'";
	if(!empty($caid)){
		$caids = array($caid);
		$tempids = array();
		$tempids = son_ids($catalogs,$caid,$tempids);
		$caids = array_merge($caids,$tempids);
		$wheresql .= " AND a.caid ".multi_str($caids);
	}
	$chid && $wheresql .= " AND a.chid='$chid'";
	$indays && $wheresql .= " AND a.createdate>'".($timestamp - 86400 * $indays)."'";
	$outdays && $wheresql .= " AND a.createdate<'".($timestamp - 86400 * $outdays)."'";
	$clicks && $wheresql .= " AND a.clicks>='$clicks'";
	$comments && $wheresql .= " AND a.comments>='$comments'";
	!empty($a_chforbids) && $wheresql .= " AND a.chid NOT ".multi_str($a_chforbids);
	$filterstr = '';
	foreach(array('staticmode','numperpic','caid','chid','ptypestr','indays','outdays','clicks','comments',) as $k){
		$filterstr .= "&$k=".rawurlencode($$k);
	}
	foreach($cotypes as $coid => $cotype){
		${"ccid$coid"} = isset(${"ccid$coid"}) ? ${"ccid$coid"} : 0;
		$filterstr .= "&ccid$coid=".${"ccid$coid"};
		if(!empty(${"ccid$coid"})){
			$ccids = array(${"ccid$coid"});
			$tempids = array();
			$coclasses = read_cache('coclasses',$coid);
			$tempids = son_ids($coclasses,${"ccid$coid"},$tempids);
			$ccids = array_merge($ccids,$tempids);
			if(empty($cotype['self_reg'])){
				$wheresql .= " AND a.ccid$coid ".multi_str($ccids);
			}else{
				$tempstr = self_sqlstr($coid,$ccids,'a.');
				$tempstr && $wheresql .= " AND $tempstr";
				unset($tempstr);
			} 
		}
	}
	if(!submitcheck('barchives')){
		url_nav(lang('staticadmin'),$urlsarr,'archives');
		$ptypearr = array(0 => lang('arcconpage'));
		$ptypearr[1] = lang('archive_plus_page').'1';
		$ptypearr[2] = lang('archive_plus_page').'2';
		$plus_mode = 'a_static';@include M_ROOT."./include/arcplus.inc.php";
		$staticarr = array('0' => lang('pascresta'),'1' => lang('actcresta'),'2' => lang('cleolstfi'),'3' => lang('repstaurl'));
		$caidsarr = array('0' => lang('all_catalog')) + caidsarr();
		$chidsarr = array('0' => lang('all_channel')) + chidsarr();
		tabheader(lang('crearcpagsta'),'archives',"?entry=static&action=archives$param_suffix");
		trbasic(lang('stacremo'),'',makeradio('staticmode',$staticarr,$staticmode),'');
		trbasic(lang('choarcpaty'),'',makecheckbox('ptypes[]',$ptypearr,$ptypes),'');
		trbasic(lang('numperpic20_500'),'numperpic',$numperpic);
		tabfooter();

		$filtercounts = $db->result_one("SELECT count(*) FROM {$tblprefix}archives a $wheresql");
		tabheader(lang('filarcpagcurarcamo').$filtercounts);
		trbasic(lang('be_catalog'),'caid',makeoption($caidsarr,$caid),'select');
		trbasic(lang('achannel'),'chid',makeoption($chidsarr,$chid),'select');
		foreach($cotypes as $coid => $cotype){
			$ccidsarr = array('0' => lang('nolimit'));
			$ccidsarr = $ccidsarr + ccidsarr($coid);	
			trbasic("$cotype[cname]","ccid$coid",makeoption($ccidsarr,${"ccid$coid"}),'select');
		}
		trrange(lang('add_date'),array('outdays',empty($outdays) ? '' : $outdays,'','&nbsp; '.lang('day_before').'&nbsp; -&nbsp; ',5),array('indays',empty($indays) ? '' : $indays,'','&nbsp; '.lang('day_in'),5));
		trbasic(lang('clickslarger'),'clicks',empty($clicks) ? '' : $clicks);
		trbasic(lang('commentlarger'),'comments',empty($comments) ? '' : $comments);
		tabfooter();
		echo "<input class=\"button\" type=\"submit\" name=\"barchives\" value=\"".lang('submit')."\"> &nbsp; &nbsp;";
		echo "<input class=\"button\" type=\"submit\" name=\"bfilter\" value=\"".lang('filter0')."\"></form>";

	}elseif(submitcheck('barchives')){
		if(empty($ptypes)) amessage('choarcpaty',"?entry=static&action=archives$param_suffix$filterstr");
		if(!$staticmode){//被动生成静态
			$sqlstr = '';
			foreach($ptypes as $k) $sqlstr .= (!$sqlstr ? '' : ',')."s.needstatic".($k ? $k : '')."=LEAST(s.needstatic".($k ? $k : '').",$timestamp)";
			$sqlstr && $db->query("UPDATE {$tblprefix}archives a LEFT JOIN {$tblprefix}archives_sub s ON (s.aid=a.aid) SET $sqlstr $wheresql");
		}else{
			$npage = empty($npage) ? 1 : $npage;
			if(empty($pages)){
				$nowcounts = $db->result_one("SELECT count(*) FROM {$tblprefix}archives a $wheresql");
				$pages = @ceil($nowcounts / $numperpic);
			}
			if(empty($pages)) amessage('selectarchive','history.go(-1)');
			$selectid = array();
			if($npage <= $pages){
				$fromstr = empty($fromid) ? "" : "a.aid<$fromid";
				$nwheresql = !$wheresql ? ($fromstr ? "WHERE $fromstr" : "") : ($wheresql.($fromstr ? " AND " : "").$fromstr);
				$query = $db->query("SELECT aid FROM {$tblprefix}archives a $nwheresql ORDER BY a.aid DESC LIMIT 0,$numperpic");
				while($item = $db->fetch_array($query)) $selectid[] = $item['aid'];
			}
			if($staticmode <= 2){
				include_once M_ROOT."./include/archive.cls.php";
				include_once M_ROOT."./include/arc_static.fun.php";
				if($staticmode == 1){//主动生成静态
					foreach($selectid as $aid){
						foreach($ptypes as $k) arc_static($aid,$k,0);
					}
				}elseif($staticmode == 2){//清除原静态文件
					foreach($selectid as $aid){
						foreach($ptypes as $k) arc_un_static($aid,$k,0,1);
					}
				}
				$sqlstr = '';
				foreach($ptypes as $k) $sqlstr .= (!$sqlstr ? '' : ',')."s.needstatic".($k ? $k : '')."='".($timestamp + (!$archivecircle ? 86400*365 : $archivecircle * 60))."'";
				$sqlstr && $db->query("UPDATE {$tblprefix}archives a LEFT JOIN {$tblprefix}archives_sub s ON (s.aid=a.aid) SET $sqlstr WHERE a.aid ".multi_str($selectid));
				unset($arc);
			}elseif($staticmode == 3){//修复静态链接
				include_once M_ROOT."./include/arcedit.cls.php";
				$aedit = new cls_arcedit;
				foreach($selectid as $aid){
					$aedit->set_aid($aid);
					$aedit->set_arcurl();
					$aedit->init();
				}
				unset($aedit);
			}
			$npage ++;
			if($npage <= $pages){
				$fromid = min($selectid);
				$transtr = "&pages=$pages";
				$transtr .= "&npage=$npage";
				$transtr .= "&barchives=1";
				$transtr .= "&fromid=$fromid";
				amessage('operating',"?entry=static&action=archives$param_suffix$filterstr$transtr",$pages,$npage,"<a href=\"?entry=static&action=archives$filterstr\">",'</a>');
			}
		}
		adminlog(lang('arcstaadm'),lang('arc_list_aoperate'));
		amessage('staopefin',"?entry=static&action=archives$param_suffix$filterstr");
	}
	a_guide('staticarchives');
}
elseif($action == 'cnodes'){
	$staticmode = empty($staticmode) ? 0 : max(0,intval($staticmode));
	$numperpic = empty($numperpic) ? 20 : min(500,max(20,intval($numperpic)));
	$caid = !isset($caid)? '0' : $caid;
	$mainline = !isset($mainline)? '0' : $mainline;
	$cnlevel = !isset($cnlevel) ? '0' : $cnlevel;
	if(!isset($ptypestr)){
		$ptypes = empty($ptypes) ? array() : $ptypes;
		$ptypestr = implode(',',$ptypes);
	}else $ptypes = explode(',',$ptypestr);

	$wheresql = "WHERE sid=$sid AND inconfig=1";
	$mainline && $wheresql .= " AND mainline='$mainline'";
	$cnlevel && $wheresql .= " AND cnlevel='$cnlevel'";
	if(!empty($caid)){
		$caids = array($caid);
		$tempids = array();
		$tempids = son_ids($catalogs,$caid,$tempids);
		$caids = array_merge($caids,$tempids);
		$wheresql .= " AND caid ".multi_str($caids);
	}
	$filterstr = '';
	foreach(array('staticmode','ptypestr','numperpic','caid','mainline','cnlevel',) as $k){
		$filterstr .= "&$k=".rawurlencode($$k);
	}
	if(!submitcheck('bcnodes')){
		url_nav(lang('staticadmin'),$urlsarr,'cnodes');
		$staticarr = array('0' => lang('pascresta'),'1' => lang('actcresta'),'2' => lang('cleolstfi'),'3' => lang('repstaurl'));
		$ptypearr = array('i' => lang('catasindex'),'l' => lang('cataslistpage'),'bk' => lang('catasbklist'),);
		$caidsarr = array('0' => lang('all_catalog')) + caidsarr();
		$cnlevelarr = array('0'=>lang('nolimit'),'1'=>lang('topic'),'2'=>lang('level2'),'3'=>lang('level3'),'4'=>lang('level4'));
		$mainlinearr = array('0' => lang('nolimit'),'ca' => lang('catalog'));
		foreach($cotypes as $coid => $cotype){
			if($cotype['sortable'] && $cotype['mainline']) $mainlinearr[$coid] = $cotype['cname'];
		}

		tabheader(lang('crecatcnodpagsta'),'archives',"?entry=static&action=cnodes$param_suffix");
		trbasic(lang('stacremo'),'',makeradio('staticmode',$staticarr,$staticmode),'');
		trbasic(lang('choatpaty'),'',makecheckbox('ptypes[]',$ptypearr,$ptypes),'');
		trbasic(lang('numperpic20_500'),'numperpic',$numperpic);
		tabfooter();

		$filtercounts = $db->result_one("SELECT count(*) FROM {$tblprefix}cnodes $wheresql");
		tabheader(lang('ficatcnocuo').$filtercounts);
		trbasic(lang('mainlinemode'),'mainline',makeoption($mainlinearr,$mainline),'select');
		trbasic(lang('caid_attr'),'caid',makeoption($caidsarr,$caid),'select');
		trbasic(lang('cnodelevelnum'),'cnlevel',makeoption($cnlevelarr,$cnlevel),'select');
		tabfooter();
		echo "<input class=\"button\" type=\"submit\" name=\"bcnodes\" value=\"".lang('submit')."\"> &nbsp; &nbsp;";
		echo "<input class=\"button\" type=\"submit\" name=\"bfilter\" value=\"".lang('filter0')."\"></form>";
	}
	else{
		empty($ptypes) && amessage('chocatpagty',"?entry=static&action=cnodes$param_suffix$filterstr");
		if(!$staticmode){
			$setstr = '';
			foreach(array('i','l','bk',) as $var){
				in_array($var,$ptypes) && $setstr .= ($setstr ? ',' : '').$var.'needstatic=LEAST('.$var.'needstatic,'.$timestamp.')';
			}
			$db->query("UPDATE {$tblprefix}cnodes SET $setstr $wheresql");
		}else{
			$npage = empty($npage) ? 1 : $npage;
			if(empty($pages)){
				$nowcounts = $db->result_one("SELECT count(*) FROM {$tblprefix}cnodes $wheresql");
				$pages = @ceil($nowcounts / $numperpic);
			}
			if(empty($pages)) amessage('chocatcno','history.go(-1)');
			$selectid = $cnstrarr = array();
			if($npage <= $pages){
				$fromstr = empty($fromid) ? "" : "cnid<$fromid";
				$nwheresql = !$wheresql ? ($fromstr ? "WHERE $fromstr" : "") : ($wheresql.($fromstr ? " AND " : "").$fromstr);
				$query = $db->query("SELECT cnid,ename FROM {$tblprefix}cnodes $nwheresql ORDER BY cnid DESC LIMIT 0,$numperpic");
				while($item = $db->fetch_array($query)){
					$selectid[] = $item['cnid'];
					$cnstrarr[] = $item['ename'];
				}
			}
			if($staticmode == 1){
				include_once M_ROOT."./include/cn_static.fun.php";
				$setstr = '';
				foreach($cnstrarr as $cnstr){
					in_array('i',$ptypes) && index_static($cnstr,1);
					in_array('l',$ptypes) && list_static($cnstr,0,1);
					in_array('bk',$ptypes) && list_static($cnstr,1,1);
				}
			}elseif($staticmode == 2){//$ptypestr ----- 'i,l,bk'的形式
				foreach($cnstrarr as $cnstr) cn_blank($cnstr,$ptypestr,$sid,1);
			}elseif($staticmode == 3){
				foreach($cnstrarr as $cnstr) cn_blank($cnstr,$ptypestr,$sid);
			}
			$npage ++;
			if($npage <= $pages){
				$fromid = min($selectid);
				$transtr = "&pages=$pages";
				$transtr .= "&npage=$npage";
				$transtr .= "&bcnodes=1";
				$transtr .= "&fromid=$fromid";
				amessage('operating',"?entry=static&action=cnodes$param_suffix$filterstr$transtr",$pages,$npage,"<a href=\"?entry=static&action=cnodes$filterstr\">",'</a>');
			}
		}
		adminlog(lang('catcnostaadm'),lang('cnliadmope'));
		amessage('catcnoopefin',"?entry=static&action=cnodes$param_suffix$filterstr");
	}
	a_guide('staticcnotes');
}
elseif($action == 'index'){
	if(!submitcheck('bstaticindex')){
		url_nav(lang('staticadmin'),$urlsarr,'index');
		$staticarr = array('0' => lang('pascresta'),'1' => lang('actcresta'),'2' => lang('cleolstfi'));
		$sid && $staticarr['3'] = lang('repstaurl');
		tabheader(lang(($sid ? 'subsite' : 'msite').'_index_deal'),'staticindex',"?entry=static&action=index$param_suffix");
		trbasic(lang('stacremo'),'',makeradio('staticmode',$staticarr,0),'');
		tabfooter('bstaticindex');
		a_guide('staticindex');

	}else{
		if(empty($staticmode)){
			if($sid){
				$db->query("UPDATE {$tblprefix}subsites SET ineedstatic=LEAST(ineedstatic,$timestamp) WHERE sid='$sid'");
			}else $db->query("UPDATE {$tblprefix}mconfigs SET value=LEAST(value,$timestamp) WHERE varname='ineedstatic'");
		}elseif($staticmode == 1){
			include_once M_ROOT."./include/cn_static.fun.php";
			index_static('',1);
		}elseif($staticmode == 2){
			include_once M_ROOT."./include/cn_static.fun.php";
			index_unstatic('',1);
		}elseif($staticmode == 3){
			$sid && cn_blank('','i',$sid);
		}
		adminlog(lang('indstaadm'));
		amessage('inddeafin',"?entry=static&action=index$param_suffix");
	}
}
?>
