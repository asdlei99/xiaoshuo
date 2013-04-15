<?php
(defined('M_COM') && $enable_uc) || exit('No Permission');
/*
ֻ�ܷ��͵�����Ϣ�����Ͷ��ʧ�ܣ��������û������ܷ��������ֻ����id
*/
$page = isset($page) ? $page : 1;
$page = max(1, intval($page));
require_once M_ROOT.'./include/ucenter/config.inc.php';
require_once M_ROOT.'./uc_client/client.php';
list($uid,$username) = uc_get_user($curuser->info['mname']);
$boxs=array('newpm', 'privatepm', 'systempm', 'announcepm');
$boxl=array('noreadpm', 'memberpm', 'syspm', 'ucpm');//��ӻ������
$new = uc_pm_checknew($uid, 4);
$new['privatepm'] = $new['newprivatepm'];
$new['systempm'] = $new['newpm'] - $new['privatepm'];
$action=='pmbox' && $box = !empty($box) && in_array($box, $boxs) ? $box : ($new['newpm'] ? 'newpm' : 'privatepm');
$l = count($boxs);
$urlsarr = array('pmsend' => array(lang('sendpm'), '?action=pmsend'));
for($i = 0; $i < $l; $i++)$urlsarr[$boxs[$i]] = array(lang($boxl[$i]).($new[$boxs[$i]]?('('.$new[$boxs[$i]].')'):''), "?action=pmbox&box=$boxs[$i]&page=$page");
murl_nav($urlsarr,'pmbox'==$action ? $box : 'pmsend',6);

