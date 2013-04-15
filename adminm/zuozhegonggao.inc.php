<?php
!defined('M_COM') && exit('No Permission');
if(!submitcheck('bzzgonggao')){
	mtabheader('作者公告设置','zzgonggao','adminm.php?action=zuozhegonggao',2,0,1);
	//mtrbasic(lang('oldpwd'),'opassword','','password');
	//mtrbasic(lang('newpwd'),'npassword','','password');
	//mtrbasic(lang('repwd'),'npassword2','','password');
	$sql = "SELECT * FROM {$tblprefix}zuozhegonggao WHERE mid='{$curuser->info['mid']}' LIMIT 1";
	$query = $db->query($sql);
	$result = $db->fetch_array($query);
	if (!empty($result)) {
		$gonggao = $result['gonggao'];
	} else {
		$gonggao = '';
	}
	mtrbasic('公告内容：','gonggao', $gonggao, 'textarea');
	$submitstr = '';
	$submitstr .= makesubmitstr('gonggao',1,0,0,0);
	//$submitstr .= makesubmitstr('npassword',1,0,0,15);
	//$submitstr .= makesubmitstr('npassword2',1,0,0,15);
	$submitstr .= mtr_regcode('login');
	mtabfooter('bzzgonggao');
	check_submit_func($submitstr);
}else{
	if(!regcode_pass('login',empty($regcode) ? '' : trim($regcode))) mcmessage('regcodeerror','adminm.php?action=zuozhegonggao');
	$gonggao = trim($gonggao);
	$sql = "SELECT * FROM {$tblprefix}zuozhegonggao WHERE mid='{$curuser->info['mid']}' LIMIT 1";
	$query = $db->query($sql);
	$result = $db->fetch_array($query);
	if (empty($result)) {
		$sql = "INSERT INTO {$tblprefix}zuozhegonggao (mid,gonggao) VALUES('{$curuser->info['mid']}', '{$gonggao}')";
		$result = $db->query($sql);
	} else {
		$sql = "UPDATE {$tblprefix}zuozhegonggao SET gonggao='{$gonggao}' WHERE mid='{$curuser->info['mid']}'";
		$result = $db->query($sql);
	}
	if ($result == true) {
		mcmessage('公告更新完成','adminm.php?action=zuozhegonggao');
	} else {
		mcmessage('公告更新失败','adminm.php?action=zuozhegonggao');
	}
	
}
?>
