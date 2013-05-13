<?php
!defined('M_COM') && exit('No Permission');
load_cache('mchannels,uprojects,grouptypes');

if(!isset($utran['toid'])){
	$notranspro = true;
	foreach($grouptypes as $_gtid => $grouptype){
		//分析是已有更新申请还是新的申请
		$isold = false;
		//仅需要读出上次申请时间，备注与回复出来
		if($minfos = $db->fetch_one("SELECT * FROM {$tblprefix}utrans WHERE mid='$memberid' AND checked='0' AND gtid='$_gtid'")){
			$isold = true;
		}
		if ($isold == true) {
			echo '<table cellspacing="1" cellpadding="0" border="0" class="tabmain">
			<tbody><tr class="header"><td colspan="2"><b>[作家组系]变更申请&nbsp; 您所在组&nbsp;:&nbsp;组外会员</b></td></tr>
			<tr><td width="25%" class="item1" style="text-align:center;"><font color="red">作者审核时间为1-3个工作日</font><br />请您请耐心等待，并且随时关注审核情况。审核通过后再添加小说作品。</td>
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
			//TODO 如果只剩一个方案，那就说明他已经是作家了
			if (count($toidsarr) <= 1) {
				mcmessage('您已经是本站作家。');
			}
			if($toidsarr){
				$isold = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}utrans WHERE mid='$memberid' AND checked='0' AND gtid='$gtid'");
				$nowugstr = '&nbsp; '.lang('groupcurrentuser').'&nbsp;:&nbsp;'.($curuser->info["grouptype$gtid"] ? $usergroups[$curuser->info["grouptype$gtid"]]['cname'] : lang('user0'));
				mtabheader(lang('needusergroupalter',$grouptype['cname']).$nowugstr,"utrans$gtid","?action=utrans",2, 0, 1);
				trhidden('gtid',$gtid);
				mtrbasic(lang('altertargetusergroup'),'utran[toid]',makeoption($toidsarr),'select');
				if (count($toidsarr) == 2) {
					mtrbasic('笔名', 'utran[biming]', '', 'text', '请不要重名', '25%', "&nbsp;&nbsp;<input type=\"button\" value=\"检查重名\" onclick=\"checkbiming(this,'members_1','utran[biming]');\">");
					$submitstr = makesubmitstr('utran[biming]', 1, 1, 2,14,'text');
				}
				mtabfooter('submit',lang($isold ? 'modify' : 'need'));
				check_submit_func($submitstr);
				$notranspro = false;
			}
		}
	}	
	$notranspro && mcmessage('您已经是本站作家。');
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
	//分析是已有更新申请还是新的申请
	$isold = false;
	//仅需要读出上次申请时间，备注与回复出来
	if($minfos = $db->fetch_one("SELECT * FROM {$tblprefix}utrans WHERE mid='$memberid' AND checked='0' AND gtid='$gtid'")){
		$isold = true;
	}
	$minfos['fromid'] = $curuser->info["grouptype$gtid"];
	$minfos['toid'] = $utran['toid'];
	if(!submitcheck('butran')){
		//TODO 验证笔名是否重复
		if (!empty($utran['biming'])) {
			$output = $db->fetch_one("SELECT COUNT(*) AS c FROM {$tblprefix}members_1 WHERE biming='{$utran['biming']}' LIMIT 0,1");
			$output = $output['c'];
			if (!empty($output)) {
				mcmessage('笔名不能重复!', "?action=utrans");
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
		//需要检查一下，当前会员是否允许加入到新的会员组
		$omchid = $curuser->info['mchid'];//原模型
		
		//TODO 更新用户的笔名
		if (!empty($utran['biming'])) {
			//TODO 验证笔名是否重复
			$output = $db->fetch_one("SELECT COUNT(*) AS c FROM {$tblprefix}members_1 WHERE biming='{$utran['biming']}' LIMIT 0,1");
			$output = $output['c'];
			if (!empty($output)) {
				mcmessage('笔名不能重复!', "?action=utrans");
			}
		
			$sql = "update {$tblprefix}members_1 SET biming='{$utran['biming']}' WHERE mid={$curuser->info['mid']}";
			$db->query($sql);
			$utran['remark'] = '作者笔名：'.$utran['biming'].'\n'.$utran['remark'];
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
