<?
//�����ٱ��������������й����������߼�����Ա���й���
!defined('M_COM') && exit('No Permission');
load_cache('channels,acatalogs,currencys,commus,bfields');
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/fields.cls.php";
include_once M_ROOT."./include/upload.cls.php";
include_once M_ROOT."./include/arcedit.cls.php";
$catalogs = &$acatalogs;
$aid = empty($aid) ? 0 : max(0,intval($aid));
$cid = empty($cid) ? 0 : max(0,intval($cid));
$forward = empty($forward) ? M_REFERER : $forward;
$forwardstr = '&forward='.rawurlencode($forward);
if(!$aid) mcmessage('choosereportobject',$forward);
$aedit = new cls_arcedit;
$aedit->set_aid($aid);
$aedit->detail_data();
if(!($aid = $aedit->aid)) mcmessage('choosereportobject',$forward);
if(!$aedit->channel['report'] || !($commu = read_cache('commu',$aedit->channel['report']))) mcmessage('pleasesetcommuitem',$forward);
if(empty($commu['available'])) mcmessage('reportfunctionclose',$forward);
$fieldsarr = empty($commu['setting']['fields']) ? array() : explode(',',$commu['setting']['fields']);
if(empty($cid)){//�¼Ӿٱ�
	if(!$curuser->pmbypmids('cuadd',$commu['setting']['apmid'])) mcmessage('younoreportpermi',$forward);
	if(!$aedit->archive['checked']) mcmessage('archivenocheck'); //δ���ĵ����ܾٱ�

	mtabheader(lang('add').$commu['cname'],'reportadd',"report.php?aid=$aid$forwardstr",2,1,1);
	$submitstr = '';
	//������Ϣ
	mtrbasic(lang('lookreportobject'),'',"<a href=\"".view_arcurl($aedit->archive)."\" target=\"_blank\">>>&nbsp; ".$aedit->archive['subject']."</a>",'');
	//$submitstr .= mtr_regcode('report');
	$a_field = new cls_field;
	foreach($bfields as $k => $v){
		if(!$v['isadmin'] && !$v['isfunc'] && in_array($k,$fieldsarr)){
			$a_field->init(1);
			$a_field->field = $v;
			$a_field->isadd = 1;
			$a_field->trfield('reportnew');
			$submitstr .= $a_field->submitstr;
		}
	}
	unset($a_field);
	mtabfooter('newcommu');
	check_submit_func($submitstr);
}else{//�п����Ƿ�����Ҳ�����ǹ�����
	$amode = $curuser->isadmin() ? 1 : 0;
	if(!$reportold = $db->fetch_one("SELECT * FROM {$tblprefix}reports WHERE aid='$aid' AND cid='$cid'")) mcmessage('choosereport',$forward);
	if(!$amode && $reportold['mid'] != $memberid) mcmessage('chooseyourreport',$forward);//�ظ�������ֻ�ܹ������ѵĻظ�
	if(!submitcheck('submitreport')){
		mtabheader($commu['cname'].'&nbsp; -&nbsp; '.lang('basedmessage'),'reportdetail',"?action=report&aid=$aid&cid=$cid$forwardstr",2,1,1);
		$submitstr = '';
		//��Ʒ��Ϣ
		mtrbasic(lang('lookreportobject'),'',"<a href=\"".view_arcurl($aedit->archive)."\" target=\"_blank\">>>&nbsp; ".$aedit->archive['subject']."</a>",'');
		mtrbasic(lang('lastupdatetime'),'',date('Y-m-d H:i',$reportold['updatedate']),'');
		if($amode) mtrbasic(lang('reportmember'),'',$reportold['mname'],'');
		mtabfooter();

		$a_field = new cls_field;
		mtabheader($commu['cname'].'&nbsp; -&nbsp; '.lang('submitmessage'));
		foreach($bfields as $k => $v){
			if(!$v['isadmin'] && !$v['isfunc'] && in_array($k,$fieldsarr)){
				$a_field->init(1);
				$a_field->field = $v;
				$a_field->oldvalue = isset($reportold[$k]) ? $reportold[$k] : '';
				$a_field->trfield('reportnew');
				$submitstr .= $a_field->submitstr;
			}
		}
		mtabfooter();

		mtabheader($commu['cname'].'&nbsp; -&nbsp; '.lang('adminmessage').(!$amode ? lang('readonly') : ''));
		foreach($bfields as $k => $v){
			if($v['isadmin'] && !$v['isfunc'] && in_array($k,$fieldsarr)){
				$a_field->init(1);
				$a_field->field = $v;
				$a_field->oldvalue = isset($reportold[$k]) ? $reportold[$k] : '';
				$a_field->trfield('reportnew');
				$submitstr .= $a_field->submitstr;
			}
		}
		unset($a_field);

		mtabfooter('submitreport','',mstrbutton('','goback',"redirect('$forward');"));
		check_submit_func($submitstr);
	}else{
		$c_upload = new cls_upload;	
		$bfields = fields_order($bfields);
		$sqlstr = '';
		$a_field = new cls_field;
		foreach($bfields as $k => $v){
			if(!$v['isadmin'] && !$v['isfunc'] && in_array($k,$fieldsarr)){
				$a_field->init(1);
				$a_field->field = $v;
				$a_field->oldvalue = isset($reportold[$k]) ? $reportold[$k] : '';
				$a_field->deal('reportnew');
				if(!empty($a_field->error)){
					$c_upload->rollback();
					mcmessage($a_field->error,M_REFERER);
				}
				$sqlstr .= ",$k='".$a_field->newvalue."'";
			}
		}
		if($amode){//�����ֶ�
			foreach($bfields as $k => $v){
				if($v['isadmin'] && !$v['isfunc'] && in_array($k,$fieldsarr)){
					$a_field->init(1);
					$a_field->field = $v;
					$a_field->oldvalue = isset($reportold[$k]) ? $reportold[$k] : '';
					$a_field->deal('reportnew');
					if(!empty($a_field->error)){
						$c_upload->rollback();
						mcmessage($a_field->error,M_REFERER);
					}
					$sqlstr .= ",$k='".$a_field->newvalue."'";
				}
			}
		}
		unset($a_field);
		$c_upload->closure(1, $cid, 'reports');
		$c_upload->saveuptotal(1);
		$db->query("UPDATE {$tblprefix}reports SET
			cuid='$commu[cuid]',
			updatedate='$timestamp'
			$sqlstr
			WHERE cid='$cid'");
		//�������ֶ�
		$sqlstr = '';
		foreach($bfields as $k => $v){
			if($v['isfunc'] && in_array($k,$fieldsarr)){
				//�õ�ԭʼ���ݵ����ϣ����ϵ�ǰ�ĵ�����
				if(!isset($sourcearr)){
					$sourcearr = $db->fetch_one("SELECT * FROM {$tblprefix}reports WHERE cid='$cid'");
					$sourcearr = array_merge($a_edit->archive,$sourcearr);
				}
				$sqlstr .= ($sqlstr ? ',' : '')."$k='".field_func($v['func'],$sourcearr,$arr2='')."'";
			}
		}
		unset($sourcearr);
		$sqlstr && $db->query("UPDATE {$tblprefix}reports SET $sqlstr WHERE cid='$cid'");

		//�����Զ��庯��
		if(!empty($commu['func'])){//���Դ������в����ı��
			$sourcearr = $db->fetch_one("SELECT * FROM {$tblprefix}reports WHERE cid='$cid'");
			$sourcearr = array_merge($aedit->archive,$sourcearr);
			field_func($commu['func'],$sourcearr,$arr2='');
			unset($sourcearr);
		}		
		mcmessage('updatesucceed',$forward,$commu['cname']);
	}

}

?>