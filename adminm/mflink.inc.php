<?
//��Ա����������ӡ�
!defined('M_COM') && exit('No Permission');
load_cache('currencys,mlfields,mchannels');
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/fields.cls.php";
include_once M_ROOT."./include/upload.cls.php";
$mid = empty($mid) ? 0 : max(0,intval($mid));
$cid = empty($cid) ? 0 : max(0,intval($cid));
$cuid=3;
//$amode = member==$mid ? 0 : 1;
$forward = empty($forward) ? M_REFERER : $forward;
$forwardstr = '&forward='.rawurlencode($forward);
if(!$mid) mcmessage('choflinkobject',$forward);

$actuser = new cls_userinfo;
$actuser->activeuser($mid);
if(!$actuser->info['mid']) mcmessage('choosemember');

if(!($mcommu = read_cache('mcommu',$cuid))) mcmessage('psmci');
if(empty($mcommu['available'])) mcmessage('mffc',$forward);

$fieldsarr = empty($mcommu['setting']['fields']) ? array() : explode(',',$mcommu['setting']['fields']);
if(empty($cid)){//�¼�����
	//�����Ƿ������ظ����
	if($cid = $db->result_one("SELECT cid FROM {$tblprefix}mflinks WHERE mid='$mid' AND fromid='$memberid' ORDER BY cid")) mcmessage('pdraf',"?action=mflink&mid=$mid&cid=$cid$forwardstr");
	if(!$oldmsg = $db->fetch_one("SELECT * FROM {$tblprefix}mflinks WHERE fromid='$memberid' AND ucid='$mcommu[cuid]' ORDER BY cid DESC LIMIT 0,1")) $oldmsg = array();//����ͬ��ظ��еľɼ�¼
	mtabheader(lang('addmember').$mcommu['cname'],'flinkadd',"mflink.php?mid=$mid$forwardstr",2,1,1);
	$submitstr = '';

	mtrbasic(lang('lookaddobject'),'',"<a href=\"mspace/index.php?mid=$mid\" target=\"_blank\">>>&nbsp; ".$actuser->info['mname']."</a>",'');
	$submitstr .= mtr_regcode('link');
	$a_field = new cls_field;
	foreach($mlfields as $k => $v){
		if(!$v['isadmin'] && !$v['isfunc'] && in_array($k,$fieldsarr)){
			$a_field->init(1);
			$a_field->field = $v;
			if(isset($oldmsg[$k])){
				$a_field->oldvalue = $oldmsg[$k];
			}else $a_field->isadd = 1;
			$a_field->trfield('flinknew');
			$submitstr .= $a_field->submitstr;
		}
	}
	unset($a_field);
	mtabfooter('newcommu');
	check_submit_func($submitstr);

}else{//�޸�������
	if(!$flinkold = $db->fetch_one("SELECT * FROM {$tblprefix}mflinks WHERE (mid='$mid' AND fromid='$memberid' OR mid='$memberid') AND cid='$cid'")) mcmessage('confirmchooseflink',$forward);
	if($flinkold['mid']==$memberid){
		mtabheader($mcommu['cname'].'&nbsp; -&nbsp; '.lang('basemessage'),'flinkdetail',"?action=mflink&mid=$mid&cid=$cid$forwardstr",2,1,1);
		mtrbasic(lang('checkstate'),'',empty($flinkold['checked']) ? lang('nocheck') : lang('checked'),'');
		mtrbasic(lang('addtime'),'',date('Y-m-d H:i',$flinkold['createdate']),'');
		mtabfooter();
		mtabheader($mcommu['cname'].'&nbsp; -&nbsp; '.lang('needmessage'));
		foreach($mlfields as $k => $v){
			if(!$v['isadmin'] && !$v['isfunc'] && in_array($k,$fieldsarr)){
				mtrbasic($v['cname'],'',$flinkold[$k],'');
			}
		}
		unset($a_field);

		mtabfooter('','',mstrbutton('','goback',"redirect('$forward');"));
	}elseif(!submitcheck('bflinkdetail')){
		mtabheader($mcommu['cname'].'&nbsp; -&nbsp; '.lang('basemessage'),'flinkdetail',"?action=mflink&mid=$mid&cid=$cid$forwardstr",2,1,1);
		$submitstr = '';

		mtrbasic(lang('looklinkobject'),'',"<a href=\"mspace/index.php?mid=$mid\" target=\"_blank\">>>&nbsp; ".$flinkold['mname']."</a>",'');

		mtrbasic(lang('checkstate'),'',empty($flinkold['checked']) ? lang('nocheck') : lang('checked'),'');
		mtrbasic(lang('addtime'),'',date('Y-m-d H:i',$flinkold['createdate']),'');
		mtabfooter();

		$submitstr .= mtr_regcode('link');
		$a_field = new cls_field;
		mtabheader($mcommu['cname'].'&nbsp; -&nbsp; '.lang('submitmessage'));
		foreach($mlfields as $k => $v){
			if(!$v['isadmin'] && !$v['isfunc'] && in_array($k,$fieldsarr)){
				$a_field->init(1);
				$a_field->field = $v;
				$a_field->oldvalue = isset($flinkold[$k]) ? $flinkold[$k] : '';
				$a_field->trfield('flinknew');
				$submitstr .= $a_field->submitstr;
			}
		}
		unset($a_field);

		mtabfooter('bflinkdetail','',mstrbutton('','goback',"redirect('$forward');"));
		check_submit_func($submitstr);
	}else{
		$c_upload = new cls_upload;	
		$mlfields = fields_order($mlfields);
		$sqlstr = '';
		$a_field = new cls_field;
		foreach($mlfields as $k => $v){
			if(!$v['isadmin'] && !$v['isfunc'] && in_array($k,$fieldsarr)){
				$a_field->init(1);
				$a_field->field = $v;
				$a_field->oldvalue = isset($flinkold[$k]) ? $flinkold[$k] : '';
				$a_field->deal('flinknew');
				if(!empty($a_field->error)){
					$c_upload->rollback();
					mcmessage($a_field->error,M_REFERER);
				}
				$sqlstr .= ($sqlstr ? ',' : '')."$k='".$a_field->newvalue."'";
			}
		}
		unset($a_field);
		$c_upload->closure(1, $cid, 'mflinks');
		$c_upload->saveuptotal(1);
		$db->query("UPDATE {$tblprefix}mflinks SET
			$sqlstr
			WHERE cid='$cid'");
		//�������ֶ�
		$sqlstr = '';
		foreach($mlfields as $k => $v){
			if($v['isfunc'] && in_array($k,$fieldsarr)){
				//�õ�ԭʼ���ݵ����ϣ����ϵ�ǰ�ĵ�����
				if(!isset($sourcearr)){
					$sourcearr = $db->fetch_one("SELECT * FROM {$tblprefix}mflinks WHERE cid='$cid'");
				}
				$sqlstr .= ($sqlstr ? ',' : '')."$k='".field_func($v['func'],$sourcearr,$arr2='')."'";
			}
		}
		unset($sourcearr);
		$sqlstr && $db->query("UPDATE {$tblprefix}mflinks SET $sqlstr WHERE cid='$cid'");

		//�����Զ��庯��
		if(!empty($mcommu['func'])){//���Դ������в����ı��
			$sourcearr = $db->fetch_one("SELECT * FROM {$tblprefix}mflinks WHERE cid='$cid'");
			field_func($mcommu['func'],$sourcearr,$arr2='');
			unset($sourcearr);
		}		

		mcmessage(nameadminfin,$forward,$mcommu['cname']);
	}

}
?>