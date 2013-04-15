<?
!defined('M_COM') && exit('No Permission');
include_once M_ROOT."./include/arcedit.cls.php";
include_once M_ROOT."./include/archive.fun.php";
include_once M_ROOT."./include/upload.cls.php";
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/fields.cls.php";
load_cache('channels,catalogs,currencys,pfields,cotypes');
$oid = empty($oid) ? 0 : max(0,intval($oid));
$statearr = array('*' => lang('nolimit'),'0' => lang('wait_cpcheck'),'1' => lang('wait_pay'),'2' => lang('wait_send'),'3' => lang('goods_send'),'-1' => lang('order_ok'),'-2' => lang('order_cancel'));
$pmodearr = array('*' => lang('nolimit'),'0' => lang('noshiping'),'1' => lang('shipingfee1'),'2' => lang('shipingfee2'),'3' => lang('shipingfee3'));

if(empty($oid)){
	$page = !empty($page) ? max(1, intval($page)) : 1;
	submitcheck('bfilter') && $page = 1;
	$state = isset($state) && strlen($state) ? $state : '*';
	$pmode = isset($pmode) && strlen($pmode) ? $pmode : '*';
	$keyword = empty($keyword) ? '' : $keyword;

	$filterstr = '';
	foreach(array('state','pmode','keyword') as $k)$$k && $filterstr .= "&$k=".rawurlencode($$k);

	$wheresql = "mid=$memberid AND delstate!=2";
	$state != '*' && $wheresql .= " AND state='$state'";
	$pmode != '*' && $wheresql .= " AND paymode='$pmode'";
	if($keyword){
		$keyword = str_replace(array(' ','*'),'%',addcslashes($keyword,'%_'));
		$wheresql .= " AND (mname LIKE '%".$keyword."%' OR ordersn LIKE '%".$keyword."%')";
	}

	if(!submitcheck('barcsedit')){
		echo mform_str($action.'arcsedit',"?action=orders");
		mtabheader_e();
		echo "<tr><td class=\"item2\">";
		echo lang('keyword')."&nbsp; <input class=\"text\" name=\"keyword\" type=\"text\" value=\"$keyword\" style=\"vertical-align: middle;width:200px\">&nbsp; ";
		echo "<select style=\"vertical-align: middle;\" name=\"state\">".makeoption($statearr,$state)."</select>&nbsp; ";
		echo "<select style=\"vertical-align: middle;\" name=\"pmode\">".makeoption($pmodearr,$pmode)."</select>&nbsp; ";
		echo mstrbutton('bfilter','filter0').'</td></tr>';
		mtabfooter();

		$pagetmp = $page;
		do{
			$query = $db->query("SELECT * FROM {$tblprefix}orders WHERE $wheresql ORDER BY oid DESC LIMIT ".(($pagetmp - 1) * $atpp).",$atpp");
			$pagetmp--;
		} while(!$db->num_rows($query) && $pagetmp);
		$strorder = '';
		while($order = $db->fetch_array($query)){
			$oid = $order['oid'];
			$statestr = $statearr[$order['state']];
			$order['createdate'] = date("$dateformat",$order['createdate']);
			$strorder .= "<tr>".
				"<td class=\"item\" width=\"30\"><input class=\"checkbox\" type=\"checkbox\" name=\"selectid[$oid]\" value=\"$oid\" /></td>\n".
				"<td class=\"item2\">$order[ordersn]</td>\n".
				"<td class=\"item\">$order[tomname]</td>\n".
				"<td class=\"item\" width=\"60\">$order[totalfee]</td>\n".
				"<td class=\"item\" width=\"60\">$order[payed]</td>\n".
				"<td class=\"item\" width=\"100\">$statestr</td>\n".
				"<td class=\"item\" width=\"100\">$order[createdate]</td>\n".
				"<td class=\"item\" width=\"40\"><a href=\"?action=orders&oid=$order[oid]\">".lang('detail')."</a></td></tr>\n";
		}
		$ordercount = $db->result_one("SELECT count(*) FROM {$tblprefix}orders WHERE $wheresql");
		$multi = multi($ordercount, $atpp, $page, "?action=orders$filterstr");

		mtabheader(lang('orderslist'),'','',9);
		trcategory(array("<input class=\"checkbox\" type=\"checkbox\" name=\"chkall\" onclick=\"checkall(this.form, 'selectid', 'chkall')\">",lang('orderssncode'),lang('seller'),lang('ordersallamount'),lang('payed'),lang('orderstate'),lang('ordersdate'),lang('edit')));
		echo $strorder;
		mtabfooter();
		echo $multi;
		
		mtabheader(lang('operate_item'));
		echo "<tr class=\"txt\"><td colspan=\"2\" align=\"left\">".
//		"<input class=\"checkbox\" type=\"checkbox\" name=\"arcdeal[confirm]\" value=\"1\">&nbsp;".lang('confirmorders').'&nbsp; &nbsp; &nbsp; '.
		"<input class=\"checkbox\" type=\"checkbox\" name=\"arcdeal[cancel]\" value=\"1\">&nbsp;".lang('cancelorders').'&nbsp; &nbsp; &nbsp; '.
		"<input class=\"checkbox\" type=\"checkbox\" name=\"arcdeal[delete]\" value=\"1\">&nbsp;".lang('deleteorders').'&nbsp; &nbsp; &nbsp; '.
		"</td></tr>";
		mtabfooter('barcsedit');
	}else{
		empty($arcdeal) && empty($dealstr) && mcmessage('selectoperateitem',"?action=orders&page=$page$filterstr");
		empty($selectid) && empty($select_all) && mcmessage('selectorder',"?action=orders&page=$page$filterstr");
		!empty($arcdeal['confirm']) && !empty($arcdeal['cancel']) && mcmessage('select_both_cc',"?action=orders&page=$page$filterstr");

		foreach($selectid as $oid){
			if($order = $db->fetch_one("SELECT * FROM {$tblprefix}orders WHERE oid=$oid")){
				if(!empty($arcdeal['cancel']) && (!$order['state'] || $order['state'] == 1)){//ȡ���������������
					$order['state'] = -2;
					$db->query("UPDATE {$tblprefix}orders SET state=-2,updatedate='$timestamp' WHERE oid='$oid'");
					$query = $db->query("SELECT aid,nums FROM {$tblprefix}purchases WHERE oid='$oid'");
					while($row = $db->fetch_array($query))$db->query("UPDATE {$tblprefix}archives_sub SET storage=storage+$row[nums] WHERE aid=$row[aid] AND storage>=0");
				}
				if(!empty($arcdeal['delete']) && $order['state'] < 0){//ȡ������ɵĶ�������ɾ��
					$sql = $order['delstate'] ?
							"DELETE FROM {$tblprefix}orders WHERE mid=$memberid AND delstate=1 AND oid='$oid'" ://�Է�Ҳɾ��������ɾ��������
							"UPDATE {$tblprefix}orders SET delstate=2 WHERE oid='$oid'";//���һ�δɾ����ֻ�趨״̬;1Ϊ����
					$db->query($sql);
					$order['delstate'] && $order['state'] == -2 && $db->query("DELETE FROM {$tblprefix}purchases WHERE oid='$oid'");//ɾ�������¼
				}
			}
		}
		unset($aedit,$auser);
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
				mcmessage('operating',"?action=orders&page=$page$filterstr$transtr$parastr&dealstr=$dealstr",$pages,$npage,"<a href=\"?action=orders&page=$page$filterstr\">",'</a>');
			}
		}
		adminlog(lang('orders_admin'),lang('orders_list_admin'));
		mcmessage('ordopefin',"?action=orders&page=$page$filterstr");
	}
}else{
	$forward = empty($forward) ? M_REFERER : $forward;
	empty($oid) && mcmessage('chooseord',$forward);
	if(!$order = $db->fetch_one("SELECT * FROM {$tblprefix}orders WHERE mid=$memberid AND delstate!=2 AND oid=$oid")) mcmessage('chooseorders',$forward);
	if($order['tomid']){
		$user = new cls_userinfo();
		$user->activeuser($order['tomid'],1);
		$cfg_paymode = $user->info['paymode'];
		$cfg_ordermode = $user->info['ordermode'];
		$pays = array(
			2 => array($user->info['alipay'], $user->info['alipid'], $user->info['alikeyt']),
			3 => array($user->info['tenpay'], $user->info['tenkeyt'])
		);
	}else{
		$pays = array(
			2 => array(@$cfg_alipay, @$cfg_alipay_partnerid, @$cfg_alipay_keyt),
			3 => array(@$cfg_tenpay, @$cfg_tenpay_keyt)
		);
	}
	$pmodearr = array();
	foreach(array(0 => 'next', 1 => 'currency', 2 => 'alipay', 3 => 'tenpay') as $k => $v)($cfg_paymode & (1 << $k)) && ($k < 2 || !in_array('', $pays[$k])) && $pmodearr[$k] = lang("pay$v");
	empty($pmodearr) && mcmessage('nopaymode');

	if(submitcheck('borderpay')){//ȷ�ϸ���
		$order['state'] == 1 || (!$order['state'] && $cfg_ordermode) || mcmessage('cheordcanmod',$forward);
		empty($ordernew['paymode']) && @$ordernew['paymode'] !== '0' && mcmessage('paymodecerr',M_REFERER);
		empty($pmodearr[$ordernew['paymode']]) && mcmessage('paymodeerr',M_REFERER);

		$sqlstr = "state=-1,paymode=$ordernew[paymode]";//-1Ϊ�������״̬
		if($ordernew['paymode'] == 1){//�ֽ��ʻ�
			$curuser->info['currency0'] < $order['totalfee'] && mcmessage('pay_no_money');
			$curuser->updatecrids(array(0 => - $order['totalfee']),1,lang('log_order_pay', $order['ordersn']));
			$order['tomid'] && $user->updatecrids(array(0 => $order['totalfee']),1,lang('log_order_rev', $order['ordersn']));
			$sqlstr .= ",payed=$order[totalfee]";
			$db->query("UPDATE {$tblprefix}orders SET $sqlstr,updatedate='$timestamp' WHERE oid='$oid'");
			$query = $db->query("SELECT aid,tocid as cid,price,nums FROM {$tblprefix}purchases WHERE oid='$oid'");
			$nums = 0;
			$aedit = new cls_arcedit();
			while($row = $db->fetch_array($query)){
				$nums += $row['nums'];
				if($row['cid']){//�̼���Ʒ
				}else{//��վ��Ʒ
	//				$db->query("UPDATE {$tblprefix}archives SET orders=$row[nums],ordersum=$sum WHERE aid=$row[aid]");
					$aedit->init();
					$aedit->set_aid($row['aid']);
					$aedit->arc_nums('orders', $row['nums']);
					$aedit->arc_nums('ordersum', $row['price'] * $row['nums'], 1);
				}
			}
			$curuser->basedeal('purchase', 1, $nums, 1);
			mcmessage('orderpayfinish');
		}else{
			require_once(M_ROOT . 'paygate/pay_base.php');
			switch($ordernew['paymode']){//���ָ��ʽ
			case 2://֧����
				if(!in_array('', $pays[2])){
					$pay = new pay_base('alipay');
					$pay->account = $pays[2][0];
					$pay->partner = $pays[2][1];
					$pay->keyt = $pays[2][2];
				}
				break;
			case 3://�Ƹ�ͨ
				if(!in_array('', $pays[3])){
					$pay = new pay_base('tenpay');
					$pay->account = $pays[3][0];
					$pay->keyt = $pays[3][1];
				}
				break;
			}
			if(empty($pay)){
				mcmessage('errorpaymode');
			}else{
				$query = $db->query("SELECT subject FROM {$tblprefix}purchases p LEFT JOIN {$tblprefix}archives a ON a.aid=p.aid WHERE oid='$oid' LIMIT 0,2");
				$count = $db->num_rows($query);
				$row = $db->fetch_array($query);
				$subject = $count > 1 ? lang('and_more', $row['subject']) : $row['subject'];

				$pay->by = 'orders';
				$pay->dataok = 1;
				$pay->order_id = $order['oid'];
				$pay->status = $order['state'];
				$pay->totalfee = $order['totalfee'];
				$pay->send($order['ordersn'], $subject, '');
			}
		}
	}elseif(submitcheck('bordercancel')){//ȡ���������������
		$order['state'] && $order['state'] != 1 && mcmessage('cheordcanmod',$forward);
		$db->query("UPDATE {$tblprefix}orders SET state=-2,updatedate='$timestamp' WHERE oid='$oid'");
		$query = $db->query("SELECT aid,nums FROM {$tblprefix}purchases WHERE oid='$oid'");
		while($row = $db->fetch_array($query))$db->query("UPDATE {$tblprefix}archives_sub SET storage=storage+$row[nums] WHERE aid=$row[aid] AND storage>=0");
		mcmessage('ordersmodifyfinish',$forward);
	}elseif(submitcheck('borderinfo')){//�޸������Ϣ
		!$order['state'] || $order['state'] == 1 || mcmessage('cheordcanmod',$forward);
		$c_upload = new cls_upload;	
		$pfields = fields_order($pfields);
		$a_field = new cls_field;
		$sqlstr = "";
		foreach($pfields as $k => $field){
			$a_field->init();
			$a_field->field = $field;
			$a_field->deal('cartnew');
			if(!empty($a_field->error)){
				$c_upload->rollback();
				mcmessage($a_field->error,M_REFERER);
			}
			$sqlstr .= ($sqlstr ? ',': '').$k."='".$a_field->newvalue."'";
		}
		$c_upload->closure(1, $oid, 'orders');
		$c_upload->saveuptotal(1);
		unset($a_field,$c_upload);
		$db->query("UPDATE {$tblprefix}orders SET $sqlstr WHERE oid='$oid'");
		mcmessage('ordersmodifyfinish',$forward);
	}elseif(submitcheck('borderdelete')){
		$order['state'] < 0 || mcmessage('cheordcanmod',$forward);//ȡ������ɵĶ�������ɾ��
		$sql = $order['delstate'] ?
				"DELETE FROM {$tblprefix}orders WHERE oid='$oid'" ://�Է�Ҳɾ��������ɾ��������
				"UPDATE {$tblprefix}orders SET delstate=2 WHERE oid='$oid'";//���һ�δɾ����ֻ�趨״̬;1Ϊ����
		$db->query($sql);
		$order['delstate'] && $order['state'] == -2 && $db->query("DELETE FROM {$tblprefix}purchases WHERE oid='$oid'");//ɾ�������¼
		mcmessage('orddelfin',$forward);
	}else{
		mtabheader(lang('ordersbasedset'),'orderdetail','?action=orders&oid='.$oid.'&forward='.urlencode($forward));
		mtrbasic(lang('orderssncode'),'',$order['ordersn'],'');
		mtrbasic(lang('ordersstate'),'',$statearr[$order['state']],'');
		mtrbasic(lang('seller'),'',$order['tomname'],'');
		mtrbasic(lang('goodsfeeyuan'),'',$order['orderfee'],'');
		mtrbasic(lang('shipfeeyuan'),'',$order['shipingfee'],'');
		mtrbasic(lang('orderfeeamountyuan'),'',$order['totalfee'],'');
		mtrbasic(lang('payedcashyuan'),'',$order['payed'],'');
		mtrbasic(lang('shiping'),'',lang($order['shipingmode'] ? "shipingfee$order[shipingmode]" : 'noshiping'),'');
		mtabfooter();

		mtabheader(lang('ordersgoodslist'),'','',5);
		trcategory(array(/*lang('delete'),*/lang('goodscname'),lang('catalog'),lang('channel'),lang('price'),lang('amount')));
		$query = $db->query("SELECT c.*,a.sid,a.createdate,a.subject,a.caid,a.chid FROM {$tblprefix}purchases c LEFT JOIN {$tblprefix}archives a ON (a.aid=c.aid) WHERE oid='$oid'");
		while($item = $db->fetch_array($query)){
			$cid = $item['cid'];
			$item['arcurl'] = view_arcurl($item);
			$item['catalog'] = empty($catalogs[$item['caid']]) ? lang('nocata') : $catalogs[$item['caid']]['title'];
			$item['channel'] = $channels[$item['chid']]['cname'];
			$item['createdate'] = date("$dateformat", $item['createdate']);
			echo "<tr>".
#				"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$cid]\" value=\"$cid\">\n".
				"<td class=\"item2\"><a href=\"$item[arcurl]\" target=\"_blank\">".mhtmlspecialchars($item['subject'])."</a></td>\n".
				"<td class=\"item\">$item[catalog]</td>\n".
				"<td class=\"item\">$item[channel]</td>\n".
				"<td class=\"item\">$item[price]</td>\n".
#				"<td class=\"txtC w70\"><input type=\"text\" size=\"4\" name=\"purchasesnew[$cid][nums]\" value=\"$item[nums]\"><input type=\"hidden\" name=\"purchasesnew[$cid][oldnums]\" value=\"$item[nums]\"></td></tr>\n";
				"<td class=\"item\" width=\"70\">$item[nums]</td></tr>\n";
			}
		mtabfooter();
		if($order['state'] == 1 || (!$order['state'] && @$cfg_ordermode)){
			mtabheader(lang('paymode'));
			mtrbasic(lang('paymode'),'paymodenew',makeradio('ordernew[paymode]',$pmodearr,-1),'');
			mtabfooter();
			print('<input class="button" type="submit" name="borderpay" value="' . lang('confirm_pay') . '"/>');
		}
		echo '</form><div class="clear"></div>';
		mtabheader(lang('ordersmessageset'),'orderdetail','?action=orders&oid='.$oid.'&forward='.urlencode($forward));
		$submitstr = '';
		if($order['state'] && $order['state'] != 1){
			foreach($pfields as $k => $field)mtrbasic($field['cname'],'',!isset($order[$k]) ? '' : htmlspecialchars($order[$k]),'');
			$order['state'] < 0 ? mtabfooter('borderdelete',lang('deleteorders')) : print('</form>');
		}else{
			$a_field = new cls_field;
			foreach($pfields as $k => $field){
				$a_field->init();
				$a_field->field = $field;
				$a_field->oldvalue = !isset($order[$k]) ? '' : $order[$k];
				$a_field->trfield('cartnew');
				$submitstr .= $a_field->submitstr;
			}
			mtabfooter();
			print('<input class="button" type="submit" name="borderinfo" value="' . lang('modify') . '">');
			(!$order['state'] || $order['state'] == 1) && print('&nbsp;&nbsp;<input class="button" type="submit" name="bordercancel" value="' . lang('cancelorders') . '">');
			echo '</form>';
			check_submit_func($submitstr);
		}
	}
}
?>
