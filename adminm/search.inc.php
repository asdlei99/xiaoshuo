<?php
!defined('M_COM') && exit('No Permission');
include_once M_ROOT."./include/fields.cls.php";
include_once M_ROOT."./include/fields.fun.php";
load_cache('acatalogs,channels,cotypes,initfields');
$catalogs = &$acatalogs;
!$curuser->check_allow('searchpermit') && mcmessage('usernosearchpermi');
$page = empty($page) ? 1 : max(1, intval($page));
$search_max && $page = min($page,@ceil($search_max / $mrowpp));
$chid = empty($chid) ? 0 : max(0,intval($chid));
if($chid && empty($channels[$chid])) $chid =0;

//�������ϳ�ʼ��
$wherestr = "WHERE a.checked=1";
$filterstr = '';//��ҳ���ӵĸ��Ӳ����ִ�
$fromstr = "FROM {$tblprefix}archives AS a";//ֻ������ģ�Ͳſ��Բ���ģ���ֶ�
$item = array();


//��Ŀ����
$caid = empty($caid) ? 0 : max(0,intval($caid));
$item['caid'] = $caid;
$item['catalog'] = '';
if($caid){
	$item['catalog'] = $catalogs[$caid]['title'];
	$tempids = array($caid);
	$tempids = son_ids($catalogs,$caid,$tempids);
	$wherestr .= " AND a.caid ".multi_str($tempids);
	$filterstr .= ($filterstr ? '&' : '')."caid=$caid";
}

//��������
foreach($cotypes as $k => $v){
	${"ccid$k"} = empty(${"ccid$k"}) ? 0 : max(0,intval(${"ccid$k"}));
	$item["ccid$k"] = ${"ccid$k"};
	$item['ccid'.$k.'title'] = '';
	if(${"ccid$k"}){
		$coclasses = read_cache('coclasses',$k);
		$item['ccid'.$k.'title'] = $coclasses[${"ccid$k"}]['title'];
		$tempids = array(${"ccid$k"});
		$tempids = son_ids($coclasses,${"ccid$k"},$tempids);
		if(empty($cotype['self_reg'])){
			$wherestr .= " AND a.ccid$k ".multi_str($tempids);
		}else{
			$tempstr = self_sqlstr($k,$tempids,'a.');
			$tempstr && $wherestr .= ' AND '.$tempstr;
		} 
		$filterstr .= ($filterstr ? '&' : '')."ccid$k=".${"ccid$k"};
	}
}

//����indays������������ӵ�
$indays = empty($indays) ? 0 : max(0,intval($indays));
$item['indays'] = $indays;
if($indays){
	$wherestr .= " AND a.createdate>'".($timestamp - 86400 * $indays)."'";
	$filterstr .= ($filterstr ? '&' : '')."indays=$indays";
}

//����outdays��������ǰ��ӵ�
$outdays = empty($outdays) ? 0 : max(0,intval($outdays));
$item['outdays'] = $outdays;
if($outdays){
	$wherestr .= " AND a.createdate<'".($timestamp - 86400 * $outdays)."'";
	$filterstr .= ($filterstr ? '&' : '')."outdays=$outdays";
}

//������Ԥ����
$searchword = empty($searchword) ? '' : cutstr(trim($searchword),50,'');
$item['searchword'] = $searchword;
if($searchword){
	$filterstr .= ($filterstr ? '&' : '').'searchword='.rawurlencode(stripslashes($searchword));
}
//Ԥ��������ģʽ������subject���ؼ���keywords������fulltxt����Աmname
$searchmode = empty($searchmode) ? 'subject' : trim($searchmode);
if(!in_array($searchmode,array('subject','keywords','fulltxt','mname'))) $searchmode = 'subject';

