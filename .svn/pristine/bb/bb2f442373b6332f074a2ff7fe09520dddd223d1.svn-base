<?php
!defined('M_COM') && exit('No Permission');
load_cache('currencys');
$curuser->sub_data();
//echo '<pre>';
//var_dump($curuser);
//查询用户的附属信息
$sql = "SELECT * FROM {$tblprefix}members_1 WHERE mid='{$curuser->info['mid']}'";
$userOther = $db->fetch_one($sql);
//var_dump($userOther);
//查询最近阅读记录
$sql = "SELECT * FROM {$tblprefix}newread WHERE mid='{$curuser->info['mid']}' ORDER BY readtime DESC limit 2";
$query = $db->query($sql);
$newread = $db->fetch_all($query);

//查询最近收藏
$sql = "SELECT f.*,a.* FROM {$tblprefix}favorites f LEFT JOIN {$tblprefix}archives a ON a.aid=f.aid WHERE f.mid='{$curuser->info['mid']}' ORDER BY f.aid DESC LIMIT 5";
$query = $db->query($sql);
$favInfo = $db->fetch_all($query);

?>
<style type="text/css">
<!--

-->
</style>
<div class="gr fl">
	<dl>
    	<dt>
        	<span>
    			<img src="<?php echo $userOther['photo'] !== '' ? $userOther['photo'] : '/images/adminm/none.gif'?>">
            </span>
        </dt>
 
	<dd>
		<p><span>昵称：</span><a href="/14831184" target="_blank"><?php echo $curuser->info['nicename']?></a>
		<a target="_blank" href="/adminm.php?action=utrans" class="zz">成为作者</a>
        </p>
        <p><span>用户等级：</span><?php echo $repugradestr = '<font class="cBlue">'.$repugrades[$curuser->info['rgid']]['cname'].($repugrades[$curuser->info['rgid']]['thumb'] ? '&nbsp; <img src="'.view_atmurl($repugrades[$curuser->info['rgid']]['thumb']).'" height="18">' : '').'</font>';?>
        </p>
                    
        <p><span>用户积分：</span><?php echo $curuser->info['currency1']?>分</p>
        <p><span>账户余额：</span><?php echo round($curuser->info['currency0'],2);?>元 <a href="/adminm.php?action=payonline" class="cz">立刻充值</a></p>
        <p><span>注册时间：</span><?php echo date('Y-m-d H:i', $curuser->info['regdate'])?></p>
        <p><span>最后访问时间：</span><?php echo date('Y-m-d H:i', $curuser->info['lastactive'])?></p>
	</dd>
	<div class="h_5"></div>
	<dd class="js">
			<h3>个人简介<a href="/adminm.php?action=memberinfo&nmuid=6"></a></h3>
            <p><font color="#CCCCCC"><?php echo empty($userOther['intro']) ? '介绍自己一下吧！' : $userOther['intro'];?></font></p>
	</dd>
	</dl>
</div>

<div class="tit yd fl" style="float:right;">
        	<h3 class="ico">
                <span class="l"></span>
                <span class="r"></span>
                <em class="ico-yd">&nbsp;</em>最近阅读
            <a class="gd" href="/adminm.php?action=newread">更多内容&gt;&gt;</a>
            </h3>
            
<?php 
	if (!empty($newread)) {
		foreach ($newread as $n) {
			//查询小说信息
			$xiaoshuo = $db->fetch_one("select * from xs_archives where aid=".$n['aid']);
			//查询小说的更新时间
			$sql = "select a5.* from xs_archives as a5, (select a1.aid from xs_albums as a1 LEFT JOIN xs_archives_1 as a2 ON a2.aid=a1.aid WHERE a1.pid='".$n['aid']."') as a4 WHERE a5.aid=a4.aid  ORDER BY a5.createdate DESC LIMIT 1";
			$gengxin = $db->fetch_one($sql);
			if (empty($gengxin)) $gxtime = '--'; else $gxtime = date('Y-m-d H:i', $gengxin['createdate']);

?>
	<dl>
		<dt>
			<a title="<?php echo $xiaoshuo['subject']?>" href="/archive.php?aid=<?php echo $n['aid']?>" target="_blank">
	    	<img src="<?php echo $xiaoshuo['thumb']?>"></a>	    			
        </dt>
        <dd>
        	<p>书名：<span class="bule fb"><a title="<?php echo $xiaoshuo['subject']?>" href="/archive.php?aid=<?php echo $n['aid']?>" target="_blank">
					 <?php echo $xiaoshuo['subject']?>
			</a></span></p>
            <p>作者：<span class="bule"><?php echo $xiaoshuo['author']?></span></p>
            <p>更新时间：<?php echo $gxtime;?></p>
            <p>上次阅读时间：<span class="ydsj"><?php echo date('m-d H:i', $n['readtime'])?></span></p>
	 		<p class="but1">
            <input type="button" value="阅读" onclick="javascript:window.open('/archive.php?aid=<?php echo $n['aid']?>')" class="inputbg">                  
            </p>
        </dd>
	</dl>
<?php 
		}
	}
?>         
</div>

<div class="h_10"></div>
<!-- 最近收藏 -->
<div class="tit shujia" style="text-align:left;">
	<h3 class="ico">
	<span class="l"></span><span class="r"></span>
	<em class="ico-yd">&nbsp;</em>最近收藏<a class="gd" href="/adminm.php?action=favorites">更多藏书&gt;&gt;</a></h3>
	<table>
		<thead>
			<tr class="bg2">
            	<th>类别</th>
                <th>作品名</th>
                <th>最新章节</th>
                <th>更新时间</th>
                <th>作者</th>
                <th>状态</th>
            </tr>
        </thead>
		<tbody>
