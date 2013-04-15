<?php
!defined('M_COM') && exit('No Permission');
load_cache('currencys');
$curuser->sub_data();
mtabheader(lang('basestate'));
mtrbasic(lang('membercheckstate'),'',$curuser->info['checked'] ? lang('checked') : lang('checking'),'');
mtrbasic(lang('memberregtime'),'',$curuser->info['regdate'] ? date("$dateformat   $timeformat",$curuser->info['regdate']) : '','');
mtrbasic(lang('memberregip'),'',$curuser->info['regip'] ? $curuser->info['regip'] : '-','');
mtrbasic(lang('lastlogintime'),'',$curuser->info['lastvisit'] ? date("$dateformat   $timeformat",$curuser->info['lastvisit']) : '','');
mtrbasic(lang('lastactivetime'),'',$curuser->info['lastactive'] ? date("$dateformat   $timeformat",$curuser->info['lastactive']) : '','');
mtrbasic(lang('lastloginip'),'',$curuser->info['lastip'] ? $curuser->info['lastip'] : '-','');
mtrbasic(lang('memberclicks'),'',$curuser->info['clicks'],'');
mtabfooter();
mtabheader(lang('otherstate'));
mtrbasic(lang('addarcamount1'),'',$curuser->info['archives'],'');
mtrbasic(lang('issuearcamount1'),'',$curuser->info['checks'],'');
mtrbasic(lang('membercomments1'),'',$curuser->info['comments'],'');
mtrbasic(lang('arcsubscribeamount1'),'',$curuser->info['subscribes'],'');
mtrbasic(lang('adjsubscribeamount1'),'',$curuser->info['fsubscribes'],'');
mtrbasic(lang('uploadedadjunct1'),'',$curuser->info['uptotal'],'');
mtrbasic(lang('downloadedadjunct1'),'',$curuser->info['downtotal'],'');
mtabfooter();
mtabheader(lang('membercurrency'));
mtrbasic(lang('cashaccount'),'',$curuser->info['currency0'].lang('yuan'),'');
foreach($currencys as $crid => $currency){
	mtrbasic($currency['cname'],'',$curuser->info['currency'.$crid].$currency['unit'],'');
}
mtabfooter();
mtabheader(lang('memberstate'),'','',4);
foreach($grouptypes as $gtid => $grouptype){
	$usergroups = read_cache('usergroups',$gtid);
	$curuser->info['grouptype'.$gtid.'date'] = !$curuser->info['grouptype'.$gtid.'date'] ? '-' : date('Y-m-d',$curuser->info['grouptype'.$gtid.'date']);
	echo "<tr>\n".
		"<td width=\"15%\" class=\"item1\">$grouptype[cname]</td>\n".
		"<td width=\"35%\" class=\"item2\">".(!$curuser->info['grouptype'.$gtid] ? '-' : $usergroups[$curuser->info['grouptype'.$gtid]]['cname'])."</td>\n".
		"<td width=\"15%\" class=\"item1\">".lang('enddate')."</td>\n".
		"<td width=\"35%\" class=\"item2\">".$curuser->info['grouptype'.$gtid.'date']."</td>\n".
		"</tr>";
}
mtabfooter();
?>