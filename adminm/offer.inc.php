<?
//��ҳ��ֻ���޸����ϣ����漰���ۼ����
!defined('M_COM') && exit('No Permission');
load_cache('channels,acatalogs,currencys,commus,ofields,ucotypes');
$cid = empty($cid) ? 0 : max(0,intval($cid));
$cuid = $db->result_one("SELECT cuid FROM {$tblprefix}offers WHERE cid='$cid'");
if(!$cuid || !($commu = read_cache('commu',$cuid))) exit('setcomitem');
if(empty($commu['umdetail'])){
	$nimuid = empty($nimuid) ? 0 : max(0,intval($nimuid));
	if($nimuid && $u_url = read_cache('inmurl',$nimuid)){
		$u_tplname = $u_url['tplname'];
		$u_onlyview = empty($u_url['onlyview']) ? 0 : 1;
		$u_mtitle = $u_url['mtitle'];
		$u_guide = $u_url['guide'];
		$vars = array('lists',);
		foreach($vars as $var) if(!empty($u_url['setting'][$var])) ${'u_'.$var} = explode(',',$u_url['setting'][$var]);
	}
	if(empty($u_tplname) || !empty($u_onlyview)){
		include_once M_ROOT."./include/fields.fun.php";
		include_once M_ROOT."./include/fields.cls.php";
		include_once M_ROOT."./include/upload.cls.php";
		include_once M_ROOT."./include/cuedit.cls.php";
		$catalogs = &$acatalogs;
		$uedit = new cls_cuedit;
		if($errno = $uedit->read($cid,'offer')){
			if($errno == 1) mcmessage('chooseoffer');
			if($errno == 2) mcmessage('chooseproduct');
			if($errno == 3) mcmessage('setcommuitem');
		}
		if($uedit->info['mid'] != $memberid) mcmessage('pcyo');
		foreach(array('aid','commu','citems','fields','useredits',) as $var) $$var = &$uedit->$var;
		$oldrow = &$uedit->info;
		$freeupdate = $curuser->check_allow('freeupdatecheck') || !$oldrow['checked'];
		if(!submitcheck('newcommu')){
			if(empty($u_tplname)){
				mtabheader((empty($u_mtitle) ? $commu['cname'] : $u_mtitle).'&nbsp; &nbsp; '."<a href=\"".view_arcurl($oldrow)."\" target=\"_blank\">>>&nbsp; ".$oldrow['subject']."</a>",'commudetail',"?action=offer&cid=$cid",2,1,1);
				$submitstr = '';
				if(empty($u_lists) || in_array('oprice',$u_lists)){
					mtrbasic(lang('price'),'offernew[oprice]',$oldrow['oprice']);
				}
				if(empty($u_lists) || in_array('storage',$u_lists)){
					mtrbasic(lang('stock'),'offernew[storage]',$oldrow['storage']);
				}
				foreach($ucotypes as $k => $v){
					if(empty($u_lists) || in_array("uccid$k",$u_lists)){
						if(in_array('uccid'.$k,$citems)){
							$noedit = noedit('uccid'.$k,$v['umode'] == 2);
							mtrbasic($v['cname'].$noedit,'',mu_cnselect("offernew[uccid$k]",$oldrow['uccid'.$k],$k,lang('p_choose')),'');
							!$noedit && $submitstr .= makesubmitstr("offernew[uccid$k]",$v['notblank'],0,0,0,'common');
						}
					}
				}
				$a_field = new cls_field;
				foreach($fields as $k => $v){
					if(empty($u_lists) || in_array($k,$u_lists)){
						if(!$v['isfunc']){
							$a_field->init(1);
							$a_field->field = $v;
							$a_field->oldvalue = $oldrow[$k];
							$noedit = noedit($k,$v['isadmin'] || !$curuser->pmbypmids('field',$v['pmid']));
							$a_field->trfield('offernew',$noedit);
							!$noedit && $submitstr .= $a_field->submitstr;
						}
					}
				}
				unset($a_field);
				mtabfooter('newcommu');
				check_submit_func($submitstr);
				m_guide(@$u_guide);
			}else include(M_ROOT.$u_tplname);
		}else{
			if(isset($offernew['oprice'])){
				$uedit->updatefield('oprice',max(0,round($offernew['oprice'],2)));
				$uedit->updatefield('refreshdate',$timestamp);
				$uedit->updatefield('enddate',empty($uedit->commu['setting']['vdays']) ? 0 : $timestamp + 86400 * $uedit->commu['setting']['vdays']);
			}
			if(isset($offernew['storage'])){
				$uedit->updatefield('storage',max(-1,intval($offernew['storage'])));
			}
			$c_upload = new cls_upload;	
			$fields = fields_order($fields);
			$a_field = new cls_field;
			foreach($ucotypes as $k => $v){
				if(isset($offernew['uccid'.$k])){
					if(in_array('uccid'.$k,$citems) && !noedit('uccid'.$k,$v['umode'] == 2)){
						$uedit->updatefield('uccid'.$k,$offernew['uccid'.$k]);
					}
				}
			}
			foreach($fields as $k => $v){
				if(isset($offernew[$k])){
					if(!$v['isfunc'] && !$v['isadmin']){
						$a_field->init(1);
						$a_field->field = $v;
						if(!noedit($k,!$curuser->pmbypmids('field',$v['pmid']))){
							$a_field->oldvalue = isset($oldrow[$k]) ? $oldrow[$k] : '';
							$a_field->deal('offernew');
							if(!empty($a_field->error)){
								$c_upload->rollback();
								mcmessage($a_field->error,M_REFERER);
							}
							$uedit->updatefield($k,$a_field->newvalue);
						}
					}
				}
			}
			unset($a_field);
		
			$c_upload->closure(1, $cid, 'offers');
			$c_upload->saveuptotal(1);
			$uedit->updatedb();
			mcmessage('offerupdatesucce',axaction(6,M_REFERER));
		}
	}else include(M_ROOT.$u_tplname);
}else include(M_ROOT.$commu['umdetail']);
?>