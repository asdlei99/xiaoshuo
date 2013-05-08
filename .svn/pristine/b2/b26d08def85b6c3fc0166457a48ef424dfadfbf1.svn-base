<?
!defined('M_COM') && exit('No Permission');
load_cache('channels,acatalogs,currencys');
$catalogs = &$acatalogs;
$page = empty($page) ? 1 : max(1, intval($page));
$keyword = empty($keyword) ? '' : $keyword;
$filterstr = '';
foreach(array('keyword') as $k){
	$filterstr .= "&$k=".rawurlencode($$k);
}
$wheresql = "WHERE c.mid=$memberid AND c.oid>0";
$keyword && $wheresql .= " AND a.subject LIKE '%".str_replace(array(' ','*'),'%',addcslashes($keyword,'%_'))."%'";

echo mform_str($action.'arcsedit',"?action=$action&page=$page");
mtabheader_e();
echo "<tr><td class=\"item2\">";
echo lang('keyword')."&nbsp; <input class=\"text\" name=\"keyword\" type=\"text\" value=\"$keyword\" style=\"vertical-align: middle;\">&nbsp; ";
echo mstrbutton('bfilter','filter0').'</td></tr>';
mtabfooter();

$pagetmp = $page;
do{
	$query = $db->query("SELECT c.*,a.sid,a.createdate,a.caid,a.chid,a.subject FROM {$tblprefix}purchases c LEFT JOIN {$tblprefix}archives a ON (a.aid=c.aid) $wheresql ORDER BY c.cid DESC LIMIT ".(($pagetmp - 1) * $mrowpp).",$mrowpp");
	$pagetmp--;
} while(!$db->num_rows($query) && $pagetmp);
$itemstr = '';
$i = $pagetmp * $mrowpp;
while($item = $db->fetch_array($query)){
	$i ++;
	$item['arcurl'] = view_arcurl($item);
	$item['catalog'] = empty($catalogs[$item['caid']]) ? lang('nocata') : $catalogs[$item['caid']]['title'];
	$item['createdate'] = date("$dateformat", $item['createdate']);
	$item['checkedstr'] = $item['oid'] ? 'Y' : '-';
	$item['orderstr'] = $item['oid'] ? "<a href=\"?action=orders&oid=$item[oid]\">".lang('look')."</a>" : '-';
	$itemstr .= "<tr><td class=\"item\" width=\"30\">$i</td>\n".
		"<td class=\"item2\"><a href=\"$item[arcurl]\" target=\"_blank\">".mhtmlspecialchars($item['subject'])."</a></td>\n".
		"<td class=\"item\" width=\"80\">$item[catalog]</td>\n".
		"<td class=\"item\" width=\"40\">$item[nums]</td>\n".
		"<td class=\"item\" width=\"40\">$item[price]</td>\n".
		"<td class=\"item\" width=\"40\">$item[orderstr]</td>\n".
		"<td class=\"item\" width=\"100\">$item[createdate]</td></tr>\n";
}
$counts = $db->result_one("SELECT count(*) FROM {$tblprefix}purchases c LEFT JOIN {$tblprefix}archives a ON (a.aid=c.aid) $wheresql");
$multi = multi($counts, $mrowpp, $page, "?action=purchases$filterstr");

mtabheader(lang('purchasedgoodslist'),'','',9);
mtrcategory(array(lang('sn'),array(lang('goodscname'),'left'),lang('catalog'),lang('amount'),lang('price'),lang('orders'),lang('purchasedate')));
echo $itemstr;
mtabfooter();
echo $multi;
?>