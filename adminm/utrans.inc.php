<?php
!defined('M_COM') && exit('No Permission');
load_cache('mchannels,uprojects,grouptypes');

if(!isset($utran['toid'])){
	$notranspro = true;
	foreach($grouptypes as $_gtid => $grouptype){
		//���������и������뻹���µ�����
		$isold = false;
		//����Ҫ�����ϴ�����ʱ�䣬��ע��ظ�����
		if($minfos = $db->fetch_one("SELECT * FROM {$tblprefix}utrans WHERE mid='$memberid' AND checked='0' AND gtid='$_gtid'")){
			$isold = true;
		}
		if ($isold == true) {
			echo '<table cellspacing="1" cellpadding="0" border="0" class="tabmain">
			<tbody><tr class="header"><td colspan="2"><b>[������ϵ]�������&nbsp; ��������&nbsp;:&nbsp;�����Ա</b></td></tr>
			<tr><td width="25%" class="item1" style="text-align:center;"><font color="red">�������ʱ��Ϊ1-3��������</font><br />���������ĵȴ���������ʱ��ע�����������ͨ���������С˵��Ʒ��</td>
			</tr></tbody></table>';
			exit();
		}
	}

	foreach($grouptypes as $gtid => $grouptype){
		if(!$grouptype['issystem'] && $grouptype['mode'] == 1){
			$toidsarr = array();
			$usergroups = read_cache('usergroups',$gtid);
			
			foreach($uprojects as $k => $v){
				if(($v['sugid'] == $curuser->info["grouptype$gtid"]) && ($v['gtid'] == $gtid)){
					if($v['tugid'] && empty($usergroups[$v['tugid']])) continue;
					$toidsarr[$v['tugid']] = $v['tugid'] ? $usergroups[$v['tugid']]['cname'] : lang('user0');
				}
			}
			//TODO ���ֻʣһ���������Ǿ�˵�����Ѿ���������
			if (count($toidsarr) <= 1) {
				mcmessage('���Ѿ��Ǳ�վ���ҡ�');
			}
			if($toidsarr){
				$isold = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}utrans WHERE mid='$memberid' AND checked='0' AND gtid='$gtid'");
				$nowugstr = '&nbsp; '.lang('groupcurrentuser').'&nbsp;:&nbsp;'.($curuser->info["grouptype$gtid"] ? $usergroups[$curuser->info["grouptype$gtid"]]['cname'] : lang('user0'));
				mtabheader(lang('needusergroupalter',$grouptype['cname']).$nowugstr,"utrans$gtid","?action=utrans",2, 0, 1);
				trhidden('gtid',$gtid);
				mtrbasic(lang('altertargetusergroup'),'utran[toid]',makeoption($toidsarr),'select');
				if (count($toidsarr) == 2) {
					mtrbasic('����', 'utran[biming]', '', 'text', '�벻Ҫ����', '25%', "&nbsp;&nbsp;<input type=\"button\" value=\"�������\" onclick=\"checkbiming(this,'members_1','utran[biming]');\">");
					$submitstr = makesubmitstr('utran[biming]', 1, 1, 2,14,'text');
				}
				mtabfooter('submit',lang($isold ? 'modify' : 'need'));
				check_submit_func($submitstr);
				$notranspro = false;
			}
		}
	}	
	$notranspro && mcmessage('���Ѿ��Ǳ�վ���ҡ�');
}else{
	if(empty($gtid)) mcmessage('choosegrouptype');
	foreach($uprojects as $k => $v){
		if($v['ename'] == $curuser->info["grouptype$gtid"].'_'.$utran['toid']) $uproject = $v;
	}
	if(empty($uproject)) mcmessage('ycnpu');
	$sugid = $curuser->info["grouptype$gtid"];
	$tugid = $utran['toid'];
	$mchid = $curuser->info['mchid'];
	if(in_array($mchid,explode(',',$grouptypes[$gtid]['mchids']))) mcmessage('ybomccntu');
	if($tugid && (!($usergroup = read_cache('usergroup',$gtid,$tugid)) || !in_array($mchid,explode(',',$usergroup['mchids'])))) mcmessage('ybomcnntu');
	//���������и������뻹���µ�����
	$isold = false;
	//����Ҫ�����ϴ�����ʱ�䣬��ע��ظ�����
	if($minfos = $db->fetch_one("SELECT * FROM {$tblprefix}utrans WHERE mid='$memberid' AND checked='0' AND gtid='$gtid'")){
		$isold = true;
	}
	$minfos['fromid'] = $curuser->info["grouptype$gtid"];
	$minfos['toid'] = $utran['toid'];
	if(!submitcheck('butran')){
		//TODO ��֤�����Ƿ��ظ�
		if (!empty($utran['biming'])) {
			$output = $db->fetch_one("SELECT COUNT(*) AS c FROM {$tblprefix}members_1 WHERE biming='{$utran['biming']}' LIMIT 0,1");
			$output = $output['c'];
			if (!empty($output)) {
				mcmessage('���������ظ�!', "?action=utrans");
			}
		}
		
		$usergroups = read_cache('usergroups',$gtid);
		$submitstr = '';
		mtabheader(lang('usergroupneedoption').'&nbsp; -&nbsp; '.$grouptypes[$gtid]['cname'],'utrans',"?action=utrans",2,1,1);
		mtrbasic(lang('usergroupaltermodel'),'',(!$sugid ? lang('user0') : $usergroups[$sugid]['cname']).'&nbsp; ->&nbsp; '.(!$tugid ? lang('user0') : $usergroups[$tugid]['cname']),'');
		trhidden('utran[toid]',$tugid);
		trhidden('gtid',$gtid);
		trhidden('utran[biming]', $utran['biming']);
		mtrbasic(lang('applytime'),'',date("Y-m-d H:i",$isold ? $minfos['createdate'] : $timestamp),'');
		mtrbasic(lang('remark'),'utran[remark]',empty($minfos['remark']) ? '' : $minfos['remark'],'textarea');
		$isold && mtrbasic(lang('adminreply').@noedit(1),'',$minfos['reply'],'textarea');
		mtabfooter('butran');
		check_submit_func($submitstr);
	}else{
		//��Ҫ���һ�£���ǰ��Ա�Ƿ�������뵽�µĻ�Ա��
		$omchid = $curuser->info['mchid'];//ԭģ��
		
		//TODO �����û��ı���
		if (!empty($utran['biming'])) {
			//TODO ��֤�����Ƿ��ظ�
			$output = $db->fetch_one("SELECT COUNT(*) AS c FROM {$tblprefix}members_1 WHERE biming='{$utran['biming']}' LIMIT 0,1");
			$output = $output['c'];
			if (!empty($output)) {
				mcmessage('���������ظ�!', "?action=utrans");
			}
		
			$sql = "update {$tblprefix}members_1 SET biming='{$utran['biming']}' WHERE mid={$curuser->info['mid']}";
			$db->query($sql);
			$utran['remark'] = '���߱�����'.$utran['biming'].'\n'.$utran['remark'];
		}
		if($uproject['autocheck']){
			$curuser->updatefield("grouptype$gtid",$tugid,'main');
			$curuser->updatedb();
			if($isold){
				$db->query("UPDATE {$tblprefix}utrans SET toid='$tugid',fromid='$sugid',remark='',reply='',checked='1' WHERE mid='$memberid' AND checked='0' AND gtid='$gtid'");
			}else{
				$db->query("INSERT INTO {$tblprefix}utrans SET mid='$memberid',mname='".$curuser->info['mname']."',gtid='$gtid',toid='$tugid',fromid='$sugid',remark='',checked='1',createdate='$timestamp'");
			}
		}else{
			$utran['remark'] = trim($utran['remark']);
			if($isold){
				$db->query("UPDATE {$tblprefix}utrans SET toid='$tugid',fromid='$sugid',remark='$utran[remark]' WHERE mid='$memberid' AND checked='0' AND gtid='$gtid'");
			}else{
				$db->query("INSERT INTO {$tblprefix}utrans SET mid='$memberid',mname='".$curuser->info['mname']."',gtid='$gtid',toid='$tugid',fromid='$sugid',remark='$utran[remark]',checked='0',createdate='$timestamp'");
			}
		}
		mcmessage($uproject['autocheck'] ? 'usergroupalterfinish' : 'waitcheck',"?action=utrans");
	}
}
?>
