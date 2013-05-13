<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
backallow('member') || amessage('no_apermission');
load_cache('mchannels,catalogs,acatalogs,cotypes,mtconfigs,channels,grouptypes,currencys,rprojects');
include_once M_ROOT."./include/upload.cls.php";
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/fields.cls.php";
$backamember = backallow('amember');
$actuser = new cls_userinfo;
$actuser->activeuser($mid,2);
empty($actuser->info['mid']) && amessage('choosemember');
(!empty($actuser->info['isfounder']) && $curuser->info['mid'] != $actuser->info['mid']) && amessage('cannotmodifyfounder');
$mchid = $actuser->info['mchid'];
$mchannel = $mchannels[$mchid];
foreach(array('acoids') as $var) $$var = $mchannel[$var] ? explode(',',$mchannel[$var]) : array();
if($action == 'memberdetail' && $mid){
	$mfields = read_cache('mfields',$mchid);
	if(!submitcheck('bmemberdetail')){
		$a_field = new cls_field;
		$submitstr = '';
		tabheader(lang('base_option').'&nbsp;：&nbsp;['.$mchannel['cname'].']'.$actuser->info['mname'],'memberdetail',"?entry=member&action=memberdetail&mid=$mid",2,1,1);
		trbasic(lang('modify_pwd'),'minfosnew[password]','','password');
		trbasic('*'.lang('email'),'minfosnew[email]',$actuser->info['email']);
		$submitstr .= makesubmitstr('minfosnew[password]',0,0,0,15);
		$submitstr .= makesubmitstr('minfosnew[email]',1,'email',0,50);

		if(in_array('caid',$acoids)){
			$catalogs = &$acatalogs;
			trcns('*'.lang('member_relate_catalog'),'minfosnew[caid]',$actuser->info['caid'],-1,0,$mchid,1,lang('p_choose'));
			$submitstr .= makesubmitstr('minfosnew[caid]',1,0,0,0,'common');
		}
		
		foreach($cotypes as $k => $v){
			if(in_array('ccid'.$k,$acoids)){
				trcns('*'.lang('member_relate_class').'&nbsp; -&nbsp; '.$v['cname'],"minfosnew[ccid$k]",$actuser->info["ccid$k"],-1,$k,$mchid,1,lang('p_choose'));
				$submitstr .= makesubmitstr("minfosnew[ccid$k]",1,0,0,0,'common');
			}
		}
		//TODO 去除 个人空间模版的选项
		//trbasic(lang('space_tpl_prj'),'minfosnew[mtcid]',makeoption(mtcidsarr($mchid),$actuser->info['mtcid']),'select');
		foreach($mfields as $k => $field){
			if(!$field['issystem'] && !$field['isfunc']){
				$a_field->init();
				$a_field->field = read_cache('mfield',$mchid,$k);
				$a_field->oldvalue = isset($actuser->info[$k]) ? $actuser->info[$k] : '';
				$a_field->trfield('minfosnew');
				$submitstr .= $a_field->submitstr;
			}
		}
		tabfooter('bmemberdetail');
		check_submit_func($submitstr);
		a_guide('memberdetail');
	}else{
		$minfosnew['email'] = empty($minfosnew['email']) ? '' : trim($minfosnew['email']);
		if(empty($minfosnew['email']) || !isemail($minfosnew['email'])){
			amessage('memberemailillegal', M_REFERER);
		}
		if(!empty($minfosnew['password']) && (strlen($minfosnew['password']) > 15) || $minfosnew['password'] != addslashes($minfosnew['password'])){
			amessage('memberpwdillegal', M_REFERER);
		}
		$actuser->updatefield('email',$minfosnew['email'],'main');
		!empty($minfosnew['password']) && $actuser->updatefield('password',md5(md5($minfosnew['password'])),'main');

		if(in_array('caid',$acoids)){
			$actuser->updatefield('caid',empty($minfosnew['caid']) ? 0 : $minfosnew['caid'],'main');
		}
		foreach($cotypes as $k => $v){
			if(in_array('ccid'.$k,$acoids)){
				$actuser->updatefield("ccid$k",empty($minfosnew["ccid$k"]) ? 0 : $minfosnew["ccid$k"],'main');
			}
		}
		$actuser->updatefield('mtcid',empty($minfosnew['mtcid']) ? 0 : $minfosnew['mtcid'],'main');

		$c_upload = new cls_upload;	
		$mfields = fields_order($mfields);
		$a_field = new cls_field;
		//TODO 如果有更新笔名，则更新该作者所有的作品作者名
		if (!empty($minfosnew['biming'])) {
			//检查笔名是否有重复
			$output = $db->fetch_one("SELECT COUNT(*) AS c FROM {$tblprefix}members_1 WHERE biming='{$minfosnew['biming']}' AND mid != '{$mid}' LIMIT 0,1");
			$output = $output['c'];
			if (!empty($output)) {
				amessage('笔名不能重复!', M_REFERER);
			}
			
			$sql = "update {$tblprefix}archives SET author='{$minfosnew['biming']}' WHERE mid={$mid}";
			$db->query($sql);
		}
		foreach($mfields as $k => $field){
			if(!$field['issystem'] && !$field['isfunc']){
				$a_field->init();
				$a_field->field = read_cache('mfield',$mchid,$k);
				if(!$curuser->pmbypmids('field',$a_field->field['pmid'])) continue;
				$a_field->oldvalue = isset($actuser->info[$k]) ? $actuser->info[$k] : '';
				$a_field->deal('minfosnew');
				if(!empty($a_field->error)){
					$c_upload->rollback();
					amessage($a_field->error,M_REFERER);
				}
				$actuser->updatefield($k,$a_field->newvalue,$field['tbl']);
			}
		}
		unset($a_field);
		$actuser->updatedb();
		$c_upload->closure(1, $mid, 'members');
		$c_upload->saveuptotal(1);
		adminlog(lang('detail_edit_member'));
		amessage('membermodifyfinish',M_REFERER);
	}

}elseif($action == 'grouptype' && $mid){
	if(!submitcheck('bmemberdetail')){
		$a_field = new cls_field;
		$submitstr = '';
		tabheader(lang('usergroup_msg').'&nbsp;：&nbsp;['.$mchannel['cname'].']'.$actuser->info['mname'],'memberdetail',"?entry=member&action=grouptype&mid=$mid",4,1,1);
		foreach($grouptypes as $gtid => $grouptype) {
			if($grouptype['mode'] < 2 && !in_array($mchid,explode(',',$grouptype['mchids'])) && ($backamember || $gtid != 2)){
				$actuser->info['grouptype'.$gtid.'date'] = !$actuser->info['grouptype'.$gtid.'date'] ? '' : date('Y-m-d',$actuser->info['grouptype'.$gtid.'date']);
				$ugidsarr = array('0' => lang('release_usergroup')) + ugidsarr($grouptype['gtid'],$mchid);			
				echo "<tr class=\"txt\">\n".
					"<td class=\"txtL w15B\">$grouptype[cname]</td>\n".
					"<td class=\"txtL w35B\"><select style=\"vertical-align: middle;\" name=\"minfosnew[grouptype".$gtid."]\">".makeoption($ugidsarr,$actuser->info['grouptype'.$gtid])."</select></td>\n".
					"<td class=\"txtL w15B\">".lang('enddate')."</td>\n".
					"<td class=\"txtL w35B\"><input type=\"text\" size=\"20\" id=\"minfosnew[grouptype".$gtid."date]\" name=\"minfosnew[grouptype".$gtid."date]\" value=\"".$actuser->info['grouptype'.$gtid.'date']."\" onclick=\"ShowCalendar(this.id);\"></td>\n".
					"</tr>";
			}else{
				$usergroups = read_cache('usergroups',$gtid);
				$actuser->info['grouptype'.$gtid.'date'] = !$actuser->info['grouptype'.$gtid.'date'] ? lang('noend') : date('Y-m-d',$actuser->info['grouptype'.$gtid.'date']);
				echo "<tr class=\"txt\">\n".
					"<td class=\"txtL w15B\">$grouptype[cname]</td>\n".
					"<td class=\"txtL w35B\">".(!$actuser->info['grouptype'.$gtid] ? lang('notbelong_usergroup') : $usergroups[$actuser->info['grouptype'.$gtid]]['cname'])."</td>\n".
					"<td class=\"txtL w15B\">".lang('enddate')."</td>\n".
					"<td class=\"txtL w35B\">".$actuser->info['grouptype'.$gtid.'date']."</td>\n".
					"</tr>";
			}
		}
		tabfooter('bmemberdetail');
		check_submit_func($submitstr);
		a_guide('memberdetail');
	}else{
		foreach($grouptypes as $gtid => $grouptype){
			if($grouptype['mode'] < 2 && !in_array($mchid,explode(',',$grouptype['mchids'])) && ($gtid != 2 || $backamember)){
				$minfosnew['grouptype'.$gtid.'date'] = (!$minfosnew['grouptype'.$gtid] || !isdate($minfosnew['grouptype'.$gtid.'date'])) ? '0' : strtotime($minfosnew['grouptype'.$gtid.'date']);
				$actuser->handgrouptype($gtid,$minfosnew['grouptype'.$gtid],$minfosnew['grouptype'.$gtid.'date']);
			}
		}
		$actuser->updatedb();
		adminlog(lang('detail_edit_member'));
		amessage('membermodifyfinish', M_REFERER);
	}

}elseif($action == 'allowance' && $mid){
	if(!submitcheck('bmemberdetail')){
		$a_field = new cls_field;
		$submitstr = '';
		tabheader(lang('issue_allowance_manager').'&nbsp;：&nbsp;['.$mchannel['cname'].']'.$actuser->info['mname'],'memberdetail',"?entry=member&action=allowance&mid=$mid",2,1,1);
		trbasic(lang('aw_arc_issue_limit'),'minfosnew[arcallowance]',$actuser->info['arcallowance']);
		trbasic(lang('aw_commu_issue_limit'),'minfosnew[cuallowance]',$actuser->info['cuallowance']);
		tabfooter('bmemberdetail');
		check_submit_func($submitstr);
		a_guide('memberdetail');
	}else{
		$actuser->updatefield('arcallowance',empty($minfosnew['arcallowance']) ? 0 : max(0,intval($minfosnew['arcallowance'])),'main');
		$actuser->updatefield('cuallowance',empty($minfosnew['cuallowance']) ? 0 : max(0,intval($minfosnew['cuallowance'])),'main');
		$actuser->updatedb();
		adminlog(lang('detail_edit_member'));
		amessage('membermodifyfinish', M_REFERER);
	}

}
?>