<?php 
if (!empty($favInfo)) {
	foreach ($favInfo as $f) {
		//查询所属分类
		$sql = "SELECT * from xs_catalogs WHERE caid=".$f['caid'];
		$lb = $db->fetch_one($sql);
		if (!empty($lb)) {
			$lb = $lb['title'];
		} else {
			$lb = '';
		}
		//获取该小说最后更新文章信息
		$sql = "select a5.* from xs_archives as a5, (select a1.aid from xs_albums as a1 LEFT JOIN xs_archives_1 as a2 ON a2.aid=a1.aid WHERE a1.pid='".$f['aid']."') as a4 WHERE a5.aid=a4.aid  ORDER BY a5.createdate DESC LIMIT 1";
		$wz = $db->fetch_one($sql);
		if (!empty($wz)) {
			$zj = $wz['subject'];
			$dt = date('Y-m-d H:i' ,$wz['createdate']);
			$zjid = $wz['aid'];
		} else {
			$zj = '无最新章节';
			$dt = '--';
			$zjid = '';
		}

?>
	<tr class="odd_row bg2">
		<td class="lb"><a href="/index.php?caid=<?php echo $f['caid'];?>" target="_blank">[<?php echo $lb;?>]</a></td>
		<td class="zp"><a title="<?php echo $f['subject'];?>" href="/archive.php?aid=<?php echo $f['aid']?>" target="_blank"><?php echo $f['subject'];?></a></td>
		<td class="zj">
		<?php 
			if ($zjid != '') {
				echo '<a title="'.$zj.'" href="/archive.php?aid='.$zjid.'" target="_blank">'.$zj.'</a>';
			} else {
				echo '--';
			}
		?></td>
		<td class="sj"><?php echo $dt?></td>
		<td class="zz"><?php echo $f['author']?></td>
		<td class="zt"><font class="ztb"><?php if ($r['abover'] == 1) echo '完结'; else echo '<div class="zt">连载</div>';?></font></td>
	</tr>
<?php 
	}
}
?>
</tbody></table>
</div>

<?php
/**
mtabheader('个人信息');
mtrbasic(lang('membercheckstate'),'',$curuser->info['checked'] ? lang('checked') : lang('checking'),'');
mtrbasic(lang('memberregtime'),'',$curuser->info['regdate'] ? date("$dateformat   $timeformat",$curuser->info['regdate']) : '','');
mtrbasic(lang('memberregip'),'',$curuser->info['regip'] ? $curuser->info['regip'] : '-','');
mtrbasic(lang('lastlogintime'),'',$curuser->info['lastvisit'] ? date("$dateformat   $timeformat",$curuser->info['lastvisit']) : '','');
mtrbasic(lang('lastactivetime'),'',$curuser->info['lastactive'] ? date("$dateformat   $timeformat",$curuser->info['lastactive']) : '','');
mtrbasic(lang('lastloginip'),'',$curuser->info['lastip'] ? $curuser->info['lastip'] : '-','');
mtrbasic(lang('memberclicks'),'',$curuser->info['clicks'],'');
mtabfooter();
mtabheader(lang('otherstate'));
mtrbasic(lang('addarcamount1'),'',$curuser->info['archives'],'');
mtrbasic(lang('issuearcamount1'),'',$curuser->info['checks'],'');
mtrbasic(lang('membercomments1'),'',$curuser->info['comments'],'');
mtrbasic(lang('arcsubscribeamount1'),'',$curuser->info['subscribes'],'');
mtrbasic(lang('adjsubscribeamount1'),'',$curuser->info['fsubscribes'],'');
mtrbasic(lang('uploadedadjunct1'),'',$curuser->info['uptotal'],'');
mtrbasic(lang('downloadedadjunct1'),'',$curuser->info['downtotal'],'');
mtabfooter();
mtabheader(lang('membercurrency'));
mtrbasic(lang('cashaccount'),'',$curuser->info['currency0'].lang('yuan'),'');
foreach($currencys as $crid => $currency){
	mtrbasic($currency['cname'],'',$curuser->info['currency'.$crid].$currency['unit'],'');
}
mtabfooter();
mtabheader(lang('memberstate'),'','',4);
foreach($grouptypes as $gtid => $grouptype){
	$usergroups = read_cache('usergroups',$gtid);
	$curuser->info['grouptype'.$gtid.'date'] = !$curuser->info['grouptype'.$gtid.'date'] ? '-' : date('Y-m-d',$curuser->info['grouptype'.$gtid.'date']);
	echo "<tr>\n".
		"<td width=\"15%\" class=\"item1\">$grouptype[cname]</td>\n".
		"<td width=\"35%\" class=\"item2\">".(!$curuser->info['grouptype'.$gtid] ? '-' : $usergroups[$curuser->info['grouptype'.$gtid]]['cname'])."</td>\n".
		"<td width=\"15%\" class=\"item1\">".lang('enddate')."</td>\n".
		"<td width=\"35%\" class=\"item2\">".$curuser->info['grouptype'.$gtid.'date']."</td>\n".
		"</tr>";
}
mtabfooter();
//*/

?>