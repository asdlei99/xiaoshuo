<?php
!defined('M_COM') && exit('No Permission');
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/fields.cls.php";
include_once M_ROOT."./include/upload.cls.php";
include_once M_ROOT."./include/marcedit.cls.php";

$matid = empty($matid) ? 0 : max(0,intval($matid));
if(empty($matid) || !($matype = read_cache('matype',$matid))) mcmessage('choosematype');
if(!$curuser->pmbypmids('aadd',$matype['apmid'])) mcmessage('matypenoadd');
if(!$curuser->checkforbid('issue')) mcmessage('userisforbid');

$forward = empty($forward) ? M_REFERER : $forward;
$forwardstr = '&forward='.rawurlencode($forward);
$fields = read_cache('mafields',$matid);
if(!submitcheck('bmarchiveadd')){
	$a_field = new cls_field;
	$submitstr = '';
	mtabheader($matype['cname'].'&nbsp; -&nbsp; '.lang('contentsetting'),'marchiveadd',"?matid=$matid&action=marchiveadd$param_suffix$forwardstr",2,1,1,1);
	foreach($fields as $k => $field){
		if($field['available'] && !$field['isadmin'] && !$field['isfunc']){
			$a_field->init(1);
			$a_field->field = read_cache('mafield',$matid,$k);
			$a_field->isadd = 1;
			$a_field->trfield('marchiveadd');
			$submitstr .= $a_field->submitstr;
		}
	}
	$submitstr .= mtr_regcode('archive');
	mtabfooter();
	unset($a_field);

	mtabfooter('bmarchiveadd');
	check_submit_func($submitstr);
}else{
	if(!regcode_pass('archive',empty($regcode) ? '' : trim($regcode))) mcmessage('safecodeerr');
	$sqlmain = "matid='$matid',mid='$memberid',mname='".$curuser->info['mname']."',createdate='$timestamp'";
	$c_upload = new cls_upload;	
	$fields = fields_order($fields);
	$a_field = new cls_field;
	foreach($fields as $k => $field){
		if($field['available'] && !$field['isadmin'] && !$field['isfunc']){
			$a_field->init(1);
			$a_field->field = read_cache('mafield',$matid,$k);
			$a_field->deal('marchiveadd');
			if(!empty($a_field->error)){
				$c_upload->rollback();
				mcmessage($a_field->error,M_REFERER);
			}
			$sqlmain .= ",$k='".$a_field->newvalue."'";
		}
	}
	unset($a_field);

	$db->query("INSERT INTO {$tblprefix}marchives_$matid SET ".$sqlmain);
	if(!$maid = $db->insert_id()){
		$c_upload->closure(1);
		mcmessage('marcsaveerr',axaction(2,M_REFERER));
	}else{
		$c_upload->closure(1, $maid, 'marchives');
		$aedit = new cls_marcedit;
		$aedit->set_id($maid,$matid);
		if($matype['autocheck']) $aedit->check(1,0);
		$aedit->updatedb();
		unset($aedit);
		if($matype['autostatic'] && $matype['autocheck']){
			include_once M_ROOT."./include/marc_static.fun.php";
			marc_static($maid,$matid);
			unset($arc);
		}
	}
	$c_upload->saveuptotal(1);
	mcmessage('marcaddfinish',axaction(10,$forward));

}

?>
