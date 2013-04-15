<?
!defined('M_COM') && exit('No Permission');
include_once M_ROOT."./include/arcedit.cls.php";
load_cache('acatalogs,channels,currencys');
$catalogs = &$acatalogs;
$forward = empty($forward) ? M_REFERER : $forward;
$forwardstr = '&forward='.rawurlencode($forward);
$page = !empty($page) ? max(1, intval($page)) : 1;
submitcheck('bfilter') && $page = 1;
$viewdetail = empty($viewdetail) ? '' : $viewdetail;
$isatm = empty($isatm) ? '0' : $isatm;
$caid = empty($caid) ? '0' : $caid;
$chid = empty($chid) ? '0' : $chid;
$subject = empty($subject) ? '' : $subject;
$indays = empty($indays) ? 0 : max(0,intval($indays));
$outdays = empty($outdays) ? 0 : max(0,intval($outdays));
$filterstr = '';
foreach(array('viewdetail','caid','chid','subject','indays','outdays') as $k){
	$filterstr .= "&$k=".urlencode($$k);
}
$wheresql = " WHERE s.mid='$memberid' AND s.isatm='$isatm'";
if(!empty($caid)){
	$caids = array($caid);
	$tempids = array();
	$tempids = son_ids($catalogs,$caid,$tempids);
	$caids = array_merge($caids,$tempids);
	$wheresql .= " AND a.caid ".multi_str($caids);
}
if(!empty($chid)) $wheresql .= " AND a.chid='$chid'";
if(!empty($subject)) $wheresql .= " AND a.subject='$subject'";
if(!empty($indays)) $wheresql .= " AND s.createdate>'".($timestamp - 86400 * $indays)."'";
if(!empty($outdays)) $wheresql .= " AND s.createdate<'".($timestamp - 86400 * $outdays)."'";
if(!submitcheck('barcsedit')){
	$caidsarr = array('0' => lang('allcatalog')) + caidsarr();
	$chidsarr = array('0' => lang('allchannel')) + chidsarr();
	$isatmarr = array('0' => lang('archive'),'1' => lang('attachment'));
	mtabheader(lang('filtersubscribe').viewcheck('viewdetail',$viewdetail,'tbodyfilter').'&nbsp; &nbsp; '.mstrbutton('bfilter','filter0'),"?action=subscribes$forwardstr");
	mtrbasic(lang('subscribetype'),'',makeradio('isatm',$isatmarr,$isatm),'');
	echo "<tbody id=\"tbodyfilter\" style=\"display: ".(empty($viewdetail) ? 'none' : '')."\">";
	mtrbasic(lang('belongcatalog'),'caid',makeoption($caidsarr,$caid),'select');
	mtrbasic(lang('archivechannel'),'chid',makeoption($chidsarr,$chid),'select');
	mtrbasic(lang('archivetitle'),'subject',$subject);
	mtrrange(lang('purchasedate'),array('outdays',empty($outdays) ? '' : $outdays,'','&nbsp; '.lang('daybefore').'&nbsp; -&nbsp; ',5),array('indays',empty($indays) ? '' : $indays,'','&nbsp; '.lang('dayin'),5));
	echo "</tbody>";
	mtabfooter();

	$pagetmp = $page;
	do{
		$query = $db->query("SELECT s.*,a.* FROM {$tblprefix}subscribes s LEFT JOIN {$tblprefix}archives a ON a.aid=s.aid $wheresql ORDER BY s.id DESC LIMIT ".(($pagetmp - 1) * $mrowpp).",$mrowpp");
		$pagetmp--;
	} while(!$db->num_rows($query) && $pagetmp);
	$itemstr = '';
	while($item = $db->fetch_array($query)){
		$id = $item['id'];
		$item['arcurl'] = view_arcurl($item);
		$item['createdate'] = date("$dateformat", $item['createdate']);
		$itemstr .= "<tr><td class=\"item\" width=\"40\"><input class=\"checkbox\" type=\"checkbox\" name=\"selectid[$id]\" value=\"$id\"></td>\n".
			"<td class=\"item2\"><a href=\"$item[arcurl]\" target=\"_blank\">".mhtmlspecialchars($item['subject'])."</a></td>\n".
			"<td class=\"item\" width=\"80\">".$catalogs[$item['caid']]['title']."</td>\n".
			"<td class=\"item\" width=\"80\">".($item['isatm'] ? 'Y' : '-')."</td>\n".
			"<td class=\"item\" width=\"80\">$item[cridstr]</td>\n".
			"<td class=\"item\" width=\"70\">$item[createdate]</td></tr>\n";
	}
	$itemcount = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}subscribes s LEFT JOIN {$tblprefix}archives a ON a.aid=s.aid $wheresql");
	$multi = multi($itemcount, $mrowpp, $page, "?action=subscribes$filterstr");

	mtabheader(lang('subscribelist')."&nbsp;&nbsp;&nbsp;&nbsp;<input class=\"checkbox\" type=\"checkbox\" name=\"select_all\" value=\"1\">&nbsp;".lang('selectallpage'),'','',8);
	mtrcategory(array("<input class=\"checkbox\" type=\"checkbox\" name=\"chkall\" onclick=\"checkall(this.form, 'selectid', 'chkall')\">",lang('title'),lang('catalog'),lang('attachment'),lang('currency'),lang('purchasedate')));
	echo $itemstr;
	mtabfooter();
	echo $multi;
	echo "<input class=\"button\" type=\"submit\" name=\"barcsedit\" value=\"".lang('del')."\"></form>";
}else{
	if(empty($selectid) && empty($select_all)){
		mcmessage('subscribecontent',$forward);
	}
	if(!empty($select_all)){
		$selectid = array();
		$npage = empty($npage) ? 1 : $npage;
		if(empty($pages)){
			$itemcount = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}subscribes s LEFT JOIN {$tblprefix}archives a ON a.aid=s.aid $wheresql");
			$pages = @ceil($itemcount / $mrowpp);
		}
		if($npage <= $pages){
			$fromstr = empty($fromid) ? "" : "s.id<$fromid";
			$nwheresql = !$wheresql ? ($fromstr ? "WHERE $fromstr" : "") : ($wheresql.($fromstr ? " AND " : "").$fromstr);
			$query = $db->query("SELECT s.id FROM {$tblprefix}subscribes s LEFT JOIN {$tblprefix}archives a ON a.aid=s.aid $nwheresql ORDER BY s.id DESC LIMIT 0,$mrowpp");
			while($item = $db->fetch_array($query)){
				$selectid[] = $item['id'];
			}
		}
	}
	$selectid && $db->query("DELETE FROM {$tblprefix}subscribes WHERE aid ".multi_str($selectid),'UNBUFFERED');
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
			mcmessage('operating'."<br>
					".lang('all')." $pages ".lang('page0')."£¬".lang('dealing')." $npage ".lang('page0')."<br><br>
					<a href=\"$forward\">>>".lang('pause')."</a>",
					"?action=subscribes$transtr&forward=".urlencode($forward),
					500);
		}
	}
	mcmessage('subscribedelsucceed',"?action=subscribes&page=$page$filterstr");
}
?>