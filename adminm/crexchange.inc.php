<?php
!defined('M_COM') && exit('No Permission');
load_cache('crprojects,currencys');

if($enable_uc) $outextcredits = unserialize($outextcredits);
if(!submitcheck('bcrexchange')){
	echo "<div class=\"itemtitle\"><ul class=\"tab1 tab0 bdtop\">\n";
	foreach ($subMenu_pays as $k => $v) {
		$nclassstr = 'td24'.($action == $k ? ' current' : '');
		echo "<li".($nclassstr ? " class=\"$nclassstr\"" : '')."><a href=\"/adminm.php?action={$k}\"><span>{$v}</span></a></li>\n";
	}
	echo "</ul></div><div class=\"blank15h\"></div>";
	$cridsarr = cridsarr(1);
	foreach($crprojects as $crpid => $crproject){
		mtabheader($cridsarr[$crproject['scrid']].lang('exchangeto').$cridsarr[$crproject['ecrid']],'crexchagne'.$crpid,"adminm.php?action=crexchange");
		mtrbasic(lang('membercurrent').$cridsarr[$crproject['scrid']],'',$curuser->info['currency'.$crproject['scrid']],'');
		mtrbasic(lang('membercurrent').$cridsarr[$crproject['ecrid']],'',$curuser->info['currency'.$crproject['ecrid']],'');
		mtrbasic(lang('exchangescale'),'',$crproject['scurrency'].'&nbsp; '.$cridsarr[$crproject['scrid']].'&nbsp; :&nbsp; '.$crproject['ecurrency'].'&nbsp; '.$cridsarr[$crproject['ecrid']],'');
		mtrbasic(lang('exchangeamount').'('.$cridsarr[$crproject['scrid']].')','exchangesource');
		echo "<input type=\"hidden\" name=\"crpid\" value=\"$crpid\">";
		mtabfooter('bcrexchange',lang('exchange'));
	}
	if($enable_uc){
		foreach($outextcredits as $k => $v){
			mtabheader($cridsarr[$v['creditsrc']].lang('exchangeto').$v['title'],'ocrexchagne'.$k,"adminm.php?action=crexchange");
			mtrbasic(lang('membercurrent').$cridsarr[$v['creditsrc']],'',$curuser->info['currency'.$v['creditsrc']],'');
			mtrbasic(lang('exchangescale'),'',$v['ratiosrc' ].'&nbsp; :&nbsp; '.$v['ratiodesc' ],'');
			mtrbasic(lang('exchangeamount').'('.$cridsarr[$v['creditsrc']].')','exchangesource');
			echo "<input type=\"hidden\" name=\"ocrpid\" value=\"$k\">";
			echo "<input type=\"hidden\" name=\"isout\" value=\"1\">";
			mtabfooter('bcrexchange',lang('exchange'));
		}
	}
}else{
	if(empty($isout)){
		(empty($crpid) || empty($crprojects[$crpid])) && mcmessage('curexproject');
		$exchangesource = max(0,intval($exchangesource));
		!$exchangesource && mcmessage('inputexamount');
		$crproject = $crprojects[$crpid];
		($exchangesource < $crproject['scurrency']) && mcmessage('examountsmall');
		if($exchangesource > $curuser->info['currency'.$crproject['scrid']]) mcmessage('examountlarge');
		$num = floor($exchangesource / $crproject['scurrency']);
		$curuser->updatecrids(array($crproject['scrid'] => -$crproject['scurrency'] * $num),0,lang('currencyexcurrency'));
		$curuser->updatecrids(array($crproject['ecrid'] => $crproject['ecurrency'] * $num),0,lang('currencyexcurrency'));
		$curuser->updatedb();
		mcmessage('currencyexfinish',"adminm.php?action=crexchange");
	}else{
		empty($outextcredits[$ocrpid]) && mcmessage('uccurrencyexitem');
		$exchangesource = max(0,intval($exchangesource));
		!$exchangesource && mcmessage('inputexamount');
		$outcredit = $outextcredits[$ocrpid];
		($exchangesource < $outcredit['ratiosrc']) && mcmessage('examountsmall');
		if($exchangesource > $curuser->info['currency'.$outcredit['creditsrc']]) mcmessage('examountlarge');
		$num = floor($exchangesource / $outcredit['ratiosrc']);
		require_once M_ROOT.'./include/ucenter/config.inc.php';
		require_once M_ROOT.'./uc_client/client.php';
		$ucresult = uc_get_user($curuser->info['mname']);
		if(!is_array($ucresult)) mcmessage('noucuser');
		$uid = $ucresult[0];
		$ucresult = uc_credit_exchange_request($uid,$outcredit['creditsrc'],$outcredit['creditdesc'],$outcredit['appiddesc'],$outcredit['ratiodesc'] * $num);
		if(!$ucresult) mcmessage('currencyexfailed',"adminm.php?action=crexchange");
		$curuser->updatecrids(array($outcredit['creditsrc'] => -$outcredit['ratiosrc'] * $num),0,lang('currency exchange currency'));
		$curuser->updatedb();
		mcmessage('currencyexfinish',"adminm.php?action=crexchange");
	}
}
?>
