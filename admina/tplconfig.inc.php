<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
backallow('tpl') || amessage('no_apermission');
load_cache('mtpls',$sid);
$url_type = 'tpl';include 'urlsarr.inc.php';
if($sid) $subsite = $subsites[$sid];
if($action == 'tplbase'){
	url_nav(lang('tplallconfig'),$urlsarr,'base',12);
	if(!submitcheck('btplbase')){
		tabheader(lang(!$sid ? 'pagebasedset' : 'subsiteset'),'tplbase',"?entry=tplconfig&action=tplbase$param_suffix");
		if(!$sid){
			trbasic(lang('index_tpl'),'mconfigsnew[hometpl]',makeoption(array('' => lang('noset')) + mtplsarr('index'),$mconfigs['hometpl']),'select');
			trbasic(lang('templatedir'),'mconfigsnew[templatedir]',$mconfigs['templatedir'],'text',lang('agtemplatedir'));
			trbasic(lang('temcssdir'),'mconfigsnew[css_dir]',empty($mconfigs['css_dir']) ? 'css' : $mconfigs['css_dir'],'text',lang('agcss_dir'));
			trbasic(lang('temjsdir'),'mconfigsnew[js_dir]',empty($mconfigs['js_dir']) ? 'js' : $mconfigs['js_dir'],'text',lang('agcss_dir'));
			trbasic(lang('tepawedest'),'mconfigsnew[debugtag]',$mconfigs['debugtag'],'radio');//两个作用：出错标识显示出样式，被动静态页面每次刷新更新
			trbasic(lang('jsrefsource'),'mconfigsnew[jsrefsource]',$mconfigs['jsrefsource'],'textarea',lang('agjsrefsource'));
			tabfooter();
		}else{
			trbasic(lang('subindtem'),'subsitenew[templatedir]',$subsite['templatedir'],'text',lang('agtemplatedir'));
			trbasic(lang('subindtpl'),'subsitenew[hometpl]',makeoption(array('' => lang('noset')) + mtplsarr('index'),$subsite['hometpl']),'select');
			trbasic(lang('temcssdir'),'subsitenew[css_dir]',empty($subsite['css_dir']) ? 'css' : $subsite['css_dir'],'text',lang('agcss_dir'));
			trbasic(lang('temjsdir'),'subsitenew[js_dir]',empty($subsite['js_dir']) ? 'js' : $subsite['js_dir'],'text',lang('agcss_dir'));
		}
		tabfooter('btplbase');
		a_guide('tplbase');

	}else{
		if(!$sid){
			$mconfigsnew['hometpl'] = empty($mconfigsnew['hometpl']) ? '' : trim($mconfigsnew['hometpl']);
			$mconfigsnew['templatedir'] = trim(strip_tags($mconfigsnew['templatedir']));//指定新的模板文件夹，所以可以有不同的模板样式
			if(empty($mconfigsnew['templatedir']) || preg_match("/[^a-zA-Z_0-9]+/",$mconfigsnew['templatedir'])){
				amessage('tpldirillegal',M_REFERER);
			}
			mmkdir(M_ROOT.'template/'.$mconfigsnew['templatedir']);
			$mconfigsnew['css_dir'] = trim(strip_tags($mconfigsnew['css_dir']));
			$mconfigsnew['js_dir'] = trim(strip_tags($mconfigsnew['js_dir']));
			$mconfigsnew['jsrefsource'] = trim(preg_replace("/(\s*(\r\n|\n\r|\n|\r)\s*)/","\r\n",$mconfigsnew['jsrefsource']));
			saveconfig('tpl');
		}else{
			$subsitenew['hometpl'] = empty($subsitenew['hometpl']) ? '' : trim($subsitenew['hometpl']);
			$subsitenew['templatedir'] = trim(strip_tags($subsitenew['templatedir']));//指定新的模板文件夹，所以可以有不同的模板样式
			if(empty($subsitenew['templatedir']) || preg_match("/[^a-zA-Z_0-9]+/",$subsitenew['templatedir'])){
				amessage('tpldirillegal',M_REFERER);
			}
			mmkdir(M_ROOT.'template/'.$subsitenew['templatedir'],0);
			$subsitenew['css_dir'] = trim(strip_tags($subsitenew['css_dir']));
			$subsitenew['js_dir'] = trim(strip_tags($subsitenew['js_dir']));
			$db->query("UPDATE {$tblprefix}subsites SET 
			hometpl='$subsitenew[hometpl]',
			templatedir='$subsitenew[templatedir]',
			css_dir='$subsitenew[css_dir]',
			js_dir='$subsitenew[js_dir]'
			WHERE sid='$sid'");
			updatecache('subsites');
		}
		adminlog(lang('websiteset'),lang('pagandtemset'));
		amessage('websitesetfinish',M_REFERER);
	}

}elseif($action == 'tplchannel'){
	url_nav(lang('tplallconfig'),$urlsarr,'channel',12);
	load_cache('channels');
	if(!$chids = array_keys($channels)) amessage('defineachannel');
	$chid = empty($chid) ? $chids[0] : $chid;
	$channel = read_cache('channel',$chid);
	cache_merge($channel,'channel',$sid);
	if(!submitcheck('bchannel')){
		$arr = array();
		foreach($channels as $k => $v) $arr[] = $chid == $k ? "<b>-$v[cname]-</b>" : "<a href=\"?entry=tplconfig&action=tplchannel&chid=$k$param_suffix\">$v[cname]</a>";
		echo tab_list($arr,6,0);

		tabheader("[$channel[cname]]".lang('tpl_set'),'channel',"?entry=tplconfig&action=tplchannel&chid=$chid$param_suffix");
		trbasic(lang('archive_content_template'),'channelnew[arctpl]',makeoption(array('' => lang('noset')) + mtplsarr('archive'),$channel['arctpl']),'select');
		trbasic(lang('archive_plus_page').'1'.lang('template'),'channelnew[arctpl1]',makeoption(array('' => lang('noset')) + mtplsarr('archive'),empty($channel['arctpl1']) ? '' : $channel['arctpl1']),'select');
		trbasic(lang('archive_plus_page').'2'.lang('template'),'channelnew[arctpl2]',makeoption(array('' => lang('noset')) + mtplsarr('archive'),empty($channel['arctpl2']) ? '' : $channel['arctpl2']),'select');
		$plus_mode = 'tplconfig_1';@include M_ROOT."./include/arcplus.inc.php";
		trbasic(lang('arc_prepage_tpl'),'channelnew[pretpl]',makeoption(array('' => lang('noset')) + mtplsarr('archive'),$channel['pretpl']),'select');
		trbasic(lang('search_tpl'),'channelnew[srhtpl]',makeoption(array('' => lang('noset')) + mtplsarr('search'),$channel['srhtpl']),'select');
		trbasic(lang('arc_add_tpl'),'channelnew[addtpl]',makeoption(array('' => lang('noset')) + mtplsarr('archive'),$channel['addtpl']),'select');
		tabfooter('bchannel');
		a_guide('tplchannel');
	}else{
		if(!$sid){
			$sqlstr = '';
			$sqlstr .= "arctpl1='".$channelnew['arctpl1']."',";
			$sqlstr .= "arctpl2='".$channelnew['arctpl2']."',";
			$plus_mode = 'tplconfig_2';@include M_ROOT."./include/arcplus.inc.php";
			$db->query("UPDATE {$tblprefix}channels SET 
				arctpl='$channelnew[arctpl]',
				$sqlstr
				pretpl='$channelnew[pretpl]',
				srhtpl='$channelnew[srhtpl]',
				addtpl='$channelnew[addtpl]'
				WHERE chid='$chid'");
			updatecache('channels');
		}else{
			$s_channels = empty($subsites[$sid]['channels']) ? array() : $subsites[$sid]['channels'];
			$s_channels[$chid]['arctpl'] = $channelnew['arctpl'];
			$s_channels[$chid]['arctpl1'] = $channelnew['arctpl1'];
			$s_channels[$chid]['arctpl2'] = $channelnew['arctpl2'];
			$plus_mode = 'tplconfig_3';@include M_ROOT."./include/arcplus.inc.php";
			$s_channels[$chid]['pretpl'] = $channelnew['pretpl'];
			$s_channels[$chid]['srhtpl'] = $channelnew['srhtpl'];
			$s_channels[$chid]['addtpl'] = $channelnew['addtpl'];
			$s_channels = addslashes(serialize($s_channels));
			$db->query("UPDATE {$tblprefix}subsites SET channels='$s_channels' WHERE sid='$sid'");
			updatecache('subsites');
		}
		adminlog(lang('detail_marc_channel'));
		amessage('channelmodifyfinish',M_REFERER);
	}
}elseif($action == 'tplfcatalog'){
	url_nav(lang('tplallconfig'),$urlsarr,'fcatalog',12);
	load_cache('fcatalogs');
	if(!$caids = array_keys($fcatalogs)) amessage('define_add_fcoclass');
	$caid = empty($caid) ? $caids[0] : $caid;
	$fcatalog = read_cache('fcatalog',$caid);
	if(!submitcheck('bfcatalog')){
		$arr = array();
		foreach($fcatalogs as $k => $v) $arr[] = $caid == $k ? "<b>-$v[title]-</b>" : "<a href=\"?entry=tplconfig&action=tplfcatalog&caid=$k$param_suffix\">$v[title]</a>";
		echo tab_list($arr,6,0);

		tabheader("[$fcatalog[title]]".lang('tpl_set'),'fcatalog',"?entry=tplconfig&action=tplfcatalog&caid=$caid$param_suffix");
		trbasic(lang('msg_con_tpl'),'fcatalognew[arctpl]',makeoption(array('' => lang('noset')) + mtplsarr('freeinfo'),$fcatalog['arctpl']),'select');
		tabfooter('bfcatalog');
		a_guide('tplfcatalog');
	}else{
		$db->query("UPDATE {$tblprefix}fcatalogs SET
			arctpl='$fcatalognew[arctpl]' 
			WHERE caid='$caid'");
		updatecache('fcatalogs');
		adminlog(lang('detail0_modify_freeinfo'));
		amessage('coclasssetfinish',M_REFERER);
	}
}elseif($action == 'tplmchannel'){
	url_nav(lang('tplallconfig'),$urlsarr,'mchannel',12);
	load_cache('mchannels');
	if(!$mchids = array_keys($mchannels)) amessage('conmemcha');
	$mchid = empty($mchid) ? $mchids[0] : $mchid;
	$mchannel = $mchannels[$mchid];
	if(!submitcheck('bmchannel')){
		$arr = array();
		foreach($mchannels as $k => $v) $arr[] = $mchid == $k ? "<b>-$v[cname]-</b>" : "<a href=\"?entry=tplconfig&action=tplmchannel&mchid=$k$param_suffix\">$v[cname]</a>";
		echo tab_list($arr,6,0);

		tabheader("[$mchannel[cname]]".lang('tpl_set'),'mchannel',"?entry=tplconfig&action=tplmchannel&mchid=$mchid$param_suffix");
		trbasic(lang('regtpl'),'mchannelnew[addtpl]',makeoption(array('' => lang('noset')) + mtplsarr('marchive'),$mchannel['addtpl']),'select');
		trbasic(lang('search_member_tpl'),'mchannelnew[srhtpl]',makeoption(array('' => lang('noset')) + mtplsarr('search'),$mchannel['srhtpl']),'select');
		tabfooter('bmchannel');
		a_guide('tplmchannel');
	}else{
		$db->query("UPDATE {$tblprefix}mchannels SET
			addtpl='$mchannelnew[addtpl]', 
			srhtpl='$mchannelnew[srhtpl]' 
			WHERE mchid='$mchid'");
		adminlog(lang('det_modify_mchannel'));
		updatecache('mchannels');
		amessage('channelmodifyfinish',M_REFERER);
	}
}elseif($action == 'tplcommu'){
	url_nav(lang('tplallconfig'),$urlsarr,'commu',12);
	load_cache('commus');
	foreach($commus as $k => $v)$commus[$k] = read_cache('commu',$k);
	if(empty($cuid))foreach($commus as $k => $v)if($v['addable'] || $v['sortable']){$cuid = $k;break;}
	$cuid && $commu = read_cache('commu',$cuid);
	if(!$cuid || (!$commu['addable'] && !$commu['sortable']))amessage('no_commu_tplset');
	if($sid) cache_merge($commu,'commu',$sid);
	if(!submitcheck('bcommu')){
		$arr = array();
		foreach($commus as $k => $v)if($v['addable'] || $v['sortable'])$arr[] = $cuid == $k ? "<b>-$v[cname]-</b>" : "<a href=\"?entry=tplconfig&action=tplcommu&cuid=$k$param_suffix\">$v[cname]</a>";
		echo tab_list($arr,6,0);

		tabheader("[$commu[cname]]".lang('tpl_set'),'commu',"?entry=tplconfig&action=tplcommu&cuid=$cuid$param_suffix");
		if(in_array($commu['cclass'],array('report','comment','answer','offer','reply',))) trbasic(lang('add_page_tpl'),'communew[addtpl]',makeoption(array('' => lang('noset')) + mtplsarr('commu'),$commu['addtpl']),'select');
		$commu['sortable'] && trbasic(lang('list_page_tpl'),'communew[cutpl]',makeoption(array('' => lang('noset')) + mtplsarr('commu'),$commu['cutpl']),'select');
		tabfooter('bcommu');
		a_guide('tplcommu');
	}else{
		if(!$sid){
			$communew['cutpl'] = empty($communew['cutpl']) ? '' : $communew['cutpl'];
			$communew['addtpl'] = empty($communew['addtpl']) ? '' : $communew['addtpl'];
			$db->query("UPDATE {$tblprefix}commus SET
				cutpl='$communew[cutpl]',
				addtpl='$communew[addtpl]'
				WHERE cuid='$cuid'");
			updatecache('commus');
		}else{
			$s_commus = empty($subsites[$sid]['commus']) ? array() : $subsites[$sid]['commus'];
			if(in_array($commu['cclass'],array('report','comment','answer','offer','reply',))) $s_commus[$cuid]['addtpl'] = $communew['addtpl'];
			if($commu['sortable']) $s_commus[$cuid]['cutpl'] = $communew['cutpl'];
			$s_commus = $s_commus ? addslashes(serialize($s_commus)) : '';
			$db->query("UPDATE {$tblprefix}subsites SET commus='$s_commus' WHERE sid='$sid'");
			updatecache('subsites');
		}
		adminlog(lang('detail_modify_citem'));
		amessage('itemmodifyfinish',M_REFERER);
	}
}elseif($action == 'tplmcommu'){
	url_nav(lang('tplallconfig'),$urlsarr,'mcommu',12);
	load_cache('mcommus');
	foreach($mcommus as $k => $v)$mcommus[$k] = read_cache('mcommu',$k);
	if(empty($cuid))foreach($mcommus as $k => $v)if($v['addable']){$cuid = $k;break;}
	$cuid && $mcommu = read_cache('mcommu',$cuid);
	if(!$cuid || !$mcommu['addable'])amessage('no_mcommu_tplset');
	if(!submitcheck('bmcommu')){
		$arr = array();
		foreach($mcommus as $k => $v)if($v['addable'])$arr[] = $cuid == $k ? "<b>-$v[cname]-</b>" : "<a href=\"?entry=tplconfig&action=tplmcommu&cuid=$k$param_suffix\">$v[cname]</a>";
		echo tab_list($arr,6,0);

		tabheader("[$mcommu[cname]]".lang('tpl_set'),'mcommu',"?entry=tplconfig&action=tplmcommu&cuid=$cuid$param_suffix");
		trbasic(lang('add_page_tpl'),'communew[addtpl]',makeoption(array('' => lang('noset')) + mtplsarr('mcommu'),$mcommu['addtpl']),'select');
		tabfooter('bmcommu');
		a_guide('tplmcommu');
	}else{
		$mcommunew['addtpl'] = empty($mcommunew['addtpl']) ? '' : $mcommunew['addtpl'];
		$db->query("UPDATE {$tblprefix}mcommus SET 
					addtpl='$mcommunew[addtpl]'
					WHERE cuid='$cuid'");
		updatecache('mcommus');
		adminlog(lang('demomecomit'));
		amessage('itemmodifyfinish',M_REFERER);
	}
}elseif($action == 'tplmatype'){
	url_nav(lang('tplallconfig'),$urlsarr,'matype',12);
	load_cache('matypes');
	foreach($matypes as $k => $v)$matypes[$k] = read_cache('matype',$k);
	if(empty($matid))foreach($matypes as $k => $v){$matid = $k;break;}
	if(empty($matid))amessage('no_matype_tplset');
	$matype = read_cache('matype',$matid);
	if(!submitcheck('bmatype')){
		$arr = array();
		foreach($matypes as $k => $v) $arr[] = $matid == $k ? "<b>-$v[cname]-</b>" : "<a href=\"?entry=tplconfig&action=tplmatype&matid=$k$param_suffix\">$v[cname]</a>";
		echo tab_list($arr,6,0);

		tabheader("[$matype[cname]]".lang('tpl_set'),'matype',"?entry=tplconfig&action=tplmatype&matid=$matid$param_suffix");
		trbasic(lang('content_open_tpl'),'matypenew[arctpl]',makeoption(array('' => lang('noset')) + mtplsarr('marchive'),$matype['arctpl']),'select');
		trbasic(lang('content_limit_tpl'),'matypenew[parctpl]',makeoption(array('' => lang('noset')) + mtplsarr('marchive'),$matype['parctpl']),'select');
		trbasic(lang('search_tpl'),'matypenew[srhtpl]',makeoption(array('' => lang('noset')) + mtplsarr('marchive'),$matype['srhtpl']),'select');
		trbasic(lang('add_tpl'),'matypenew[addtpl]',makeoption(array('' => lang('noset')) + mtplsarr('marchive'),$matype['addtpl']),'select');
		tabfooter('bmatype');
		a_guide('tplmatype');
	}else{
		$matypenew['arctpl'] = empty($matypenew['arctpl']) ? '' : $matypenew['arctpl'];
		$matypenew['parctpl'] = empty($matypenew['parctpl']) ? '' : $matypenew['parctpl'];
		$matypenew['srhtpl'] = empty($matypenew['srhtpl']) ? '' : $matypenew['srhtpl'];
		$matypenew['addtpl'] = empty($matypenew['addtpl']) ? '' : $matypenew['addtpl'];
		$db->query("UPDATE {$tblprefix}matypes SET 
					arctpl='$matypenew[arctpl]',
					parctpl='$matypenew[parctpl]',
					srhtpl='$matypenew[srhtpl]',
					addtpl='$matypenew[addtpl]'
					WHERE matid='$matid'");
		updatecache('matypes');
		adminlog(lang('demomecomit'));
		amessage('itemmodifyfinish',M_REFERER);
	}
}
function saveconfig($cftype){
	global $mconfigs,$mconfigsnew,$db,$tblprefix;
	foreach($mconfigsnew as $k => $v){
		if(!isset($mconfigs[$k]) || $mconfigs[$k] != $v){
			$db->query("REPLACE INTO {$tblprefix}mconfigs (varname,value,cftype)
				VALUES ('$k','$v','$cftype')");
		}
	}
	updatecache('mconfigs');

}

?>