<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
if(empty($submitmode)){
	tabfooter();

	tabheader(lang('arangeset'));//ֻ��Ҫɸѡ�ĵ�ģ�ͼ���
	$cuidsarr = array();
	foreach($mcommus as $k => $v) if($v['cclass'] == 'reply') $cuidsarr[$k] = $v['cname'];
	trbasic(lang('arange').lang('commuitem')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallcuids\" onclick=\"checkall(this.form,'cuidsnew','chkallcuids')\">".lang('selectall'),'',makecheckbox('cuidsnew[]',$cuidsarr,empty($aurl['setting']['cuids']) ? array() : explode(',',$aurl['setting']['cuids']),5),'',lang('agnoselect'));
	trbasic(lang('arange').lang('mchannel')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallmchids\" onclick=\"checkall(this.form,'mchidsnew','chkallmchids')\">".lang('selectall'),'',makecheckbox('mchidsnew[]',mchidsarr(1),empty($aurl['setting']['mchids']) ? array() : explode(',',$aurl['setting']['mchids']),5),'',lang('agnoselect'));
	$checkedarr = array('-1' => lang('nolimit'),'0' => lang('nocheck'),'1' => lang('checked'));
	trbasic(lang('arange').lang('check_state'),'',makeradio('aurlnew[setting][checked]',$checkedarr,!isset($aurl['setting']['checked']) ? '-1' : $aurl['setting']['checked']),'');
	tabfooter();

	tabheader(lang('pageresult'));
	$tnstr = "<input type=\"text\" size=\"25\" id=\"aurlnew[tplname]\" name=\"aurlnew[tplname]\" value=\"$aurl[tplname]\">&nbsp; 
			<input class=\"checkbox\" type=\"checkbox\" name=\"aurlnew[onlyview]\" id=\"aurlnew[onlyview]\" value=\"1\"".(empty($aurl['onlyview']) ? '' : ' checked').">".lang('onlyview');
	trbasic(lang('customapage'),'',$tnstr,'',lang('agcustomapage'));
	$filtersarr = array(
	'commu' => lang('commuitem'),
	'check' => lang('check_state'),
	);
	trbasic(lang('view_filters')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallfilters\" onclick=\"checkall(this.form,'filtersnew','chkallfilters')\">".lang('selectall'),'',makecheckbox('filtersnew[]',$filtersarr,empty($aurl['setting']['filters']) ? array() : explode(',',$aurl['setting']['filters']),5),'',lang('agnoselect1'));

	$listsarr = array(
	'channel' => lang('mchannel'),
	'commu' => lang('commuitem'),
	'check' => lang('check_state'),
	'adddate' => lang('add_time'),
	'edit' => lang('edit'),//�ϼ�������
	);
	trbasic(lang('view_lists')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkalllists\" onclick=\"checkall(this.form,'listsnew','chkalllists')\">".lang('selectall'),'',makecheckbox('listsnew[]',$listsarr,empty($aurl['setting']['lists']) ? array() : explode(',',$aurl['setting']['lists']),5),'',lang('agnoselect1'));
	$operatesarr = array(
	'delete' => lang('delete'),
	'check' => lang('check'),
	'uncheck' => lang('uncheck'),
	);
	trbasic(lang('view_operates')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkalloperates\" onclick=\"checkall(this.form,'operatesnew','chkalloperates')\">".lang('selectall'),'',makecheckbox('operatesnew[]',$operatesarr,empty($aurl['setting']['operates']) ? array() : explode(',',$aurl['setting']['operates']),5),'',lang('agnoselect1'));
}else{
	foreach(array('cuids','mchids','filters','lists','operates',) as $var){
		$aurlnew['setting'][$var] = empty(${$var.'new'}) ? '' : implode(',',${$var.'new'});
	}
	$aurlnew['url'] = "?entry=mreplys&action=mreplysedit&nauid=$auid";
}
?>