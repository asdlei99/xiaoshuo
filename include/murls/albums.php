<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
if(empty($submitmode)){
	tabfooter();

	tabheader(lang('arangeset'));
	trbasic(lang('arange').lang('achannel')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallchids\" onclick=\"checkall(this.form,'chidsnew','chkallchids')\">".lang('selectall'),'',makecheckbox('chidsnew[]',chidsarr(1),empty($murl['setting']['chids']) ? array() : explode(',',$murl['setting']['chids']),5),'',lang('agnoselect'));
	$checkedarr = array('-1' => lang('nolimit'),'0' => lang('nocheck'),'1' => lang('checked'));
	trbasic(lang('arange').lang('subsite')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallsids\" onclick=\"checkall(this.form,'sidsnew','chkallsids')\">".lang('selectall'),'',makecheckbox('sidsnew[]',array('m' => lang('msite')) + sidsarr(),empty($murl['setting']['sids']) ? array() : explode(',',$murl['setting']['sids']),5),'',lang('agnoselect'));
	trbasic(lang('arange').lang('check_state'),'',makeradio('murlnew[setting][checked]',$checkedarr,!isset($murl['setting']['checked']) ? '-1' : $murl['setting']['checked']),'');
	$validarr = array('-1' => lang('nolimit'),'0' => lang('invalid'),'1' => lang('available'));
	trbasic(lang('arange').lang('validperiod_state'),'',makeradio('murlnew[setting][valid]',$validarr,!isset($murl['setting']['valid']) ? '-1' : $murl['setting']['valid']),'');

	$caidsarr = array();
	foreach($acatalogs as $k => $v) $caidsarr[$k] = $v['title'].'('.$v['level'].')';
	trbasic(lang('arange').lang('catalog')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallcaids\" onclick=\"checkall(this.form,'caidsnew','chkallcaids')\">".lang('selectall'),'',makecheckbox('caidsnew[]',$caidsarr,empty($murl['setting']['caids']) ? array() : explode(',',$murl['setting']['caids']),5),'',lang('agnoselect'));

	foreach($cotypes as $k => $v){
		global ${'ccidsnew'.$k};
		$ccidsarr = array(0 => lang('nococlass'));
		$coclasses = read_cache('coclasses',$k);
		foreach($coclasses as $k1 => $v1) $ccidsarr[$k1] = $v1['title'].'('.$v1['level'].')';
		trbasic(lang('arange').$v['cname']."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallccids$k\" onclick=\"checkall(this.form,'ccidsnew$k','chkallccids$k')\">".lang('selectall'),'',makecheckbox('ccidsnew'.$k.'[]',$ccidsarr,empty($murl['setting']["ccids$k"]) ? array() : explode(',',$murl['setting']["ccids$k"]),5),'',lang('agnoselect'));
	}
	unset($coclasses,$coclass);
	tabfooter();

	tabheader(lang('pageresult'));
	$tnstr = "<input type=\"text\" size=\"25\" id=\"murlnew[tplname]\" name=\"murlnew[tplname]\" value=\"$murl[tplname]\">&nbsp; 
			<input class=\"checkbox\" type=\"checkbox\" name=\"murlnew[onlyview]\" id=\"murlnew[onlyview]\" value=\"1\"".(empty($murl['onlyview']) ? '' : ' checked').">".lang('onlyview');
	trbasic(lang('customapage'),'',$tnstr,'',lang('agcustomapage'));
	$filtersarr = array(
	'catalog' => lang('catalog'),
	'check' => lang('check_state'),
	'valid' => lang('validperiod_state'),
	);
	trbasic(lang('view_filters')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallfilters\" onclick=\"checkall(this.form,'filtersnew','chkallfilters')\">".lang('selectall'),'',makecheckbox('filtersnew[]',$filtersarr,empty($murl['setting']['filters']) ? array() : explode(',',$murl['setting']['filters']),5),'',lang('agnoselect1'));

	$listsarr = array(
	'catalog' => lang('catalog'),
	'channel' => lang('arctype'),
	'check' => lang('check_state'),
	'valid' => lang('validperiod_state'),
	'clicks' => lang('clicks'),
	'comments' => lang('comments'),
	'replys' => lang('replys'),
	'praises' => lang('praises'),
	'debases' => lang('debases'),
	'adddate' => lang('add_time'),
	'updatedate' => lang('update_time'),
	'refreshdate' => lang('readd_time'),
	'enddate' => lang('end1_time'),
	'view' => lang('view_info'),//��ʾ��ϸ��Ϣ
	'add' => lang('add'),
	);
	foreach($cotypes as $k => $v) if(!$v['self_reg']) $listsarr["ccid$k"] = $v['cname'];
	trbasic(lang('view_lists')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkalllists\" onclick=\"checkall(this.form,'listsnew','chkalllists')\">".lang('selectall'),'',makecheckbox('listsnew[]',$listsarr,empty($murl['setting']['lists']) ? array() : explode(',',$murl['setting']['lists']),5),'',lang('agnoselect1'));
	
	trbasic(lang('adm_title'),'murlnew[mtitle]',$murl['mtitle'],'text',lang('aga_title'));
	trbasic(lang('adm_guide'),'murlnew[guide]',$murl['guide'],'textarea',lang('aga_title'));

}else{
	foreach(array('sids','caids','chids','filters','lists',) as $var){
		$murlnew['setting'][$var] = empty(${$var.'new'}) ? '' : implode(',',${$var.'new'});
	}
	foreach($cotypes as $k => $v){
		$murlnew['setting']['ccids'.$k] = empty(${'ccidsnew'.$k}) ? '' : implode(',',${'ccidsnew'.$k});
	}
	$murlnew['url'] = "?action=albums&nmuid=$muid";
}
?>