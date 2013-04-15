<?php
!defined('M_COM') && exit('No Permission');
include_once M_ROOT."./include/arcedit.cls.php";
$forward = empty($forward) ? M_REFERER : $forward;
$forwardstr = '&forward='.rawurlencode($forward);
$aid = empty($aid) ? 0 : max(0,intval($aid));
$aedit = new cls_arcedit;
$aedit->set_aid($aid);
$aedit->basic_data(0);
if(!$aedit->aid || $aedit->archive['mid'] != $memberid) mcmessage('confchoosarchi');
$_da = &$aedit->archive;
$channel = &$aedit->channel;
if(!$channel['isalbum']) mcmessage('onlyabvol');
if(empty($deal)) $deal = 'volsedit';
if($deal == 'volsedit'){
	$niuid = empty($niuid) ? 0 : $niuid;
	if($niuid && $u_url = read_cache('inmurl',$nimuid)){
		$u_tplname = $u_url['tplname'];
		$u_onlyview = empty($u_url['onlyview']) ? 0 : 1;
	}
	if(empty($u_tplname) || !empty($u_onlyview)){
		if(!submitcheck('bvolsedit') && !submitcheck('bvoladd')){
		if(empty($u_tplname)){
			mtabheader(lang('vol_admin').'&nbsp; -&nbsp; '.$_da['subject'],'volsedit',"?action=$action&deal=$deal&aid=$aid",'7');
			mtrcategory(array(lang('sn'),array(lang('volno'),'item2'),array(lang('volname'),'item2'),lang('delete')));
			$query = $db->query("SELECT * FROM {$tblprefix}vols WHERE aid=$aid ORDER BY volid");
			while($row = $db->fetch_array($query)){
				$i = empty($i) ? 1 : $i + 1;
				$vid = $row['vid'];
				echo "<tr class=\"txt\">\n".
				"<td class=\"item\">$i</td>\n".
				"<td class=\"item2\"><input type=\"text\" name=\"volsnew[$vid][volid]\" value=\"".$row['volid']."\" size=\"5\" maxlength=\"5\"></td>\n".
				"<td class=\"item2\"><input type=\"text\" name=\"volsnew[$vid][vtitle]\" value=\"".$row['vtitle']."\" size=\"30\" maxlength=\"30\"></td>\n".
				"<td class=\"item\"><a href=\"?action=$action&deal=voldel&aid=$aid&volid=$row[volid]\">".lang('delete')."</a></td>\n".
				"</tr>";
				
			}
			mtabfooter('bvolsedit');
			mtabheader(lang('add_vol').'&nbsp; -&nbsp; '.$_da['subject'],'voladd',"?action=$action&deal=$deal&aid=$aid");
			mtrbasic(lang('volno'),'volnew[volid]');
			mtrbasic(lang('volname'),'volnew[vtitle]');
			mtabfooter('bvoladd',lang('add'));
			m_guide(@$u_guide);
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
		mcmessage('voleditfin',M_REFERER);
	}elseif(submitcheck('bvoladd')){
		$volnew['volid'] = max(1,intval($volnew['volid']));
		$volnew['vtitle'] = trim(strip_tags($volnew['vtitle']));
		if(empty($volnew['vtitle'])) mcmessage('pputvtitle',M_REFERER);
		if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}vols WHERE aid=$aid AND volid='$volnew[volid]'")) mcmessage('volidrepeat',M_REFERER);
		$db->query("INSERT INTO {$tblprefix}vols SET 
					vtitle='$volnew[vtitle]', 
					volid='$volnew[volid]', 
					aid='$aid'
					");
		mcmessage('voladdfin',M_REFERER);
	}
	}else include(M_ROOT.$u_tplname);
}elseif($deal == 'voldel' && $aid && $volid){
	if(empty($confirm)){
		mcmessage('del_vol','',"<a href=?action=$action&deal=$deal&aid=$aid&volid=$volid&confirm=1$forwardstr>",'</a>',"<a href=$forward>",'</a>');
	}else{
		$db->query("UPDATE {$tblprefix}albums SET volid=0 WHERE pid='$aid' AND volid='$volid'");
		$db->query("DELETE FROM {$tblprefix}vols WHERE aid='$aid' AND volid='$volid'");
		mcmessage('voldelfin',$forward);
	}
}else mcmessage('errorparament');

?>
