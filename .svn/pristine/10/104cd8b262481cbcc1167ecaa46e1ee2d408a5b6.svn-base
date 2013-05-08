<?php
!defined('M_COM') && exit('No Permission');
function arc_allow(&$item,$pname){//当前会员是否允许阅读或下载文档中的附件//出售或收税不在其中
	global $curuser,$catalogs,$cotypes;
	if($curuser->info['mid'] && $curuser->info['mid'] == $item['mid']) return true;
	$var = $pname == 'down' ? 'dpmid' : 'rpmid';
	if(empty($item[$var])) return true;
	$pmids = array();
	if($item[$var] == -1){
		$catalog = read_cache('catalog',$item['caid'],'',$item['sid']);
		if($catalog[$var]) $pmids[] = $catalog[$var];
		foreach($cotypes as $coid => $cotype){
			if($cotype['permission'] && !empty($item["ccid$coid"])){
				$coclass = read_cache('coclass',$coid,$item["ccid$coid"]);
				if($coclass[$var]) $pmids[] = $coclass[$var];
			}
		}
		unset($catalog,$coclass);
	}else $pmids[] = $item[$var];
	return $curuser->pmbypmids($pname,$pmids);
}
function str_arcfee(&$item,$isatm=0){
	global $cotypes,$vcps,$currencys;
	$mode = $isatm ? 'f' : '';
	$feevar = $isatm ? 'atmfee' : 'arcfee';
	$item[$feevar] = '';
	if(empty($item['aid']) || empty($item['checked'])) return;
	
	$crids = array();
	$catalog = read_cache('catalog',$item['caid'],'',$item['sid']);
	if(!empty($catalog[$mode.'taxcp']) && !empty($vcps[$mode.'tax'][$catalog[$mode.'taxcp']])){
		$cparr = explode('_',$catalog[$mode.'taxcp']);
		$crids[$cparr[0]] = $cparr[1];
	}
	foreach($cotypes as $k => $cotype){
		if(!empty($item["ccid$k"])){
			$coclass = read_cache('coclass',$k,$item["ccid$k"]);
			if(!empty($coclass[$mode.'taxcp']) && !empty($vcps[$mode.'tax'][$coclass[$mode.'taxcp']])){
				$cparr = explode('_',$coclass[$mode.'taxcp']);
				$crids[$cparr[0]] = isset($crids[$cparr[0]]) ? $crids[$cparr[0]] + $cparr[1] : $cparr[1];
			}
		}
	}
	if(!empty($item[$mode.'salecp'])){
		$cparr = explode('_',$item[$mode.'salecp']);
		$crids[$cparr[0]] = isset($crids[$cparr[0]]) ? $crids[$cparr[0]] + $cparr[1] : $cparr[1];
	}
	foreach($crids as $k =>$v) $item[$feevar] .= ($item[$feevar] ? ',' : '').$v.@$currencys[$k]['cname'];
	unset($catalog,$coclass,$cparr,$crids);
}
function calshipingfee($orderfee,$shid,$weight=0){
	global $shipings;
	$shipingfee = 0;
	if(empty($shipings[$shid])) return $shipingfee;
	extract($shipings[$shid]);
	if(!empty($freetop) && $orderfee < $freetop) return $shipingfee;
	$shipingfee = $basefee;
	$shipingfee += empty($plus1mode) ? $plus1 : $orderfee * $plus1 / 100;
	$shipingfee += empty($plus2mode) ? $plus2 : $orderfee * $plus2 / 100;
	if($base2 && $weight > $base2){
		$shipingfee += ceil(($weight - $base2) / $unit2) * $price2;
		$weight = $base2;
	}
	if($base1 && $weight > $base1){
		$shipingfee += ceil(($weight - $base1) / $unit1) * $price1;
	}
	return intval($shipingfee);
}
function arc_parse(&$item){//一个文档解析时需要分析的相关内容
	global $acatalogs,$cotypes,$channels,$subsites,$cms_abs;
	view_arcurl($item,-1);
	$item['sitename'] = empty($item['sid']) ? lang('msite') : $subsites[$item['sid']]['sitename'];
	$item['siteurl'] = view_siteurl($item['sid']);
	$item['catalog'] = $acatalogs[$item['caid']]['title'];
	$item['channel'] = @$channels[$item['chid']]['cname'];
	foreach($cotypes as $k => $cotype){
		$item['ccid'.$k.'title'] = '';
		if($item["ccid$k"]){
			$coclasses = read_cache('coclasses',$k);
			$item['ccid'.$k.'title'] = @$coclasses[$item["ccid$k"]]['title'];
		}
	}
	$item['cms_counter'] = "<script type=\"text/javascript\" src=\"".$cms_abs."counter.php?aid=".$item['aid']."&mid=".$item['mid']."\"></script>";
	fetch_txt($item);
	arr_tag2atm($item);
	foreach(array(0,1) as $k) str_arcfee($item,$k);//得到arcfee,atmfee
}
function urlformat(&$item,$source=array()){
	global $arccustomurl;
	$catalog = read_cache('catalog',$item['caid'],$item['sid']);
	$arcurl = empty($catalog['customurl']) ? (empty($arccustomurl) ? '{$y}{$m}/{$aid}/{$addno}_{$page}.html' : $arccustomurl) : $catalog['customurl'];
	$source += array('chid' => $item['chid'],'aid' => $item['aid'],'y' => date('Y',$item['createdate']),'m' => date('m',$item['createdate']),'d' => date('d',$item['createdate']),'h' => date('H',$item['createdate']),'i' => date('i',$item['createdate']),'s' => date('s',$item['createdate']),);
	return m_parseurl($arcurl,$source);
	
}
function arc_basedir(&$item){
	global $cnhtmldir,$subsites,$catalogs;
	$topid = cn_upid($item['caid'],$catalogs);
	return M_ROOT.($item['sid'] ? $subsites[$item['sid']]['dirname'].'/' : ($cnhtmldir ? $cnhtmldir.'/' : '')).$catalogs[$topid]['dirname'].'/';
}
function arc_blank($aid,$addno='',$arcfile,$force=0){//$arcfile完全服务器路径
	if($force || !is_file($arcfile)) str2file(blank_content("archive.php?aid=$aid".($addno ? "&addno=$addno" : '')),$arcfile);
}