if(!$chid){
	//����chid��Ϣ
	$item['chid'] = 0;
	$item['channel'] = '';
	if($searchmode == 'fulltxt') $searchmode = 'subject';//������ģ��ʱ������ȫ������
	$a_field = new cls_field;
	$fields = &$initfields;
	foreach($fields as $k => $field){
		if($field['available'] && $field['issearch']){
			$a_field->init(1);
			$a_field->field = $field;
			$a_field->deal_search($a_field->field['tbl'] == 'main' ? "a." : "c.");
			$wherestr .= $a_field->searchstr ? (' AND '.$a_field->searchstr) : '';
			$a_field->filterstr && $filterstr .= ($filterstr ? '&' : '').$a_field->filterstr;
			if($field['issearch'] == 1 || $field['datatype'] == 'text'){
				$item[$k] = stripslashes($$k);
			}elseif(in_array($field['datatype'],array('select','mselect'))){
				$item[$k.'str'] = ${$k.'str'};
			}else{
				$item[$k.'from'] = ${$k.'from'};
				$item[$k.'to'] = ${$k.'to'};
			}
		}
	}
	unset($a_field);
}else{
	//����chid��Ϣ
	$channel = read_cache('channel',$chid);
	$item['chid'] = $chid;
	$item['channel'] = $channel['cname'];
	$wherestr .= " AND a.chid='$chid'";
	$filterstr .= ($filterstr ? '&' : '')."chid=".$chid;
	$fromstr .= " LEFT JOIN {$tblprefix}archives_$chid AS c ON (c.aid=a.aid)";

	$a_field = new cls_field;
	$fields = read_cache('fields',$chid);
	if($searchmode == 'fulltxt'){//����ȫ������
		if($channel['fulltxt'] && isset($fields[$channel['fulltxt']])) $fulltxt = $channel['fulltxt'];//��ģ�͵�ȫ�������ֶ�
		if(!empty($fulltxt)){
			$searchword && $wherestr .= ' AND '.($fields[$fulltxt]['tbl'] == 'main' ? 'a' : 'c').".$fulltxt LIKE '%".str_replace(array(' ','*'),'%',addcslashes($searchword, '%_'))."%'";
		}else{//���ȫ�������ֶ�û�ж��壬�򷵻�Ϊ��������
			$searchmode = 'subject';
		}
	}
	foreach($fields as $k => $field){
		if($field['available'] && $field['issearch']){
			$a_field->init(1);
			$a_field->field = read_cache('field',$chid,$k);
			$a_field->deal_search($a_field->field['tbl'] == 'main' ? "a." : "c.");
			$wherestr .= $a_field->searchstr ? (' AND '.$a_field->searchstr) : '';
			$a_field->filterstr && $filterstr .= ($filterstr ? '&' : '').$a_field->filterstr;
			if($field['issearch'] == 1 || $field['datatype'] == 'text'){
				$item[$k] = stripslashes($$k);
			}elseif(in_array($field['datatype'],array('select','mselect'))){
				$item[$k.'str'] = ${$k.'str'};
			}else{
				$item[$k.'from'] = ${$k.'from'};
				$item[$k.'to'] = ${$k.'to'};
			}
		}
	}
	unset($a_field);
}

//���մ���searchmode,��������ĳЩ���ھ������������Է������������
$item['searchmode'] = $searchmode;
if($searchmode != 'subject'){
	$filterstr .= ($filterstr ? '&' : '')."searchmode=$searchmode";
}
if($searchword){//����ȫ�����µĲ�ѯ�ִ�����
	$searchmode != 'fulltxt' && $wherestr .= " AND a.$searchmode LIKE '%".str_replace(array(' ','*'),'%',addcslashes($searchword, '%_'))."%'";
}

//����������
$orderby = empty($orderby) ? 'createdate' : $orderby;
$item['orderby'] = $orderby;
if($orderby != 'createdate'){
	$filterstr .= ($filterstr ? '&' : '')."orderby=$orderby";
}

//��������ģʽ
$ordermode = empty($ordermode) ? 0 : 1;
$item['ordermode'] = $ordermode;
if($ordermode){
	$filterstr .= ($filterstr ? '&' : '')."ordermode=$ordermode";
}
//�����ִ�
$orderstr = "ORDER BY a.$orderby ".($ordermode ? 'ASC' : 'DESC');

//���ܲ�ѯ�ִ�
$sqlstr = "$fromstr $wherestr $orderstr";

//ҳ�沿��
//ѡ��ͬ��ģ�ͽ�������
$chidsarr = array('0' => lang('allchannel')) + chidsarr();
mtabheader_e();
echo "<tr align=\"center\">\n";
foreach($chidsarr as $k => $v) echo "<td class=\"item".($chid == $k ? 5 : '')."\">".($chid == $k ? "<b>$v</b>" : "<a href=\"?action=search&chid=$k\">$v</a>")."</td>\n";
echo "</tr>\n";
mtabfooter();

