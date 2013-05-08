<?
include_once M_ROOT.'./include/archive.fun.php';
include_once M_ROOT."./include/admin.fun.php";
include_once M_ROOT."./include/adminm.fun.php";
include_once M_ROOT."./include/arcedit.cls.php";
include_once M_ROOT."./include/cheader.inc.php";
_header();
sys_cache('nvconfigs');
load_cache('mlangs');
///////////////////////////////////////////
$vip_crid = 2;
$inchid = 1;
$achid = 4;
//////////////////////////////////////

$aid = empty($aid) ? 0 : max(0,intval($aid));
if(!$aid) mcmessage('choosecommentobject');
if(!$memberid) mcmessage('订阅vip内容请先登录。');
if(!($aaid = $db->result_one("SELECT pid FROM {$tblprefix}albums WHERE aid='$aid' AND pchid=$achid"))) mcmessage('请指定连载小说中的章节。');
$aedit = new cls_arcedit;
$aedit->set_aid($aaid);
$aedit->basic_data();
if(!submitcheck('newcommu')){
?>
<script type="text/javascript">
function checkall(form, prefix, checkall){
	checkall = checkall ? checkall : 'chkall';
	$id('allReadPrice').innerHTML = 0;
	for(var i = 0; i < form.elements.length; i++){
		var e = form.elements[i];
		if(e.name != checkall && (!prefix || !e.name.indexOf(prefix))){
			e.checked = form.elements[checkall].checked;
			e.checked && onePrice(e);
		}
	}
}
function onePrice(e){
	price = parseInt($id('readPrice[' + e.value + ']').innerHTML);
	if(!price)return;
	if(!e.checked)price = -price;
	var ap = $id('allReadPrice');
	ap.innerHTML = parseInt(ap.innerHTML) + price;
}
</script>
<?
	$subeds = array();
	$query = $db->query("SELECT b.aid FROM {$tblprefix}albums b,{$tblprefix}subscribes u WHERE b.pid='$aaid' AND u.aid=b.aid AND u.mid='$memberid'");
	while($row = $db->fetch_array($query)) $subeds[] = $row['aid'];
	
	mtabheader('《'.$aedit->archive['subject'].'》VIP章节订阅','subscribes',"subscribe.php?aid=$aid",30);
	$cy_arr = array("<input class=\"checkbox\" type=\"checkbox\" name=\"chkall\" onclick=\"checkall(this.form, 'selectid', 'chkall');\">全",array('章节标题', 'left'),);
	$cy_arr[] = '字数';
	$cy_arr[] = '阅读价格';
	mtrcategory($cy_arr);
	$query = $db->query("SELECT a.* FROM {$tblprefix}albums b LEFT JOIN {$tblprefix}archives a ON a.aid=b.aid WHERE b.pid='$aaid' AND b.checked='1' AND a.ccid3<>0 ORDER BY b.volid,b.vieworder ASC,a.aid");
	$itemstr = '';
	while($row = $db->fetch_array($query)){
		$selectstr = in_array($row['aid'],$subeds) ? "<input class=\"checkbox\" type=\"checkbox\" disabled>" : "<input class=\"checkbox\" type=\"checkbox\" name=\"selectid[$row[aid]]\" value=\"$row[aid]\" onclick=\"onePrice(this)\">";
		$row['arcurl'] = view_arcurl($row);
		$row['arcurl'] = view_arcurl($row);
		$subjectstr = "<a href=$row[arcurl]>".mhtmlspecialchars($row['subject'])."</a>";
		$bytenumstr = $row['bytenum'];
		$itemstr .= "<tr><td class=\"item\">$selectstr</td><td class=\"item2\">$subjectstr</td>\n";
		$itemstr .= "<td class=\"item\">$bytenumstr</td>\n";
		$itemstr .= "<td class=\"item cRed\" id=\"readPrice[$row[aid]]\">".(int)($nvconfigs['readprice0'] * (int)($row['bytenum'] / 1000))."</td>\n";
		$itemstr .= "</tr>\n";
	}
	echo $itemstr;
	mtabfooter('newcommu');
	echo '<br>&nbsp; &nbsp; 您选择的订阅内容需要<span id="allReadPrice" style="color:red">0</span>经典币，您目前拥有：'.$curuser->info['currency'.$vip_crid].'经典币 >><a href="adminm.php?action=payother">前往充值</a>  >><a href="'.$cms_abs.'">返回首页</a>';
}else{
	if(empty($selectid)) mcmessage('请选择需要订阅的章节。',M_REFERER);
	$num = 0;
	$query = $db->query("SELECT aid,bytenum FROM {$tblprefix}archives WHERE aid ".multi_str($selectid));
	while($row = $db->fetch_array($query)){
		//TODO 修改订阅扣款费用
		$n_price = (int)($nvconfigs['readprice0'] * (int)($row['bytenum'] / 1000));
		if($curuser->crids_enough(array($vip_crid => -$n_price))){
			$curuser->updatecrids(array($vip_crid => -$n_price),1,'订阅 '.$aedit->archive['subject']);
			$aedit->auser->updatecrids(array($vip_crid => $n_price),1,$aedit->archive['subject'].' 被订阅');
			$db->query("INSERT INTO {$tblprefix}subscribes SET
			aid='$row[aid]',
			mid='$memberid',
			mname='".$curuser->info['mname']."',
			cridstr = '".$n_price."',
			createdate='$timestamp'
			");
			$num ++;
		}
	}
	mcmessage($num ? ('您成功订阅了'.$num.'个vip章节!') : '您的订阅不成功!',M_REFERER);
}
_footer();



?>
