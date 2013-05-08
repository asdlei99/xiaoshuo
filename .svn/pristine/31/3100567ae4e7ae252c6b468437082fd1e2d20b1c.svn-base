<?
//会员提出的所有答案管理
!defined('M_COM') && exit('No Permission');
include_once M_ROOT."./include/arcedit.cls.php";
load_cache('currencys,acatalogs');
$catalogs = &$acatalogs;
$cid = empty($cid) ? 0 : max(0,intval($cid));
$page = empty($page) ? 1 : max(1, intval($page));
$viewdetail = empty($viewdetail) ? '' : $viewdetail;
$checked = isset($checked) ? $checked : '-1';
$caid = empty($caid) ? '0' : $caid;
$keyword = empty($keyword) ? '' : $keyword;
$filterstr = '';
foreach(array('viewdetail','checked','caid','keyword',) as $k){
	$filterstr .= "&$k=".urlencode($$k);
}
$wheresql = "WHERE c.mid='$memberid'";
if($checked != '-1') $wheresql .= " AND c.checked='$checked'";
if(!empty($caid)){
	$caids = array($caid);
	$tempids = array();
	$tempids = son_ids($catalogs,$caid,$tempids);
	$caids = array_merge($caids,$tempids);
	$wheresql .= " AND a.caid ".multi_str($caids);
}
$checkedarr = array('-1' => lang('nolimit'),'0' => lang('noadopt'),'1' => lang('adopted'));
$keyword && $wheresql .= " AND (c.mname LIKE '%".str_replace(array(' ','*'),'%',addcslashes($keyword,'%_'))."%' OR a.subject LIKE '%".str_replace(array(' ','*'),'%',addcslashes($keyword,'%_'))."%')";

echo mform_str($action.'archivesedit',"?action=answers&page=$page");
mtabheader_e();
echo "<tr><td class=\"item2\">";
echo lang('keyword')."&nbsp; <input class=\"text\" name=\"keyword\" type=\"text\" value=\"$keyword\" size=\"8\" style=\"vertical-align: middle;\">&nbsp; ";
$checkedarr = array('-1' => lang('nolimit').lang('adopt'),'0' => lang('adopt'),'1' => lang('noadopt'));
echo "<select style=\"vertical-align: middle;\" name=\"checked\">".makeoption($checkedarr,$checked)."</select>&nbsp; ";
$caidsarr = array('0' => lang('catalog')) + caidsarr();
echo "<select style=\"vertical-align: middle;\" name=\"caid\">".makeoption($caidsarr,$caid)."</select>&nbsp; ";
echo mstrbutton('bfilter','filter0').'</td></tr>';
mtabfooter();

$pagetmp = $page;
do{
	$query = $db->query("SELECT c.*,a.sid,a.aid,a.subject,a.chid,a.caid,a.createdate FROM {$tblprefix}answers c LEFT JOIN {$tblprefix}archives a ON (a.aid=c.aid) $wheresql ORDER BY c.cid DESC LIMIT ".(($pagetmp - 1) * $mrowpp).",$mrowpp");
	$pagetmp--;
} while(!$db->num_rows($query) && $pagetmp);

mtabheader(lang('myanswerlist'),'','',10);
mtrcategory(array(lang('id'),lang('questiontitle'),lang('adopt'),lang('currency'),lang('answerdate'),lang('edit')));

$itemstr = '';
while($row = $db->fetch_array($query)){
	$idstr = $row['cid'];
	$row['arcurl'] = view_arcurl($row);
	$subjectstr = "<a href=\"$row[arcurl]\" target=\"_blank\">".mhtmlspecialchars($row['subject'])."</a>";
	$currencystr = $row['currency'];
	$adddatestr = date('Y-m-d',$row['createdate']);
	$checkstr = $row['checked'] ? 'Y' : '-';
	$editstr = "<a href=\"?action=answer&cid=$row[cid]\" onclick=\"return floatwin('open_answer',this)\">".lang('edit')."</a>";
	$itemstr .= "<tr><td class=\"item\" width=\"40\">$idstr</td>\n".
		"<td class=\"item2\">$subjectstr</td>\n".
		"<td class=\"item\">$checkstr</td>\n".
		"<td class=\"item\">$currencystr</td>\n".
		"<td class=\"item\">$adddatestr</td>\n".
		"<td class=\"item\">$editstr</td></tr>\n";
}
$counts = $db->result_one("SELECT count(*) FROM {$tblprefix}answers c LEFT JOIN {$tblprefix}archives a ON (a.aid=c.aid) $wheresql");
$multi = multi($counts, $mrowpp, $page, "?action=answers$filterstr");

echo $itemstr;
mtabfooter();
echo $multi;
?>