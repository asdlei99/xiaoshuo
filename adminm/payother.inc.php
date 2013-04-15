<?php
!defined('M_COM') && exit('No Permission');
load_cache('currencys');
include_once M_ROOT."./include/fields.fun.php";
if(!submitcheck('bpayother')){
	if(!$oldmsg = $db->fetch_one("SELECT * FROM {$tblprefix}pays WHERE mid='$memberid' ORDER BY pid DESC LIMIT 0,1")) $oldmsg = array();
	$pmodearr = array('0' => lang('visitingpay'),'2' => lang('banktransfer'),'3' => lang('postofficeremit'));
	mtabheader(lang('cashpayedmessageadmini'),'payother','adminm.php?action=payother',2,1,1);
	mtrbasic(lang('paymode'),'',makeradio('paynew[pmode]',$pmodearr),'');
	mtrbasic(lang('payamountrmbi'),'paynew[amount]');
	mtrbasic(lang('contactorname'),'paynew[truename]',empty($oldmsg['truename']) ? '' : $oldmsg['truename'],'btext');
	mtrbasic(lang('contacttel'),'paynew[telephone]',empty($oldmsg['telephone']) ? '' : $oldmsg['telephone'],'btext');
	mtrbasic(lang('contactemail'),'paynew[email]',empty($oldmsg['email']) ? '' : $oldmsg['email'],'btext');
	mtrbasic(lang('remark'),'paynew[remark]',empty($oldmsg['remark']) ? '' : $oldmsg['remark'],'textarea');
	mtrspecial(lang('paywarrant'),'paynew[warrant]','','image');

	$submitstr = '';
	$submitstr .= makesubmitstr('paynew[amount]',1,'number',0,15);
	$submitstr .= makesubmitstr('paynew[truename]',0,0,0,80);
	$submitstr .= makesubmitstr('paynew[telephone]',0,0,0,30);
	$submitstr .= makesubmitstr('paynew[email]',0,'email',0,100);
	$submitstr .= makesubmitstr('paynew[remark]',0,0,0,200);
	$submitstr .= mtr_regcode('payonline');
	mtabfooter('bpayother');
	check_submit_func($submitstr);
}else{
	if(!regcode_pass('register',empty($regcode) ? '' : trim($regcode))) mcmessage('regcodeerror','adminm.php?action=payother');
	$paynew['amount'] = max(0,round(floatval($paynew['amount']),2));
	empty($paynew['amount']) && mcmessage('pinputpayamount','adminm.php?action=payother');
	include_once M_ROOT."./include/upload.cls.php";
	$paynew['truename'] = trim(strip_tags($paynew['truename']));
	$paynew['telephone'] = trim(strip_tags($paynew['telephone']));
	$paynew['email'] = trim(strip_tags($paynew['email']));
	$c_upload = new cls_upload;	
	$paynew['warrant'] = upload_s($paynew['warrant'],'','image');
	$c_upload->saveuptotal(1);
	$db->query("INSERT INTO {$tblprefix}pays SET
				 mid='".$memberid."', 
				 mname='".$curuser->info['mname']."', 
				 pmode='$paynew[pmode]',
				 amount='$paynew[amount]',
				 truename='$paynew[truename]',
				 telephone='$paynew[telephone]',
				 email='$paynew[email]',
				 remark='$paynew[remark]',
				 warrant='$paynew[warrant]',
				 senddate='$timestamp',
				 ip='$onlineip'
				 ");
	$c_upload->closure(1, $db->insert_id(), 'pays');
	unset($c_upload);
	mcmessage('csnsspwad','adminm.php?action=pays');

/*
*/
}
?>
