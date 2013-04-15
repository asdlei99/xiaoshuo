<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
backallow('normal') || amessage('no_apermission');
include_once M_ROOT."./include/arcedit.cls.php";
$aid = empty($aid) ? 0 : max(0,intval($aid));
$aedit = new cls_arcedit;
$aedit->set_aid($aid);
$aedit->basic_data(0);
if(!$aedit->aid) amessage('confchoosarchi');
$_da = &$aedit->archive;
$channel = &$aedit->channel;
if(!$channel['isalbum']) amessage('onlyabvol');
if(empty($action)) $action = 'volsedit';
if($action == 'volsedit'){
	$niuid = empty($niuid) ? 0 : $niuid;
	if($niuid && $u_url = read_cache('inurl',$niuid)){
		$u_tplname = $u_url['tplname'];
		$u_onlyview = empty($u_url['onlyview']) ? 0 : 1;
	}
	if(empty($u_tplname) || !empty($u_onlyview)){
		if(!submitcheck('bvolsedit') && !submitcheck('bvoladd')){
		if(empty($u_tplname)){
			tabheader(lang('vol_admin').'&nbsp; -&nbsp; '.$_da['subject'],'volsedit',"?entry=$entry&action=$action&aid=$aid",'7');
			trcategory(array(lang('sn'),array(lang('volno'),'txtL'),array(lang('volname'),'txtL'),lang('delete')));
			$query = $db->query("SELECT * FROM {$tblprefix}vols WHERE aid=$aid ORDER BY volid");
			while($row = $db->fetch_array($query)){
				$i = empty($i) ? 1 : $i + 1;
				$vid = $row['vid'];
				echo "<tr class=\"txt\">\n".
				"<td class=\"txtC w30\">$i</td>\n".
				"<td class=\"txtL\"><input type=\"text\" name=\"volsnew[$vid][volid]\" value=\"".$row['volid']."\" size=\"5\" maxlength=\"5\"></td>\n".
				"<td class=\"txtL\"><input type=\"text\" name=\"volsnew[$vid][vtitle]\" value=\"".$row['vtitle']."\" size=\"30\" maxlength=\"30\"></td>\n".
				"<td class=\"txtC w30\"><a href=\"?entry=$entry&action=$action&aid=$aid&volid=$row[volid]\">".lang('delete')."</a></td>\n".
				"</tr>";
				
			}
			tabfooter('bvolsedit');
			tabheader(lang('add_vol').'&nbsp; -&nbsp; '.$_da['subject'],'voladd',"?entry=$entry&action=$action&aid=$aid");
			trbasic(lang('volno'),'volnew[volid]');
			trbasic(lang('volname'),'volnew[vtitle]');
			tabfooter('bvoladd',lang('add'));
			a_guide('volsedit');
		}else include(M_ROOT.$u_tplname);
	}elseif(submitcheck('bvolsedit')){
		if(!empty($volsnew)){
			$vols = array();
			$query = $db->query("SELECT * FROM {$tblprefix}vols WHERE aid=$aid ORDER BY vid");
			while($row = $db->fetch_array($query)) $vols[$row['vid']] = $row;

			foreach($volsnew as $vid => $volnew){
				$sqlstr = '';
				$volnew['vtitle'] = trim(strip_tags($volnew['vtitle']));
				if($volnew['vtitle'] && $volnew['vtitle'] != $vols[$vid]['vtitle']) $sqlstr .= ($sqlstr ? ',' : '')."vtitle='".$volnew['vtitle']."'";
				$volnew['volid'] = max(1,intval($volnew['volid']));
				if($volnew['volid'] && ($volnew['volid'] != $vols[$vid]['volid'])){
					if(!$db->result_one("SELECT COUNT(*) FROM {$tblprefix}vols WHERE aid=$aid AND volid='$volnew[volid]'")){
						$db->query("UPDATE {$tblprefix}albums SET volid='$volnew[volid]' WHERE pid='$aid' AND volid='".$vols[$vid]['volid']."'");
						$sqlstr .= ($sqlstr ? ',' : '')."volid='".$volnew['volid']."'";
					}
				}
				if($sqlstr) $db->query("UPDATE {$tblprefix}vols SET $sqlstr WHERE vid='$vid'");
			}
		}
		amessage('voleditfin',M_REFERER);
	}elseif(submitcheck('bvoladd')){
		$volnew['volid'] = max(1,intval($volnew['volid']));
		$volnew['vtitle'] = trim(strip_tags($volnew['vtitle']));
		if(empty($volnew['vtitle'])) amessage('pputvtitle',M_REFERER);
		if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}vols WHERE aid=$aid AND volid='$volnew[volid]'")) amessage('volidrepeat',M_REFERER);
		$db->query("INSERT INTO {$tblprefix}vols SET 
					vtitle='$volnew[vtitle]', 
					volid='$volnew[volid]', 
					aid='$aid'
					");
		amessage('voladdfin',M_REFERER);
	}
	}else include(M_ROOT.$u_tplname);
}elseif($action == 'voldel' && $aid && $volid){
	if(empty($confirm)){
		$message = lang('del_vol')."<br><br>";
		$message .= lang('confirmclick').">><a href=?entry=$entry&action=$action&aid=$aid&volid=$volid&confirm=1>".lang('delete')."</a><br>";
		$message .= lang('giveupclick').">><a href=?entry=$entry&action=$action&aid=$aid>".lang('goback')."</a>";
		amessage($message);
	}
	$db->query("UPDATE {$tblprefix}albums SET volid=0 WHERE pid='$aid' AND volid='$volid'");
	$db->query("DELETE FROM {$tblprefix}vols WHERE aid='$aid' AND volid='$volid'");
	amessage('voldelfin',"?entry=$entry&action=volsedit&aid=$aid");
}else amessage('errorparament');

?>