function fetch_txt(&$item){
	$fields = read_cache('fields',$item['chid']);
	foreach($fields as $k => $v){
		if(!empty($v['istxt']) && isset($item[$k])) $item[$k] = readfromtxt($item[$k]);
	}
}
function cn_discount(&$item,$dcmode = 1){
	global $catalogs,$cotypes;
	if(empty($item['aid']) || !$dcmode) return 0;
	$dcarr = array();
	if(!empty($item['caid'])){
		$catalog = read_cache('catalog',$item['caid'],'',$item['sid']);
		!empty($catalog['discount']) && $dcarr[] = $catalog['discount'];
	}
	foreach($cotypes as $coid => $cotype){
		if(!empty($item["ccid$coid"])){
			$coclass = read_cache('coclass',$coid,$item["ccid$coid"]);
			!empty($coclass['discount']) && $dcarr[] = $coclass['discount'];
		}
	}
	$discount = caldiscount($dcarr,$dcmode);
	return $discount;
}
function caldiscount($dcarr=array(),$dcmode=1){
	$discount = 0;
	if(!$dcmode || empty($dcarr)) return $discount;
	foreach($dcarr as $v){
		if($dcmode == 1){
			$discount = max($discount,$v / 100);
		}else{
			$discount = 1 - (1 - $discount) * (1 - $v / 100);
		}
	}
	return round($discount * 100,2);
}

//获取指定一本小说的文章总字数
function xiaoshuo_zongzishu($aid) {
	global $db,$tblprefix;
	$sql = "select sum(a5.bytenum) as count from {$tblprefix}archives as a5, (select a1.aid
			from {$tblprefix}albums as a1 LEFT JOIN {$tblprefix}archives_1 as a2 ON a2.aid=a1.aid
			WHERE a1.pid='{$aid}') as a4 WHERE a5.aid=a4.aid";

	$array = $db->fetch_one($sql);
	$array['count'] = empty($array['count']) ? 0 : $array['count'];
	return $array['count'];
}
//获取指定作者的其他小说
function xiaoshuo_author_list($author) {
	global $db,$tblprefix;
	$sql = "select a1.aid,a1.`subject`,a2.caid,a2.title from {$tblprefix}archives as a1, {$tblprefix}catalogs as a2 
			where a1.caid=a2.caid AND a1.author='{$author}'";
	$query = $db->query($sql);
	$array = $db->fetch_all($query);
	return $array;
}

//查询指定小说的收藏人列表
function shoucang_user_list($aid) {
	global $db,$tblprefix;
	$sql = "SELECT m.mid,m.mname,s.nicename FROM {$tblprefix}favorites as f, {$tblprefix}members as m, {$tblprefix}members_sub as s
			WHERE f.aid='{$aid}' AND f.mid = m.mid AND f.mid=s.mid";
	$query = $db->query($sql);
	$array = $db->fetch_all($query);
	return $array;
}

//查询作者发布的公告
function zuozhe_gonggao($aid) {
	global $db,$tblprefix;
	$sql = "SELECT z.gonggao FROM {$tblprefix}archives as a , {$tblprefix}zuozhegonggao as z WHERE a.aid='{$aid}' AND a.mid=z.mid";
	$query = $db->query($sql);
	$result = $db->fetch_array($query);
	return !empty($result) ? $result['gonggao'] : '未发布公告';
}

//查询指定作者的头像和个人简介
function zuozhe_info($mid) {
	global $db, $tblprefix;
	$sql = "SELECT m1.*  FROM xs_members as m, xs_members_1 as m1 WHERE m.mid = '{$mid}' AND m.mid=m1.mid";
	$query = $db->query($sql);
	$result = $db->fetch_array($query);
	if (empty($result)) {
		$result['photo'] = '';
		$result['intro'] = '';
	}
	return $result;
}


?>