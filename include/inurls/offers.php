<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
if(empty($submitmode)){
	tabfooter();

	tabheader(lang('arangeset'));//ֻ��Ҫɸѡ�ĵ�ģ�ͼ���
	$checkedarr = array('-1' => lang('nolimit'),'0' => lang('nocheck'),'1' => lang('checked'));
	trbasic(lang('arange').lang('check_state'),'',makeradio('inurlnew[setting][checked]',$checkedarr,!isset($inurl['setting']['checked']) ? '-1' : $inurl['setting']['checked']),'');
	$validarr = array('-1' => lang('nolimit'),'0' => lang('invalid'),'1' => lang('available'));
	trbasic(lang('arange').lang('validperiod_state'),'',makeradio('inurlnew[setting][valid]',$validarr,!isset($inurl['setting']['valid']) ? '-1' : $inurl['setting']['valid']),'');
	tabfooter();

	tabheader(lang('pageresult'));
	$tnstr = "<input type=\"text\" size=\"25\" id=\"inurlnew[tplname]\" name=\"inurlnew[tplname]\" value=\"$inurl[tplname]\">&nbsp; 
			<input class=\"checkbox\" type=\"checkbox\" name=\"inurlnew[onlyview]\" id=\"inurlnew[onlyview]\" value=\"1\"".(empty($inurl['onlyview']) ? '' : ' checked').">".lang('onlyview');
	trbasic(lang('customapage'),'',$tnstr,'',lang('agcustomapage'));
	$filtersarr = array(
	'check' => lang('check_state'),
	'valid' => lang('validperiod_state'),
	);
	trbasic(lang('view_filters')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkallfilters\" onclick=\"checkall(this.form,'filtersnew','chkallfilters')\">".lang('selectall'),'',makecheckbox('filtersnew[]',$filtersarr,empty($inurl['setting']['filters']) ? array() : explode(',',$inurl['setting']['filters']),5),'',lang('agnoselect1'));

	$listsarr = array(
	'mname' => lang('member'),
	'oprice' => lang('price'),
	'check' => lang('check_state'),
	'valid' => lang('validperiod_state'),
	'adddate' => lang('add_time'),
	'updatedate' => lang('update_time'),
	'enddate' => lang('enddate'),
	'edit' => lang('edit'),//�ϼ�������
	);
	trbasic(lang('view_lists')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkalllists\" onclick=\"checkall(this.form,'listsnew','chkalllists')\">".lang('selectall'),'',makecheckbox('listsnew[]',$listsarr,empty($inurl['setting']['lists']) ? array() : explode(',',$inurl['setting']['lists']),5),'',lang('agnoselect1'));
	$operatesarr = array(
	'delete' => lang('delete'),
	'check' => lang('check'),
	'uncheck' => lang('uncheck'),
	'readd' => lang('readd'),
	);
	trbasic(lang('view_operates')."<br><input class=\"checkbox\" type=\"checkbox\" name=\"chkalloperates\" onclick=\"checkall(this.form,'operatesnew','chkalloperates')\">".lang('selectall'),'',makecheckbox('operatesnew[]',$operatesarr,empty($inurl['setting']['operates']) ? array() : explode(',',$inurl['setting']['operates']),5),'',lang('agnoselect1'));

}else{
	foreach(array('filters','lists','operates',) as $var){
		$inurlnew['setting'][$var] = empty(${$var.'new'}) ? '' : implode(',',${$var.'new'});
	}
	$inurlnew['url'] = "?entry=inarchive&action=offers&niuid=$iuid&aid=";
}
?>