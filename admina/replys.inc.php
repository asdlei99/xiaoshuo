<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
backallow('commu') || amessage('no_apermission');
load_cache('channels,rcatalogs,currencys,commus,rfields');
load_cache('catalogs',$sid);
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/fields.cls.php";
include_once M_ROOT."./include/upload.cls.php";
include_once M_ROOT."./include/arcedit.cls.php";
include_once M_ROOT."./include/cuedit.cls.php";
if($action == 'replysedit'){
	//����ҳ������
	$nauid = empty($nauid) ? 0 : $nauid;
	$u_checked = -1;
	if($nauid && $u_url = read_cache('aurl',$nauid)){
		$u_tplname = $u_url['tplname'];
		$u_onlyview = empty($u_url['onlyview']) ? 0 : 1;
		$u_checked = $u_url['setting']['checked'];
		foreach(array('cuids','chids','filters','lists','operates',) as $var) if(!empty($u_url['setting'][$var])) ${'u_'.$var} = explode(',',$u_url['setting'][$var]);
	}
	empty($u_lists) && $u_lists = array('mname','catalog','channel','commu','check','edit',);
	if(empty($u_tplname) || !empty($u_onlyview)){
		$caid = empty($caid) ? 0 : $caid;
	$page = !empty($page) ? max(1, intval($page)) : 1;
	submitcheck('bfilter') && $page = 1;
	$viewdetail = empty($viewdetail) ? 0 : 1;
	$cuid = empty($cuid) ? 0 : $cuid;
	$chid = empty($chid) ? 0 : max(0,intval($chid));
	$checked = isset($checked) ? $checked : '-1';
	$keyword = empty($keyword) ? '' : $keyword;
	$indays = empty($indays) ? 0 : max(0,intval($indays));
	$outdays = empty($outdays) ? 0 : max(0,intval($outdays));
	$wheresql = "a.sid='$sid'";
	$fromsql = "FROM {$tblprefix}replys cu LEFT JOIN {$tblprefix}archives a ON a.aid=cu.aid";

	//��Ŀ��Χ
	$caids = array(-1);
	if(!empty($caid)){
		$caids = array($caid);
		$tempids = array();
		$tempids = son_ids($catalogs,$caid,$tempids);
		$caids = array_merge($caids,$tempids);
	}
	if(!in_array(-1,$a_caids)) $caids = in_array(-1,$caids) ? $a_caids : array_intersect($caids,$a_caids);
	if(!$caids) $no_list = true;
	elseif(!in_array(-1,$caids)) $wheresql .= " AND a.caid ".multi_str($caids);

	//ģ�ͷ�Χ
	if($chid){
		if(!empty($u_chids) && !in_array($chid,$u_chids)) $no_list = true;
		else $wheresql .= " AND a.chid='$chid'";
	}elseif(!empty($u_chids)) $wheresql .= " AND a.chid ".multi_str($u_chids);

	//������Ŀ��Χ
	if($cuid){
		if(!empty($u_cuids) && !in_array($cuid,$u_cuids)) $no_list = true;
		else $wheresql .= " AND cu.cuid='$cuid'";
	}elseif(!empty($u_cuids)) $wheresql .= " AND cu.cuid ".multi_str($u_cuids);

	//���״̬��Χ
	if($checked != -1){
		if(($u_checked != -1) && $checked != $u_checked) $no_list = true;
		else $wheresql .= " AND cu.checked='$checked'";
	}elseif($u_checked != -1) $wheresql .= " AND cu.checked='$u_checked'";

	//�����ؼ��ʴ���
	$keyword && $wheresql .= " AND (cu.mname LIKE '%".str_replace(array(' ','*'),'%',addcslashes($keyword,'%_'))."%' OR a.subject LIKE '%".str_replace(array(' ','*'),'%',addcslashes($keyword,'%_'))."%')";

	$indays && $wheresql .= " AND cu.createdate>'".($timestamp - 86400 * $indays)."'";
	$outdays && $wheresql .= " AND cu.createdate<'".($timestamp - 86400 * $outdays)."'";

	$filterstr = '';
	foreach(array('nauid','viewdetail','caid','cuid','chid','keyword','indays','outdays',) as $k) $$k && $filterstr .= "&$k=".rawurlencode(stripslashes($$k));
	foreach(array('checked',) as $k) $$k != -1 && $filterstr .= "&$k=".$$k;

	$wheresql = "WHERE ".(empty($no_list) ? $wheresql : '1=0');
	if(!submitcheck('barcsedit')){
		if(empty($u_tplname)){
			echo form_str($actionid.'arcsedit',"?entry=replys&action=replysedit&page=$page$param_suffix");
			//��������

			tabheader_e();
			echo "<tr><td colspan=\"2\" class=\"txt txtleft\">";
			//�ؼ��ʹ̶���ʾ
			echo lang('keyword')."&nbsp; <input class=\"text\" name=\"keyword\" type=\"text\" value=\"$keyword\" size=\"8\" style=\"vertical-align: middle;\">&nbsp; ";
			//�ϼ���������
			if(empty($u_filters) || in_array('commu',$u_filters)){
				$cuidsarr = array('0' => lang('all_cuitem'));
				foreach($commus as $k => $v) if($v['cclass'] == 'reply') $cuidsarr[$k] = $v['cname'];
				echo "<select style=\"vertical-align: middle;\" name=\"cuid\">".makeoption($cuidsarr,$cuid)."</select>&nbsp; ";
			}
			//���״̬
			if(empty($u_filters) || in_array('check',$u_filters)){
				$checkedarr = array('-1' => lang('nolimit').lang('check'),'0' => lang('nocheck'),'1' => lang('checked'));
				echo "<select style=\"vertical-align: middle;\" name=\"checked\">".makeoption($checkedarr,$checked)."</select>&nbsp; ";
			}
			echo "<input class=\"btn\" type=\"submit\" name=\"bfilter\" id=\"bfilter\" value=\"".lang('filter0')."\">".viewcheck('viewdetail',$viewdetail,$actionid.'tbodyfilter');
			echo "</td></tr>";


			//ĳЩ�̶�ҳ�����
			trhidden('caid',$caid);
			trhidden('nauid',$nauid);

			//��������
			echo "<tbody id=\"{$actionid}tbodyfilter\" style=\"display: ".(empty($viewdetail) ? 'none' : '')."\">";
			//ģ������
			if(empty($u_filters) || in_array('channel',$u_filters)){
				$chidsarr = array('0' => lang('all_channel')) + chidsarr();
				trbasic(lang('achannel'),"chid",makeoption($chidsarr,$chid),'select');
			}
			//����ɸѡ
			if(empty($u_filters) || in_array('date',$u_filters)){
				trrange(lang('add_date'),array('outdays',empty($outdays) ? '' : $outdays,'','&nbsp; '.lang('day_before').'&nbsp; -&nbsp; ',5),array('indays',empty($indays) ? '' : $indays,'','&nbsp; '.lang('day_in'),5));
			}
			echo "</tbody>";
			tabfooter();
	
	
			//�б���	
			tabheader(lang('reply_list')."&nbsp; <input class=\"checkbox\" type=\"checkbox\" name=\"select_all\" value=\"1\">&nbsp;".lang('selectallpage'),'','',9);

			$cy_arr = array("<input class=\"checkbox\" type=\"checkbox\" name=\"chkall\" onclick=\"checkall(this.form, 'selectid', 'chkall')\">",lang('title'),);
			if(in_array('commu',$u_lists)) $cy_arr[] = lang('type');
			if(in_array('mname',$u_lists)) $cy_arr[] = lang('member');
			if(in_array('check',$u_lists)) $cy_arr[] = lang('check');
			if(in_array('catalog',$u_lists)) $cy_arr[] = lang('catalog');
			if(in_array('channel',$u_lists)) $cy_arr[] = lang('achannel');
			if(in_array('adddate',$u_lists)) $cy_arr[] = lang('add_date');
			if(in_array('updatedate',$u_lists)) $cy_arr[] = lang('update_time');
			if(in_array('edit',$u_lists)) $cy_arr[] = lang('edit');
			trcategory($cy_arr);

			$pagetmp = $page;
			do{
				$query = $db->query("SELECT cu.*,a.sid,a.createdate,a.caid,a.chid,a.subject $fromsql $wheresql ORDER BY cu.cid DESC LIMIT ".(($pagetmp - 1) * $atpp).",$atpp");
				$pagetmp--;
			} while(!$db->num_rows($query) && $pagetmp);

			$itemstr = '';
			while($row = $db->fetch_array($query)){
				$selectstr = "<input class=\"checkbox\" type=\"checkbox\" name=\"selectid[$row[cid]]\" value=\"$row[cid]\">";
				$row['arcurl'] = view_arcurl($row);
				$subjectstr = "<a href=$row[arcurl] target=\"_blank\">".mhtmlspecialchars($row['subject'])."</a>";
				$mnamestr = $row['mname'];
				$catalogstr = @$catalogs[$row['caid']]['title'];
				$commustr = @$commus[$row['cuid']]['cname'];
				$channelstr = @$channels[$row['chid']]['cname'];
				$checkstr = $row['checked'] ? 'Y' : '-';
				$adddatestr = date('Y-m-d',$row['createdate']);
				$updatedatestr = date('Y-m-d',$row['updatedate']);
				$editstr = "<a href=\"?entry=replys&action=replydetail&cid=$row[cid]$param_suffix\" onclick=\"return floatwin('open_replysedit',this)\">".lang('detail')."</a>";

				$itemstr .= "<tr class=\"txt\"><td class=\"txtC w40\" >$selectstr</td><td class=\"txtL\">$subjectstr</td>\n";
				if(in_array('commu',$u_lists)) $itemstr .= "<td class=\"txtC\">$commustr</td>\n";
				if(in_array('mname',$u_lists)) $itemstr .= "<td class=\"txtC\">$mnamestr</td>\n";
				if(in_array('check',$u_lists)) $itemstr .= "<td class=\"txtC w35\">$checkstr</td>\n";
				if(in_array('catalog',$u_lists)) $itemstr .= "<td class=\"txtC\">$catalogstr</td>\n";
				if(in_array('channel',$u_lists)) $itemstr .= "<td class=\"txtC\">$channelstr</td>\n";
				if(in_array('adddate',$u_lists)) $itemstr .= "<td class=\"txtC w100\">$adddatestr</td>\n";
				if(in_array('updatedate',$u_lists)) $itemstr .= "<td class=\"txtC w100\">$updatedatestr</td>\n";
				if(in_array('edit',$u_lists)) $itemstr .= "<td class=\"txtC w35\">$editstr</td>\n";;
				$itemstr .= "</tr>\n";
			}

			$counts = $db->result_one("SELECT count(*) $fromsql $wheresql");
			$multi = multi($counts, $atpp, $page, "?entry=replys&action=replysedit$param_suffix$filterstr");
			echo $itemstr;
			tabfooter();
			echo $multi;

			//������
			tabheader(lang('operate_item'));
			$s_arr = array();
			if(empty($u_operates) || in_array('delete',$u_operates)) $s_arr['delete'] = lang('delete');
			if(empty($u_operates) || in_array('check',$u_operates)) $s_arr['check'] = lang('check');
			if(empty($u_operates) || in_array('uncheck',$u_operates)) $s_arr['uncheck'] = lang('uncheck');
			if($s_arr){
				$soperatestr = '';
				foreach($s_arr as $k => $v) $soperatestr .= "<input class=\"checkbox\" type=\"checkbox\" name=\"arcdeal[$k]\" value=\"1\">$v &nbsp;";
				trbasic(lang('choose_item'),'',$soperatestr,'');
			}
			tabfooter('barcsedit');
			a_guide('replysedit');
		
		}else include(M_ROOT.$u_tplname);
		
	}else{
		if(empty($arcdeal) && empty($dealstr)) amessage('selectoperateitem',axaction(1,M_REFERER));
		if(empty($selectid) && empty($select_all)) amessage('pchoosecontent',axaction(1,M_REFERER));
		if(!empty($select_all)){
			if(empty($dealstr)){
				$dealstr = implode(',',array_keys(array_filter($arcdeal)));
			}else{
				$arcdeal = array();
				foreach(array_filter(explode(',',$dealstr)) as $k) $arcdeal[$k] = 1;
			}

			$parastr = "";
			$selectid = array();
			$npage = empty($npage) ? 1 : $npage;
			if(empty($pages)){
				$counts = $db->result_one("SELECT count(*) $fromsql $wheresql");
				$pages = @ceil($counts / $atpp);
			}
			if($npage <= $pages){
				$fromstr = empty($fromid) ? "" : "cu.cid<$fromid";
				$nwheresql = !$wheresql ? ($fromstr ? "WHERE $fromstr" : "") : ($wheresql.($fromstr ? " AND " : "").$fromstr);
				$query = $db->query("SELECT cu.cid $fromsql $nwheresql ORDER BY cu.cid DESC LIMIT 0,$atpp");
				while($item = $db->fetch_array($query)) $selectid[] = $item['cid'];
			}
		}
		if(!empty($arcdeal['delete'])){
			$query = $db->query("SELECT aid,mid FROM {$tblprefix}replys WHERE cid ".multi_str($selectid));
			while($row = $db->fetch_array($query)){
				$db->query("UPDATE {$tblprefix}archives SET replys=GREATEST(0,replys-1) WHERE aid='$row[aid]'");
				$db->query("UPDATE {$tblprefix}members_sub SET replys=GREATEST(0,replys-1) WHERE mid='$row[mid]'");
			}
			unset($row);
			$db->query("DELETE FROM {$tblprefix}replys WHERE cid ".multi_str($selectid));
		}else{
			if(!empty($arcdeal['check'])){
				$db->query("UPDATE {$tblprefix}replys SET checked='1' WHERE cid ".multi_str($selectid));
			}
			if(!empty($arcdeal['uncheck'])){
				$db->query("UPDATE {$tblprefix}replys SET checked='0' WHERE cid ".multi_str($selectid));
			}
		}
		if(!empty($select_all)){
			$npage ++;
			if($npage <= $pages){
				$fromid = min($selectid);
				$transtr = '';
				$transtr .= "&select_all=1";
				$transtr .= "&pages=$pages";
				$transtr .= "&npage=$npage";
				$transtr .= "&barcsedit=1";
				$transtr .= "&fromid=$fromid";
				amessage('operating',"?entry=replys&action=replysedit&page=$page$param_suffix$filterstr$transtr$parastr&dealstr=$dealstr",$pages,$npage,"<a href=\"?entry=replys&action=replysedit&page=$page$param_suffix$filterstr\">",'</a>');
			}
		}
		adminlog(lang('replysetsucceed'),lang('replysetsucceed'));
		amessage('contentsetsucceed',"?entry=replys&action=replysedit$param_suffix&page=$page$filterstr");
	}
	}else include(M_ROOT.$u_tplname);
}elseif($action == 'replydetail'){
	$cid = empty($cid) ? 0 : max(0,intval($cid));
	$cuid = $db->result_one("SELECT cuid FROM {$tblprefix}replys WHERE cid='$cid'");
	if(!($commu = read_cache('commu',$cuid))) amessage('setcommuitem');
	if(empty($commu['uadetail'])){
		load_cache('rfields,ucotypes');
		$uedit = new cls_cuedit;
		if($errno = $uedit->read($cid,'reply')){
			if($errno == 1) amessage('choosereply');
			if($errno == 2) amessage('choosereplyobject');
			if($errno == 3) amessage('setcommuitem');
		}
		foreach(array('aid','commu','citems','fields',) as $var) $$var = &$uedit->$var;
		$oldrow = &$uedit->info;
		$forward = empty($forward) ? M_REFERER : $forward;
		$forwardstr = '&forward='.rawurlencode($forward);
		if(!submitcheck('breplydetail')){
			tabheader($commu['cname'].'&nbsp; &nbsp; '."<a href=\"".view_arcurl($oldrow)."\" target=\"_blank\">>>&nbsp; ".$oldrow['subject']."</a>",'commudetail',"?entry=replys&action=replydetail&cid=$cid$param_suffix$forwardstr",2,1,1);
			$submitstr = '';
			foreach($ucotypes as $k => $v){
				if(in_array('uccid'.$k,$citems) && $v['umode'] != 1){
					trbasic($v['cname'],'',mu_cnselect("replynew[uccid$k]",$oldrow['uccid'.$k],$k,lang('p_choose')),'');
					$submitstr .= makesubmitstr("replynew[uccid$k]",$v['notblank'],0,0,0,'common');
				}
			}
			$a_field = new cls_field;
			foreach($fields as $k => $v){
				if(!$v['isfunc']){
					$a_field->init();
					$a_field->field = $v;
					$a_field->oldvalue = $oldrow[$k];
					if($curuser->pmbypmids('field',$v['pmid'])){
						$a_field->trfield('replynew');
						$submitstr .= $a_field->submitstr;
					}
				}
			}
			unset($a_field);
			tabfooter('breplydetail');
			check_submit_func($submitstr);
		}else{
			$c_upload = new cls_upload;	
			$fields = fields_order($fields);
			$a_field = new cls_field;
			$uedit->updatefield('refreshdate',$timestamp);
			foreach($ucotypes as $k => $v){
				if(in_array('uccid'.$k,$citems) && $v['umode'] != 1){
					$uedit->updatefield('uccid'.$k,$replynew['uccid'.$k]);
				}
			}
			foreach($fields as $k => $v){
				if(!$v['isfunc']){
					$a_field->init();
					$a_field->field = $v;
					if($curuser->pmbypmids('field',$v['pmid'])){
						$a_field->oldvalue = isset($oldrow[$k]) ? $oldrow[$k] : '';
						$a_field->deal('replynew');
						if(!empty($a_field->error)){
							$c_upload->rollback();
							amessage($a_field->error,axaction(2,M_REFERER));
						}
						$uedit->updatefield($k,$a_field->newvalue);
					}
				}
			}
			unset($a_field);
		
			$c_upload->closure(1, $cid, 'replys');
			$c_upload->saveuptotal(1);
			$uedit->updatedb();
			amessage('updatesucceed',axaction(6,$forward),$commu['cname']);
		}
	}
}
?>