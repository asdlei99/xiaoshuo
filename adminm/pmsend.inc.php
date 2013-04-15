<?php
!defined('M_COM') && exit('No Permission');
$enable_uc && include_once M_ROOT.'./adminm/pmuc.inc.php';
if(!submitcheck('bpmsend')){
	mtabheader(lang('sendpm'),'pmsend','adminm.php?action=pmsend',2,0,1);
	mtrbasic(lang('pmtitle'),'pmnew[title]','','btext');
	mtrbasic(lang('pmtonames'),'pmnew[tonames]',empty($tonames) ? '' : $tonames,'btext');
	mtrbasic(lang('pmcontent'),'pmnew[content]','','btextarea');
	$submitstr = '';
	$submitstr .= makesubmitstr('pmnew[title]',1,0,0,80);
	$submitstr .= makesubmitstr('pmnew[tonames]',1,0,0,100);
	$submitstr .= makesubmitstr('pmnew[content]',1,0,0,1000);
	$submitstr .= mtr_regcode('pm');
	mtabfooter('bpmsend');
	check_submit_func($submitstr);
}else{
	if(!regcode_pass('pm',empty($regcode) ? '' : trim($regcode))) mcmessage('regcodeerror',M_REFERER);
	$pmnew['title'] = trim($pmnew['title']);
	$pmnew['tonames'] = trim($pmnew['tonames']);
	$pmnew['content'] = trim($pmnew['content']);
	if(empty($pmnew['title']) || empty($pmnew['content']) || empty($pmnew['tonames'])){
		mcmessage('pmdatamissing',M_REFERER);
	}
	$tonames = array_filter(explode(',',$pmnew['tonames']));
	if($tonames){
		$query = $db->query("SELECT mid FROM {$tblprefix}members WHERE mname ".multi_str($tonames)." ORDER BY mid");
		$sqlstr = '';
		while($user = $db->fetch_array($query)){
			//收信数量限制分析
			$sqlstr .= ($sqlstr ? ',' : '')."('$pmnew[title]','$pmnew[content]','$user[mid]','$memberid','".$curuser->info['mname']."','$timestamp')";
		}
		$sqlstr && $db->query("INSERT INTO {$tblprefix}pms (title,content,toid,fromid,fromuser,pmdate) VALUES $sqlstr");

	}
	mcmessage('pmsendfinish','adminm.php?action=pmsend');
}
?>