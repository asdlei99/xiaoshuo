<?
!defined('M_COM') && exit('No Permission');
$rname = 'currencylog';
$yearmonth = date('Ym',$timestamp);
$recorddir = M_ROOT.'./dynamic/records/';
$recordfile = $recorddir.$yearmonth.'_'.$rname.'.php';

$records = (array)@file($recordfile);
$filesize = @filesize($recordfile);

if($filesize < 500000){
	$dir = opendir($recorddir);
	$length = strlen($rname);
	$maxid = $id = 0;
	while($file = readdir($dir)){
		if(in_str($yearmonth.'_'.$rname,$file)) {
			$id = intval(substr($file, $length + 8));
			$id > $maxid && $maxid = $id;
		}
	}
	closedir($dir);

	if($maxid){
		$rnamefile2 = $recorddir.$yearmonth.'_'.$rname.'_'.$maxid.'.php';
	}else{
		$lastyearmonth = date('Ym',$timestamp - 86400 * 28);
		$rnamefile2 = $recorddir.$lastyearmonth.'_'.$rname.'.php';
	}

	if(file_exists($rnamefile2) && $records2 = @file($rnamefile2)) {
		$records = array_merge($records2, $records);
	}
}
$page = empty($page) ? 1 : max(1,intval($page));
$start = ($page - 1) * $mrowpp;
$records = array_reverse($records);
foreach($records as $k => $recordstr){
	$record = explode("\t",$recordstr);
	if(empty($record[1]) || ($record[2] != $curuser->info['mid'])){
		unset($records[$k]);
	}
}
$num = count($records);
$multi = multi($num,$mrowpp,$page,"adminm.php?action=crrecords");
$records = array_slice($records,$start,$mrowpp);

$itemrecord = '';
foreach($records as $recordstr){
	$record = explode("\t",$recordstr);
	$record[4] = $record[4] == 'cash' ? '现金' : $record[4];

	$record[7] = trim($record[7]) == 'otherreason' ? '其他原因' : $record[7];
	$record[1] = date('Y-m-d H:i:s',$record[1]);
	$itemrecord .= "<tr><td class=\"item\" width=\"60\">$record[2]</td>\n".
		"<td class=\"item\" width=\"80\">$record[3]</td>\n".
		"<td class=\"item\" width=\"60\">$record[4]</td>\n".
		"<td class=\"item\" width=\"40\">$record[5]</td>\n".
		"<td class=\"item\" width=\"60\">$record[6]</td>\n".
		"<td class=\"item2\">$record[7]</td>\n".
		"<td class=\"item sj\" width=\"150\">$record[1]</td></tr>\n";
}

echo "<div class=\"itemtitle\"><ul class=\"tab1 tab0 bdtop\">\n";
foreach ($subMenu_pays as $k => $v) {
	$nclassstr = 'td24'.($action == $k ? ' current' : '');
	echo "<li".($nclassstr ? " class=\"$nclassstr\"" : '')."><a href=\"/adminm.php?action={$k}\"><span>{$v}</span></a></li>\n";
}
echo "</ul></div><div class=\"blank15h\"></div>";

mtabheader(lang('crrecord'),'','',7);
mtrcategory(array(lang('memberid'),lang('membercname'),lang('currencytype'),lang('mode1'),lang('amount'),array(lang('reason'),'left'),lang('time')));
echo $itemrecord;
mtabfooter();
echo $multi;
?>