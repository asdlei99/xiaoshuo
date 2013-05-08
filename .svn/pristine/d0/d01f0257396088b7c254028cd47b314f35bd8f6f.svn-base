<?
!defined('M_COM') && exit('No Permission');
include_once M_ROOT."./include/arcedit.cls.php";
load_cache('acatalogs,channels,currencys');
$catalogs = &$acatalogs;
$forward = empty($forward) ? M_REFERER : $forward;
$page = !empty($page) ? max(1, intval($page)) : 1;
submitcheck('bfilter') && $page = 1;
$keyword = empty($keyword) ? '' : $keyword;
$filterstr = '';
foreach(array('keyword') as $k){
	$filterstr .= "&$k=".rawurlencode($$k);
}

$wheresql = "WHERE n.mid='$memberid'";
$keyword && $wheresql .= " AND a.subject LIKE '%".str_replace(array(' ','*'),'%',addcslashes($keyword,'%_'))."%'";
if(!submitcheck('barcsedit')){
	
	echo "<div class=\"itemtitle\"><ul class=\"tab1 tab0 bdtop\">\n";
	foreach ($subMenu_fav as $k => $v) {
		$nclassstr = 'td24'.($action == $k ? ' current' : '');
		echo "<li".($nclassstr ? " class=\"$nclassstr\"" : '')."><a href=\"/adminm.php?action={$k}\"><span>{$v}</span></a></li>\n";
	}
	echo "</ul></div><div class=\"blank15h\"></div>";

	$pagetmp = $page;
	do{
		$query = $db->query("SELECT n.mid, n.readtime,a.* FROM {$tblprefix}newread  n LEFT JOIN {$tblprefix}archives a ON a.aid=n.aid $wheresql ORDER BY n.readtime DESC LIMIT ".(($pagetmp - 1) * $mrowpp).",$mrowpp");
		$pagetmp--;
	} while(!$db->num_rows($query) && $pagetmp);
	$itemstr = '';
	while($item = $db->fetch_array($query)){
		$aid = $item['aid'];
		$item['arcurl'] = view_arcurl($item);
		$castr = empty($catalogs[$item['caid']]) ? lang('nocata') : $catalogs[$item['caid']]['title'];
		$item['createdate'] = date("$dateformat", $item['createdate']);
		//获取小说的最新章节与更新时间
		$sql = "select a5.* from xs_archives as a5, (select a1.aid from xs_albums as a1 LEFT JOIN xs_archives_1 as a2 ON a2.aid=a1.aid WHERE a1.pid='".$aid."') as a4 WHERE a5.aid=a4.aid  ORDER BY a5.createdate DESC LIMIT 1";
		$wz = $db->fetch_one($sql);
		if (!empty($wz)) {
			$zj = $wz['subject'];
			$dt = date('Y-m-d H:i' ,$wz['createdate']);
			$zjid = $wz['aid'];
		} else {
			$zj = '无最新章节';
			$dt = '-';
			$zjid = '';
		}
		$itemstr .= "<tr>".
			"<td class=\"item\" width=\"80\">$castr</td>\n".
			"<td class=\"item\" width='130' style='text-align:left;'><a style=\"color:#24A3CE;font-weight:bold;\" href=\"$item[arcurl]\" target=\"_blank\">".mhtmlspecialchars($item['subject'])."</a></td>\n";
			if($zjid !== '') {
				$itemstr .= "<td class=\"item\" style='text-align:left;' width=\"250\"><a href=\"/archive.php?aid=".$zjid."\" target=\"_blank\">".$zj."</a></td>\n";
				$itemstr .= "<td class=\"item sj\" width=\"150\">".$dt."</td>\n";
			} else {
				$itemstr .= "<td class=\"item\" style='text-align:left;' width=\"250\">--</td>\n";
				$itemstr .= "<td class=\"item\" width=\"150\">&nbsp-</td>\n";
			}
			$itemstr .= "<td class=\"item sj\" width=\"150\">".date('m-d H:i:s', $item['readtime'])."</td>\n";
			$itemstr .= "<td class=\"item zz\" width=\"100\">$item[author]</td>\n";
			if ($item['abover'] == 1) {
				$itemstr .= "<td class=\"item ztb\" width=\"50\">完结</td>\n";
			} else {
				$itemstr .= "<td class=\"item ztb\" width=\"50\">连载</td>\n";
			}
	}
	$counts = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}newread n LEFT JOIN {$tblprefix}archives a ON a.aid=n.aid $wheresql");
	$multi = multi($counts,$mrowpp,$page,"?action=newread$filterstr");

	mtabheader('最近阅读列表','','',8);
	mtrcategory(array('类别','作品名', '最新章节', '更新时间', '阅读时间', lang('author'),'状态'));
	echo $itemstr;
	mtabfooter();
	echo $multi;
	//echo "<input class=\"button\" type=\"submit\" name=\"barcsedit\" value=\"移除书架\"></form>";
}else{
	empty($selectid) && mcmessage('selectfavoritearc',$forward);
	$query = $db->query("SELECT * FROM {$tblprefix}favorites WHERE mid=$memberid AND aid ".multi_str($selectid)." ORDER BY aid DESC");
	while($item = $db->fetch_array($query)){
		$items[$item['aid']] = $item;
	}
	$aedit = new cls_arcedit;
	foreach($items as $item){
		$aedit->set_aid($item['aid']);
		$aedit->arc_nums('favorites',-1,1);
		$aedit->init();
		$curuser->basedeal('favorite',0,1);
	}
	$curuser->updatedb();
	$db->query("DELETE FROM {$tblprefix}favorites WHERE aid ".multi_str(array_keys($items)),'UNBUFFERED');
	unset($aedit);
	if(!empty($select_all)){
		$npage ++;
		if($npage <= $pages){
			$fromid = min(array_keys($items));
			$transtr = '';
			$transtr .= "&select_all=1";
			$transtr .= "&pages=$pages";
			$transtr .= "&npage=$npage";
			$transtr .= "&barcsedit=1";
			$transtr .= "&fromid=$fromid";
			mcmessage('operating',"?action=favorites$transtr&forward=".urlencode($forward),$pages,$npage,"<a href=\"$forward\">",'</a>');
		}
	}
	mcmessage('favoritedelsucceed',"?action=comments&page=$page$filterstr");
}
?>