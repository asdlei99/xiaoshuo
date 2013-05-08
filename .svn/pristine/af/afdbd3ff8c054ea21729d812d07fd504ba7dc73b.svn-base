<?php
!defined('M_COM') && exit('No Permission');
load_cache('currencys');
$mchid = $curuser->info['mchid'];
$cashgtids = array();
foreach($grouptypes as $k => $grouptype){
	if($grouptype['mode'] == 3 && !in_array($mchid,explode(',',$grouptype['mchids']))){
		$cashgtids[$k] = $grouptype;
	}
}
empty($cashgtids) && mcmessage('addcrexusergroup');
if(!submitcheck('bgtexchange')){
	foreach($cashgtids as $gtid => $grouptype){
		$usergroups = read_cache('usergroups',$gtid);
		$ugidsarr = array();
		foreach($usergroups as $ugid => $usergroup){
			in_array($mchid,explode(',',$usergroup['mchids'])) && $ugidsarr[$ugid] = $usergroup['cname'].'('.$usergroup['currency'].')';
		}
		$crname = empty($grouptype['crid']) ? lang('cash') : $currencys[$grouptype['crid']]['cname'];
		mtabheader($crname.lang('exchange').$grouptype['cname'],'gtexchagne'.$gtid,"adminm.php?action=gtexchange&gtid=$gtid");
		mtrbasic(lang('membercurrent').$crname,'',$curuser->info['currency'.$grouptype['crid']],'');
		mtrbasic($grouptype['cname'].lang('currentusergroup'),'',$curuser->info['grouptype'.$gtid] ? $usergroups[$curuser->info['grouptype'.$gtid]]['cname'] : '-','');
		mtrbasic(lang('curusergroupenddate'),'',$curuser->info['grouptype'.$gtid.'date'] ? date($dateformat,$curuser->info['grouptype'.$gtid.'date']) : '-','');
		mtrbasic(lang('exchangeusergroup'),'exchangeugid',makeoption($ugidsarr),'select');
		mtabfooter('bgtexchange',lang('exchange'));
	}
}else{
	(empty($gtid) || empty($grouptypes[$gtid]) || in_array($mchid,explode(',',$grouptypes[$gtid]['mchids']))) && mcmessage('getgrouptype','adminm.php?action=gtexchange');
	$grouptype = $grouptypes[$gtid];
	$crid = $grouptype['crid']; 
	$usergroups = read_cache('usergroups',$gtid);
	(empty($exchangeugid) || empty($usergroups[$exchangeugid]) || !in_array($mchid,explode(',',$usergroups[$exchangeugid]['mchids']))) && mcmessage('getusergroup','adminm.php?action=gtexchange');
	$curuser->info['currency'.$crid] < $usergroups[$exchangeugid]['currency'] && mcmessage('noenoughcurrency','adminm.php?action=gtexchange');
	$usergroup = read_cache('usergroup',$gtid,$exchangeugid);
	if($curuser->info['grouptype'.$gtid] == $exchangeugid){//续期
		if($usergroup['limitday'] && $curuser->info['grouptype'.$gtid.'date']){
			$curuser->updatefield('grouptype'.$gtid.'date',$curuser->info['grouptype'.$gtid.'date'] + $usergroup['limitday'] * 86400);
		}else{
			$curuser->updatefield('grouptype'.$gtid.'date',0);
		}
	}else{//变更
		$curuser->updatefield('grouptype'.$gtid,$exchangeugid);
		if($usergroup['limitday']){
			$curuser->updatefield('grouptype'.$gtid.'date',$timestamp + $usergroup['limitday'] * 86400);
		}else{
			$curuser->updatefield('grouptype'.$gtid.'date',0);
		}
		if($grouptypes[$gtid]['allowance']) $curuser->reset_allowance();//如果会员组变更分析限额变化
	}
	$curuser->updatecrids(array($crid => -$usergroup['currency']),1,lang('currencyexusergroup'));
	mcmessage('cyexusergroupfinish',"adminm.php?action=gtexchange");
}
?>
