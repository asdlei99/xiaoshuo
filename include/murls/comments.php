<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
if(empty($submitmode)){
	tabfooter();

	tabheader(lang('arangeset'));//ֻ��Ҫɸѡ�ĵ�ģ�ͼ���
	$cuidsarr = array();
	foreach($commus as $k => $v) if($v['cclass'] == 'comment') $cuidsarr[$k] = $v['cname'];
	trbasic(lang('arange').lang('commuitem')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallcuids\" onclick=\"checkall(this.form,'cuidsnew','chkallcuids')\">".lang('selectall'),'',makecheckbox('cuidsnew[]',$cuidsarr,empty($murl['setting']['cuids']) ? array() : explode(',',$murl['setting']['cuids']),5),'',lang('agnoselect'));
	$checkedarr = array('-1' => lang('nolimit'),'0' => lang('nocheck'),'1' => lang('checked'));
	trbasic(lang('arange').lang('check_state'),'',makeradio('murlnew[setting][checked]',$checkedarr,!isset($murl['setting']['checked']) ? '-1' : $murl['setting']['checked']),'');
	trbasic(lang('arange').lang('achannel')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallchids\" onclick=\"checkall(this.form,'chidsnew','chkallchids')\">".lang('selectall'),'',makecheckbox('chidsnew[]',chidsarr(1),empty($murl['setting']['chids']) ? array() : explode(',',$murl['setting']['chids']),5),'',lang('agnoselect'));
	$caidsarr = array();
	foreach($acatalogs as $k => $v) $caidsarr[$k] = $v['title'].'('.$v['level'].')';
	trbasic(lang('arange').lang('catalog')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallcaids\" onclick=\"checkall(this.form,'caidsnew','chkallcaids')\">".lang('selectall'),'',makecheckbox('caidsnew[]',$caidsarr,empty($murl['setting']['caids']) ? array() : explode(',',$murl['setting']['caids']),5),'',lang('agnoselect'));
	tabfooter();

	tabheader(lang('pageresult'));
	$tnstr = "<input type=\"text\" size=\"25\" id=\"murlnew[tplname]\" name=\"murlnew[tplname]\" value=\"$murl[tplname]\">&nbsp; 
			<input class=\"checkbox\" type=\"checkbox\" name=\"murlnew[onlyview]\" id=\"murlnew[onlyview]\" value=\"1\"".(empty($murl['onlyview']) ? '' : ' checked').">".lang('onlyview');
	trbasic(lang('customapage'),'',$tnstr,'',lang('agcustomapage'));
	$filtersarr = array(
	'commu' => lang('commuitem'),
	'channel' => lang('achannel'),
	'check' => lang('check_state'),
	);
	foreach($ucotypes as $k => $v) if($v['cclass'] == 'comment') $filtersarr['uccid'.$k] = $v['cname'];
	trbasic(lang('view_filters')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallfilters\" onclick=\"checkall(this.form,'filtersnew','chkallfilters')\">".lang('selectall'),'',makecheckbox('filtersnew[]',$filtersarr,empty($murl['setting']['filters']) ? array() : explode(',',$murl['setting']['filters']),5),'',lang('agnoselect1'));

	$listsarr = array(
	'catalog' => lang('catalog'),
	'uclass' => lang('uclass'),
	'channel' => lang('achannel'),
	'commu' => lang('commuitem'),
	'check' => lang('check_state'),
	'adddate' => lang('add_time'),
	'updatedate' => lang('update_time'),
	'edit' => lang('edit'),
	);
	foreach($ucotypes as $k => $v) if($v['cclass'] == 'comment') $listsarr['uccid'.$k] = $v['cname'];
	trbasic(lang('view_lists')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkalllists\" onclick=\"checkall(this.form,'listsnew','chkalllists')\">".lang('selectall'),'',makecheckbox('listsnew[]',$listsarr,empty($murl['setting']['lists']) ? array() : explode(',',$murl['setting']['lists']),5),'',lang('agnoselect1'));

	$imuidsarr = array();
	foreach($inmurls as $k => $v) if(in_array($v['uclass'],array('commentetail','custom'))) $imuidsarr[$k] = '<b>'.$v['cname'].'</b>&nbsp; '.$v['remark'];
	trbasic(lang('view_inmurls')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallimuids\" onclick=\"checkall(this.form,'imuidsnew','chkallimuids')\">".lang('selectall'),'',makecheckbox('imuidsnew[]',$imuidsarr,empty($murl['setting']['imuids']) ? array() : explode(',',$murl['setting']['imuids']),3),'',lang('agnoselect1'));
	trbasic(lang('adm_title'),'murlnew[mtitle]',$murl['mtitle'],'text',lang('aga_title'));
	trbasic(lang('adm_guide'),'murlnew[guide]',$murl['guide'],'textarea',lang('aga_title'));

}else{
	foreach(array('cuids','caids','chids','filters','lists','imuids',) as $var){
		$murlnew['setting'][$var] = empty(${$var.'new'}) ? '' : implode(',',${$var.'new'});
	}
	$murlnew['url'] = "?action=comments&nmuid=$muid";
}
?>