$searchmodearr = array('subject' => lang('title'),'keywords' => lang('keyword'),'mname' => lang('member'),'fulltxt' => lang('fulltxt'));
$caidsarr = array('0' => lang('allcatalog')) + caidsarr();
$orderbyarr = array(
	'createdate' => lang('addtime'),
	'clicks' => lang('clicks'),
	'comments' => lang('comments'),
);
mtabheader(($chid ? $channels[$chid]['cname'] : lang('allarchive')).'&nbsp;&nbsp;'.lang('searchsetting'),'search',"adminm.php?action=search&chid=$chid");
mtrbasic(lang('searchmode'),'',makeradio('searchmode',$searchmodearr,$searchmode),'');
mtrbasic(lang('searchkeyword'),'searchword',$searchword);
mtrbasic(lang('belongcatalog'),'caid',makeoption($caidsarr,$caid),'select');
$omodestr = "&nbsp;&nbsp;<input class=\"checkbox\" type=\"checkbox\" name=\"ordermode\" value=\"1\"".(empty($ordermode) ? '' : ' checked').">".lang('asc');
mtrbasic(lang('ordertype').$omodestr,'orderby',makeoption($orderbyarr,$orderby),'select');
foreach($cotypes as $coid => $cotype){
	if(!$chid || !$cotype['chids'] || !in_array($chid,explode(',',$cotype['chids']))){
		$ccidsarr = array('0' => lang('nolimit'));
		$ccidsarr = $ccidsarr + ccidsarr($coid);	
		mtrbasic("$cotype[cname]","ccid$coid",makeoption($ccidsarr,${"ccid$coid"}),'select');
	}
}
if($chid){
	$a_field = new cls_field;
	$fields = read_cache('fields',$chid);
	foreach($fields as $k => $field){
		if($field['available'] && $field['issearch']){
			$a_field->init(1);
			$a_field->field = read_cache('field',$chid,$k);
			$a_field->trsearch();
		}
	}
	unset($a_field);
}else{//������ģ��ʱʹ��ͨ���ֶ��еĿ�����ѡ��
	$a_field = new cls_field;
	$fields = &$initfields;
	foreach($fields as $k => $field){
		if($field['available'] && $field['issearch']){
			$a_field->init(1);
			$a_field->field = $field;
			$a_field->trsearch();
		}
	}
	unset($a_field);

}
mtrbasic(lang('indays'),'indays',$indays);
mtrbasic(lang('outdays'),'outdays',$outdays);
mtabfooter('searchsubmit',lang('search'));

if(submitcheck('searchsubmit')){
	if($search_repeat){
		empty($m_cookie['08cms_search_time']) ? msetcookie('08cms_search_time','1',$search_repeat) : mcmessage('searchoverquick');
	}

	$pagetmp = $page;
	do{
		$query = $db->query("SELECT a.* $fromstr $wherestr $orderstr LIMIT ".(($pagetmp - 1) * $mrowpp).",$mrowpp");
		$pagetmp--;
	}while(!$db->num_rows($query) && $pagetmp);
	$itemarchive = '';
	$no = $pagetmp * $mrowpp;
	while($archive = $db->fetch_array($query)){
		$no ++;
		$archive['arcurl'] = view_arcurl($archive);
		$archive['subject'] = "<a href=\"$archive[arcurl]\" target=\"_blank\">".mhtmlspecialchars($archive['subject'])."</a>";
		$archive['catalog'] = $catalogs[$archive['caid']]['title'];
		$archive['createdate'] = date("$dateformat $timeformat", $archive['createdate']);
		$itemarchive .= "<tr><td class=\"item\" width=\"40\">$no</td>\n".
			"<td class=\"item2\">$archive[subject]</td>\n".
			"<td align=\"center\" class=\"item\">$archive[catalog]</td>\n".
			"<td align=\"center\" class=\"item\">$archive[mname]</td>\n".
			"<td align=\"center\" class=\"item\" width=\"110\">$archive[createdate]</td></tr>\n";
	}
	$archivecount = $db->result_one("SELECT count(*) $fromstr $wherestr");
	$search_max && $archivecount = min($archivecount,$search_max);
	$multi = multi($archivecount,$mrowpp,$page,"adminm.php?action=search&chid=$chid&$filterstr&searchsubmit=1");

	mtabheader(lang('searchresultlist'),'','',9);
	mtrcategory(array(lang('sn'),lang('title'),lang('catalog'),lang('member'),lang('addtime')));
	echo $itemarchive;
	mtabfooter();
	echo $multi;
}
?>