if($action=='pmsend'){
	if(!submitcheck('bpmsend')){//���Ϳ�
		mtabheader(lang('sendpm'),'pmsend',"?action=pmsend&box=$box&page=$page",2,0,1);
		mtrbasic(lang('pmtitle'),'pmnew[title]','','btext');
		mtrbasic(lang('pmtonames'),'pmnew[tonames]',empty($tonames) ? '' : $tonames,'btext');
		mtrbasic(lang('pmcontent'),'pmnew[content]','','btextarea');
		$submitstr = '';
//		$submitstr .= makesubmitstr('pmnew[title]',1,0,0,80);
		$submitstr .= makesubmitstr('pmnew[tonames]',1,0,0,100);
		$submitstr .= makesubmitstr('pmnew[content]',1,0,0,1000);
		$submitstr .= tr_regcode('pm');
		mtabfooter('bpmsend');
		check_submit_func($submitstr);
	}else{//���Ͷ���
		if(!regcode_pass('pm',empty($regcode) ? '' : trim($regcode))) mcmessage(lang('regcodeerror'),M_REFERER);
		$pmnew['title'] = trim($pmnew['title']);
		$pmnew['tonames'] = trim($pmnew['tonames']);
		$pmnew['content'] = trim($pmnew['content']);
		if(empty($pmnew['content']) || empty($pmnew['tonames'])){
			mcmessage(lang('pmdatamiss'),M_REFERER);
		}
		$tos=array_filter(explode(',',$pmnew['tonames']));$count=0;
		$pmnew['title'] = $pmnew['title'] ? $pmnew['title'] : ($pmnew['content'] ? $pmnew['content'] : '');
		foreach($tos as $to)if(uc_pm_send($uid,$to,$pmnew['title'],$pmnew['content'],1,0,1))$count++;
		$count ? mcmessage($count.lang('pmsendfinish'),"?action=pmbox&box=$box&page=$page") : mcmessage(lang('pmsenderr'),M_REFERER);
	}
}elseif(empty($fid)&&empty($pmid)){
	if(!submitcheck('bpmbox')){//���ռ���
			$ucpm = uc_pm_list($uid, $page, $mrowpp, 'inbox', $box, 30);
			mtabheader(lang('pmlist'),'pmsedit',"?action=pmbox&box=$box&page=$page",6);
			mtrcategory(array($box=='announcepm'?'':("<input class=\"checkbox\" type=\"checkbox\" name=\"chkall\" class=\"category\" onclick=\"checkall(this.form, '', 'chkall')\">".lang('del')),array(lang('title'),'left'),lang('senduser'),lang('state'),lang('senddate'),lang('content')));
			if($ucpm['data']){
				foreach($ucpm['data'] as $pm){
					echo "<tr title=\"".mhtmlspecialchars($pm['message'])."\">\n<td align=\"left\" width=\"40\">".($box=='announcepm'?'':"<input class=\"checkbox\" type=\"checkbox\" name=\"".($pm['msgformid']?"fids[$pm[msgformid]]\" value=\"$pm[msgform]":"pmids[$pm[pmid]]\" value=\"$pm[pmid]").'">')."</td>\n".
						"<td class=\"item2\">".mhtmlspecialchars($pm['subject'])."</td>\n".
						"<td align=\"center\" width=\"120\">".($pm['msgfromid'] ? $pm['msgfrom'] : lang('syspm'))."</td>\n".
						"<td align=\"center\" width=\"40\">".($box=='announcepm'?'-':lang($pm['new'] ? 'noread' : 'read'))."</td>\n".
						"<td align=\"center\" width=\"80\">".date($dateformat, $pm['dateline'])."</td>\n".
						"<td align=\"center\" width=\"40\"><a href=\"?action=pmbox&box=$box&page=$page&".($pm['msgfromid']?"fid=$pm[msgfromid]":"pmid=$pm[pmid]")."\">".lang('look')."</a></td></tr>\n";
				}
			}else{
				echo '<tr class="item2" height="50"><td align="center" colspan="6">'.lang('nonepm').'</td></tr>';
			}
			echo multi($ucpm['count'],$mrowpp,$page,"?action=pmbox");
			$box=='announcepm'?mtabfooter():mtabfooter('bpmbox',lang('delete'));
	}else{//ɾ��
		empty($fids) && empty($pmids) && mcmessage(lang('choosedeltem'),"?action=pmbox&box=$box&page=$page");
		is_array($fids) || $fids=array($fids);
		is_array($pmids) || $pmids=array($pmids);
		if($fids) {
			uc_pm_deleteuser($uid, $fids);
		}
		if($pmids) {
			uc_pm_delete($uid, 'inbox', $pmids);
		}
		mcmessage(lang('pm delete operate finish'),"?action=pmbox&box=$box&page=$page");
	}
}else{//�Ķ�����
	$days = array(1=>lang('today'),3=>lang('near3days'),4=>lang('thisweek'),5=>lang('all'));
	$day = isset($day) && array_key_exists($day,$days) ? $day : 3;

	$ucpm = empty($fid) ? uc_pm_view($uid, $pmid, 0, $day) : uc_pm_view($uid, '', $fid, $day);//$ucpm=uc_pm_view($uid, $pmid, 0, 3);
//	exit(var_export($ucpm));
	empty($ucpm) && mcmessage(lang('nonenewpm'));
	$fuser = '';
	foreach($ucpm as $pm)if($pm['msgfrom']!=$curuser->info['mname']){$fuser=$pm['msgfrom'];break;}

	if($fuser){
		$str='';
		foreach($days as $k => $v)$str.='&nbsp;'.($day==$k?$v:"<a href=\"?action=pmbox&box=$box&page=$page&fid=$fid&day=$k\">$v</a>");
		mtabheader(lang('fupmrecord', $fuser).$str.($fuser ? "&nbsp;&nbsp;>><a href=\"?action=pmsend&box=$box&page=$page&tonames=".rawurlencode($pm['msgfrom'])."\">".lang('reply')."</a>" : ''));
		mtabfooter();
	}

	mtabheader(lang('pmcontent'));
	$pm=end($ucpm);
	if($fuser==$pm['msgfrom']){
		array_pop($ucpm);
		$fuser ? mtrbasic(lang('senduser'),'',($pm['new']?'[<b style="color:red">new</b>]':'').$fuser,'') : mtrbasic(lang('pmtitle'),'',($pm['msgtoid'] && $pm['new']?'[<b style="color:red">new</b>]':'').($pm['subject'] ? $pm['subject'] : lang('syspm')),'');
		mtrbasic(lang('sendtime'),'',date("$dateformat $timeformat",$pm['dateline']),'');
		$fuser && mtrbasic(lang('pmtitle'),'',mhtmlspecialchars($pm['subject']),'');
		mtrbasic(lang('pmcontent'),'',mnl2br(mhtmlspecialchars($pm['message'])),'');
	}
	if(!empty($ucpm)){
		echo '<tr><td class="item2" colspan="2"><b>'.lang('historypm').'</b></td></tr>';
		foreach($ucpm as $pm){
			echo '<tr><td class="item2" colspan="2">'.($fuser==$pm['msgfrom']?(($pm['new']?'[<b style="color:red">new</b>]':'').lang('onformsay',$pm['msgfrom'],date("$dateformat $timeformat",$pm['dateline']))):lang('onyousay',date("$dateformat $timeformat",$pm['dateline']))).'</td></tr>'.
				 '<tr><td class="item2" colspan="2">'.($pm['subject'] ? '<b>'.mhtmlspecialchars($pm['subject']).'</b><br />' : '').mnl2br(mhtmlspecialchars($pm['message'])).'</td></tr>';
		}
	}
	mtabfooter();
	echo "<input class=\"button\" type=\"submit\" name=\"\" value=\"".lang('goback')."\" onclick=\"redirect('?action=pmbox&box=$box&page=$page')\">\n";
}
mcfooter();
?>
