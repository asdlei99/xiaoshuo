<?php
!defined('M_COM') && exit('No Permission');
$page = isset($page) ? $page : 1;
$page = max(1, intval($page));
$enable_uc && include_once M_ROOT.'./adminm/pmuc.inc.php';
if(empty($pmid)){
	if(!submitcheck('bpmbox')){
		echo "<div class=\"itemtitle\"><ul class=\"tab1 tab0 bdtop\">\n";
		foreach ($subMenu_pmbox as $k => $v) {
			$nclassstr = 'td24'.($action == $k ? ' current' : '');
			echo "<li".($nclassstr ? " class=\"$nclassstr\"" : '')."><a href=\"/adminm.php?action={$k}\"><span>{$v}</span></a></li>\n";
		}
		echo "</ul></div><div class=\"blank15h\"></div>";
		$wheresql = "WHERE toid=$memberid";
		$pagetmp = $page;
		do{
			$query = $db->query("SELECT * FROM {$tblprefix}pms $wheresql ORDER BY pmid DESC LIMIT ".(($pagetmp - 1) * $mrowpp).",$mrowpp");
			$pagetmp--;
		}while(!$db->num_rows($query) && $pagetmp);
		$itempm = '';
		while($pm = $db->fetch_array($query)){
			$pmid = $pm['pmid'];
			$pm['viewed'] = empty($pm['viewed']) ? 'Y' : '-';
			$pm['pmdate'] = date($dateformat,$pm['pmdate']);
			$itempm .= "<tr><td align=\"center\" class=\"item1\" width=\"40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$pmid]\" value=\"$pmid\">\n".
				"<td class=\"item2\">".mhtmlspecialchars($pm['title'])."</td>\n".
				"<td class=\"item\" width=\"120\">$pm[fromuser]</td>\n".
				"<td class=\"item\" width=\"40\">$pm[viewed]</td>\n".
				"<td class=\"item\" width=\"80\">$pm[pmdate]</td>\n".
				"<td class=\"item\" width=\"40\"><a href=\"adminm.php?action=pmbox&pmid=$pmid&page=$page\">".lang('look')."</a></td></tr>\n";
		}
		$pmcount = $db->result_one("SELECT count(*) FROM {$tblprefix}pms $wheresql");
		$multi = multi($pmcount,$mrowpp,$page,"adminm.php?action=pmbox");
	
		mtabheader(lang('pmlist'),'pmsedit',"adminm.php?action=pmbox&page=$page",6);
		mtrcategory(array("<input class=\"checkbox\" type=\"checkbox\" name=\"chkall\" class=\"category\" onclick=\"checkall(this.form, 'delete', 'chkall')\">".lang('del'),lang('title'),lang('senduser'),lang('noread'),lang('senddate'),lang('content')));
		echo $itempm;
		mtabfooter();
		echo $multi;
		echo "<input class=\"button\" type=\"submit\" name=\"bpmbox\" value=\"".lang('delete')."\">".
			"</form>\n";
	
	}else{
		empty($delete) && mcmessage('choosedeltem',"adminm.php?action=pmbox&page=$page");
		$pmidstr = "pmid ".multi_str($delete);
		$db->query("DELETE FROM {$tblprefix}pms WHERE $pmidstr",'UNBUFFERED');
		mcmessage('pmdelfinish',"adminm.php?action=pmbox&page=$page");
	}
}else{
	$pm = $db->fetch_one("SELECT * FROM {$tblprefix}pms WHERE toid=$memberid AND pmid=".$pmid);
	empty($pm) && mcmessage('pointpm',"adminm.php?action=pmbox&page=$page");
	mtabheader(lang('pmcontentsetting'));
	mtrbasic(lang('pmtitle'),'',mhtmlspecialchars($pm['title']),'');
	mtrbasic(lang('senduser'),'',$pm['fromuser']."&nbsp;  &nbsp; &nbsp; &nbsp;>><a href=\"adminm.php?action=pmsend&tonames=".rawurlencode($pm['fromuser'])."\">".lang('nreply')."</a>",'');
	mtrbasic(lang('sendtime'),'',date("$dateformat $timeformat",$pm['pmdate']),'');
	mtrbasic(lang('pmcontent'),'','<br>'.mnl2br(mhtmlspecialchars($pm['content'])).'<br>&nbsp;','');
	mtabfooter();
	$query = $db->query("UPDATE {$tblprefix}pms SET viewed='1' WHERE pmid=".$pmid);
	echo "<input class=\"button\" type=\"submit\" name=\"\" value=\"".lang('goback')."\" onclick=\"redirect('"."adminm.php?action=pmbox&page=$page"."')\">\n";	

}
?>