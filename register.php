<?php
include_once dirname(__FILE__).'/include/general.inc.php';
include_once dirname(__FILE__).'/include/common.fun.php';
load_cache('mchannels,acatalogs,cotypes');
if($inajax){
	if($action == 'checkmname') {
		$mname = addslashes(trim(stripslashes($mname)));
		$guestexp = '\xA1\xA1|^Guest|^\xD3\xCE\xBF\xCD|\xB9\x43\xAB\xC8';
		$censorexp = '/^('.str_replace(array('\\*', "\r\n", ' '), array('.*', '|', ''), preg_quote(($censoruser = trim($censoruser)), '/')).')$/i';
		if(preg_match("/^\s*$|^c:\\con\\con$|[%,\*\"\s\t\<\>\&]|$guestexp/is",$mname) || ($censoruser && @preg_match($censorexp,$mname))){
			$message = lang('usercnameillegal');
		}else{
			$query = $db->query("SELECT mid FROM {$tblprefix}members WHERE mname='$mname'");
			if($db->num_rows($query)){
				$message = lang('usercnamerepeat');
			}else $message = 'succeed';
		}
	}elseif($action == 'checkregcode'){
		if(!regcode_pass('register',empty($regcode) ? '' : trim($regcode))){
			$message = lang('regcodeerror');
		}else $message = 'succeed';
	}
	@header("Expires: -1");
	@header("Cache-Control: no-store, private, post-check=0, pre-check=0, max-age=0", FALSE);
	@header("Pragma: no-cache");
	header("Content-type: application/xml");
	echo "<?xml version=\"1.0\" encoding=\"$mcharset\"?>\n<root><![CDATA[";
	echo $message;
	echo ']]></root>';
	die();

}else{
	include_once M_ROOT.'./include/parse.fun.php';
	include_once M_ROOT."./include/upload.cls.php";
	include_once M_ROOT."./include/fields.fun.php";
	include_once M_ROOT."./include/fields.cls.php";
	empty($forward) && $forward = M_REFERER;
	$forwardstr = "forward=".urlencode($forward);
	if_siteclosed($sid);
	$memberid && message('dorepeatregist', '',"<a href=\"login.php?action=logout\">".lang('logout')."</a>");
	$registerclosed && message(empty($regclosedreason) ? 'defaultregclosedreason' : mnl2br($regclosedreason));
	$mchid = empty($mchid) ? 1 : max(1,intval($mchid));
	if(!($mchannel = $mchannels[$mchid])) message('choosememchann');
	if(!submitcheck('register')){
		if($enable_pptin && !empty($pptin_url) && $pptin_register){
			$url = $pptin_url.$pptin_register;
			$url .= (strpos($url,'?') ? '&' : '?').'forward='.rawurlencode($forward);
			header('location:'.$url);
			exit;
		}
		if(!($tplname = @$mchannel['addtpl'])) include M_ROOT.'./include/register.inc.php';
		
		$_da = array('mchid' => $mchid,);
		_aenter($_da,1);
		@extract($btags);
		extract($_da,EXTR_OVERWRITE);
		tpl_refresh($tplname);
		@include M_ROOT."template/$templatedir/pcache/$tplname.php";
		
		$_content = ob_get_contents();
		ob_clean();
		mexit($_content);
	}else{
		$mname = addslashes(trim(stripslashes($mname)));
		$password = trim($password);
		$password2 = trim($password2);
		$email = trim($email);
		if(!regcode_pass('register',empty($regcode) ? '' : trim($regcode))) message('regcodeerror',M_REFERER);
		if(strlen($mname) < 3 || strlen($mname) > 15) message('memnamelengthillegal',M_REFERER);
		$guestexp = '\xA1\xA1|^Guest|^\xD3\xCE\xBF\xCD|\xB9\x43\xAB\xC8';
		$censorexp = '/^('.str_replace(array('\\*', "\r\n", ' '), array('.*', '|', ''), preg_quote(($censoruser = trim($censoruser)), '/')).')$/i';
		if(preg_match("/^\s*$|^c:\\con\\con$|[%,\*\"\s\t\<\>\&]|$guestexp/is",$mname) || ($censoruser && @preg_match($censorexp,$mname))){
			message('membcnameilleg',M_REFERER);
		}
		if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}members WHERE mname='$mname'")) message('memcnamerepeat',M_REFERER);
		if($password != $password2) message('notsamepwd',M_REFERER);
		if(!$password || strlen($password) > 15 || $password != addslashes($password)){
			message('mempasswordillegal',M_REFERER);
		}
		$md5_password = md5(md5($password));
		if(!$email || !isemail($email)) message('mememailillegal',M_REFERER);
		if($enable_uc){
			include_once M_ROOT.'./include/ucenter/config.inc.php';
			include_once M_ROOT.'./uc_client/client.php';
			$uid = uc_user_register($mname, $password, $email);
			if($uid <= 0) {
				if($uid == -1) {
					message('membcnameilleg');
				} elseif($uid == -2) {
					message('membcnameilleg');
				} elseif($uid == -3) {
					message('memcnamerepeat');
				} elseif($uid == -4) {
					message('mememailillegal');
				} elseif($uid == -5) {
					message('mememailillegal');
				} elseif($uid == -6) {
					message('mememailillegal');
				} else {
					message('erroroperate');
				}
			}
		}
		if(!($mchannel = $mchannels[$mchid])) message('choosememchann');
		foreach(array('ccoids','additems') as $var) $$var = $mchannel[$var] ? explode(',',$mchannel[$var]) : array();
		$mfields = fields_order(read_cache('mfields',$mchid));
		$autocheck = $mchannel['autocheck'];

		$mainarr = $subarr = $customarr = array();
		$mainarr['mname'] = $mname;
		$mainarr['password'] = $md5_password;
		$mainarr['email'] = $email;
		if(in_array('mtcid',$additems)){
			$mainarr['mtcid'] = empty($mtcid) ? 1 : $mtcid;
		}
		if(in_array('caid',$ccoids) && in_array('caid',$additems)){
			$mainarr['caid'] = empty($caid) ? 0 : $caid;
		}
		foreach($cotypes as $k => $v){
			if(in_array('ccid'.$k,$ccoids) && in_array('ccid'.$k,$additems)){
				$mainarr["ccid$k"] = empty(${"ccid$k"}) ? 0 : ${"ccid$k"};
			}
		}
		foreach($grouptypes as $k => $v){
			if(!$v['mode'] && in_array("grouptype$k",$additems)){
				$mainarr["grouptype$k"] = empty(${"grouptype$k"}) ? 0 : ${"grouptype$k"};
			}
		}
		foreach($currencys as $crid => $currency){
			if($currency['available'] && $currency['initial']) $mainarr["currency$crid"] = $currency['initial'];
		}
		$mainarr['checked'] = $autocheck == 1 ? 1 : 0;
		$mainarr['regip'] = $onlineip;
		$mainarr['regdate'] = $timestamp;
		$c_upload = new cls_upload;	
		$a_field = new cls_field;
		foreach($mfields as $k => $field){
			if(!$upload_nouser && in_array($field['datatype'],array('image','images','flash','flashs','media','medias','file','files')))continue;
			if(!$field['issystem'] && !$field['isfunc'] && !$field['isadmin'] && in_array($k,$additems)){
				$a_field->init();
				$a_field->field = read_cache('mfield',$mchid,$k);
				if($curuser->pmbypmids('field',$a_field->field['pmid'])){
					$a_field->deal();
					if(!empty($a_field->error)){
						$c_upload->rollback();
						message($a_field->error,M_REFERER);
					}
					${$field['tbl'].'arr'}[$k] = $a_field->newvalue;
				}
			}
		}
		unset($a_field);
		$newuser = new cls_userinfo;
		$newuser->useradd($mainarr['mname'],$mainarr['password'],$mainarr['email'],$mchid);
		$mid = $newuser->info['mid'];
		$c_upload->closure(1, $mid, 'members');
		$mid || message('memregisterfail',M_REFERER);
		if($autocheck == 2){
			$confirmid = random(6);
			$confirmstr = "$timestamp\t2\t$confirmid";
			$subarr['confirmstr'] = $confirmstr;
		}
		foreach(array('main','sub','custom') as $var){
			foreach(${$var.'arr'} as $k => $v) $newuser->updatefield($k,$v,$var);
		}
		$newuser->updatedb();
		unset($newuser);
		if($autocheck == 1){
			msetcookie('userauth', authcode("$md5_password\t$mid",'ENCODE'));
		}elseif($autocheck == 2){
			mailto($email,'member_active_subject','member_active_content',array('mid' => $mid,'mname' => $mname,'url' => "{$cms_abs}memactive.php?action=emailactive&mid=$mid&id=$confirmid"));
		}
		if($enable_pptout && !empty($pptout_file) && !empty($pptout_url)){
			$action = 'login';
			$username = $mname;
			include M_ROOT.'./include/pptout/'.$pptout_file.'.php';
			header('location:'.$url);
			exit;
		}
		if(!$forward || preg_match('/\bregister.php(\?|#|$)/i', $forward))$forward = 'index.php';
		message(!$autocheck ? 'userchecking' : ($autocheck == 2 ? 'emailactiving' : 'memberregistersucce'),$forward);
	}

}
?>



