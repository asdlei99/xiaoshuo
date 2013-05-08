<?php
include_once dirname(__FILE__).'/include/general.inc.php';
include_once M_ROOT.'./include/common.fun.php';
include_once M_ROOT.'./include/parse.fun.php';
if(empty($vid) || !($vote = $db->fetch_one("SELECT * FROM {$tblprefix}votes WHERE vid='$vid' AND checked=1 AND (enddate=0 OR enddate>$timestamp)"))) message('choosevoteitem');
if($action == 'vote'){
	empty($vopids) && message('choosevoteoption');
	if($vote['enddate'] && $vote['enddate'] < $timestamp) message('invalidvoteitem',M_REFERER);
	if($vote['onlyuser'] && !$memberid) message('nousernooperatepermis',M_REFERER);
	if($vote['norepeat'] || $vote['timelimit']){
		if(empty($m_cookie['voted_'.$vid.'_timelimit'])){
			msetcookie('voted_'.$vid.'_timelimit','1',$vote['norepeat'] ? 365 * 24 * 3600 : $vote['timelimit'] * 60);
		}else message($vote['norepeat'] ? 'norepeatoper' : 'overquick',M_REFERER);
	}
	foreach($vopids as $vopid) $db->query("UPDATE {$tblprefix}voptions SET votenum=votenum+1 WHERE vopid='$vopid'");
	//将总票数写入投票数据库
	$counts = $db->result_one("SELECT SUM(votenum) FROM {$tblprefix}voptions WHERE vid='$vid'");
	$db->query("UPDATE {$tblprefix}votes SET totalnum='$counts' WHERE vid='$vid'");
	message('votesucceed',M_REFERER);
}elseif($action == 'view'){
	$temparr = array('vid' => $vid);
	mexit(template('vote',$temparr));
}
?>