<?php
!defined('M_COM') && exit('No Permission');
load_cache('mcatalogs,commus,mcommus,mtconfigs');
empty($cuid) && $cuid = 0;
$urlsarr = array();
$cuidsarr = array(0 => lang('archive'));
foreach($commus as $k => $v) if(in_array($v['cclass'],array('favorite','comment','answer','reply','purchase','offer',))) $cuidsarr[$k] = $v['cname'];
foreach($mcommus as $k => $v) if(in_array($v['cclass'],array('friend','flink','comment','reply','favorite',))) $cuidsarr[-$k] = $v['cname'].'*';
if(empty($deal)){
	foreach($cuidsarr as $k => $v) $urlsarr[$k] = array($cuidsarr[$k],"?action=uclasses&cuid=$k$param_suffix");
	murl_nav($urlsarr,$cuid);
	if(!submitcheck('buclassesadd') && !submitcheck('buclassesedit')){
		mtabheader(lang('uclassmanager'),'uclassesedit',"adminm.php?action=uclasses&cuid=$cuid",'6');
		mtrcategory(array(lang('del'),array(lang('coclasscname'),'left'),lang('order'),lang('belongspacecatalog'),lang('edit')));
		$query = $db->query("SELECT * FROM {$tblprefix}uclasses WHERE cuid=$cuid AND mid='$memberid' ORDER BY vieworder,mcaid,ucid");
		while($item = $db->fetch_array($query)) {
			$mcatalogstr = empty($mcatalogs[$item['mcaid']]) ? '-' : $mcatalogs[$item['mcaid']]['title'].'&nbsp; <font class="gray">'.$mcatalogs[$item['mcaid']]['remark'].'</font>';
			echo "<tr>\n".
				"<td class=\"item\" width=\"40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$item[ucid]]\" value=\"$item[ucid]\"></td>\n".
				"<td class=\"item2\"><input type=\"text\" size=\"30\" maxlength=\"30\" name=\"uclassesnew[$item[ucid]][title]\" value=\"$item[title]\"></td>\n".
				"<td class=\"item pl5px\" width=\"34\"><input type=\"text\" size=\"4\" maxlength=\"3\" name=\"uclassesnew[$item[ucid]][vieworder]\" value=\"$item[vieworder]\"></td>\n".
				"<td class=\"item\">$mcatalogstr</td>\n".
				"<td class=\"item\" width=\"40\"><a href=\"?action=uclasses&deal=uclassdetail&ucid=$item[ucid]\" onclick=\"return floatwin('open_uclasses',this)\">".lang('edit')."</a></td>\n".
				"</tr>\n";
		}
		mtabfooter('buclassesedit',lang('modify'));
		
		$mstpls = load_mtconfig($memberid,'setting');
		mtabheader(lang('addusercoclass'),'uclassesadd',"adminm.php?action=uclasses&cuid=$cuid",2,0,1);
		mtrbasic(lang('coclasscname'),'uclassadd[title]');
		trhidden('uclassadd[cuid]',$cuid);
		mtrbasic(lang('belongspacecatalog'),'uclassadd[mcaid]',makeoption(array('0' => lang('nosetting')) + mcaidsarr(1,1)),'select');
		mtabfooter('buclassesadd',lang('add'));
		$submitstr = '';
		$submitstr .= makesubmitstr('uclassadd[title]',1,0,0,$uclasslength);
		check_submit_func($submitstr);
	}elseif(submitcheck('buclassesadd')){
		$uclassadd['title'] = trim(strip_tags($uclassadd['title']));
		!$uclassadd['title'] && mcmessage('inputuclasscname','adminm.php?action=uclasses');
		$uclassadd['title'] = cutstr($uclassadd['title'],$uclasslength,'');
		$uclasses = loaduclasses($memberid);
		if($maxuclassnum && count($uclasses) > $maxuclassnum) mcmessage('uclassoverlimit',"adminm.php?action=uclasses&cuid=$cuid");
		//分析所在的栏目中的数量是否超出了限制
		if($uclassadd['mcaid']){
			if(@!$mcatalogs[$uclassadd['mcaid']]['maxucid']) mcmessage('pccau',"adminm.php?action=uclasses&cuid=$cuid");
			$num = 0;
			foreach($uclasses as $k => $v) if(@$v['mcaid'] == $uclassadd['mcaid']) $num ++;
			if($num >= $mcatalogs[$uclassadd['mcaid']]['maxucid']) mcmessage('pcuaol',"adminm.php?action=uclasses&cuid=$cuid");
		}
		$db->query("INSERT INTO {$tblprefix}uclasses SET 
					title='$uclassadd[title]', 
					mcaid='$uclassadd[mcaid]', 
					cuid='$uclassadd[cuid]', 
					mid='$memberid'");
		mcmessage('addcoclassfinish',"adminm.php?action=uclasses&cuid=$cuid");
	}elseif(submitcheck('buclassesedit')){
		if(isset($delete) && is_array($delete)){
			foreach($delete as $k){
				$db->query("DELETE FROM {$tblprefix}uclasses WHERE ucid=$k");
				$db->query("UPDATE {$tblprefix}archives SET ucid='0' WHERE mid=$memberid AND ucid=$k");
				unset($uclassesnew[$k]);
			}
		}
		foreach($uclassesnew as $k => $uclassnew){
			$uclassnew['vieworder'] = intval($uclassnew['vieworder']);
			$uclassnew['title'] = trim(strip_tags($uclassnew['title']));
			if($uclassnew['title']){
				$uclassnew['title'] = cutstr($uclassnew['title'],$uclasslength,'');
				$db->query("UPDATE {$tblprefix}uclasses SET 
							title='$uclassnew[title]', 
							vieworder='$uclassnew[vieworder]' 
							WHERE ucid='$k'");
			}
		}
		mcmessage('editcoclassfinish',"adminm.php?action=uclasses&cuid=$cuid");
	}

}elseif($deal == 'uclassdetail' && !empty($ucid)){
	if(!($uclass = $db->fetch_one("SELECT * FROM {$tblprefix}uclasses WHERE ucid='$ucid' AND mid='$memberid'"))) mcmessage('chooseyouruclass','adminm.php?action=uclasses');
	if(!submitcheck('buclassdetail')){
		$mstpls = load_mtconfig($memberid,'setting');
		mtabheader(lang('edituclass'),'uclassdetail',"adminm.php?action=uclasses&deal=uclassdetail&ucid=$ucid",2,0,1);
		mtrbasic(lang('uclasscname'),'uclassnew[title]',$uclass['title']);
		mtrbasic(lang('uclasstype'),'uclassnew[cuid]',makeoption($cuidsarr,$uclass['cuid']),'select');
		mtrbasic(lang('belongspacecatalog'),'uclassnew[mcaid]',makeoption(array('0' => lang('nosetting')) + mcaidsarr(1,1),$uclass['mcaid']),'select');
		mtabfooter('buclassdetail');
		$submitstr = '';
		$submitstr .= makesubmitstr('uclassnew[title]',1,0,0,$uclasslength);
		check_submit_func($submitstr);
	
	}else{
		$uclassnew['title'] = trim(strip_tags($uclassnew['title']));
		!$uclassnew['title'] && mcmessage('inputuclasscname',M_REFERER);
		$uclassnew['title'] = cutstr($uclassnew['title'],$uclasslength,'');
		$db->query("UPDATE {$tblprefix}uclasses SET 
					title='$uclassnew[title]', 
					mcaid='$uclassnew[mcaid]', 
					cuid='$uclassnew[cuid]'
					WHERE ucid='$ucid'");
		mcmessage('editcoclassfinish','adminm.php?action=uclasses');
	}

}
?>
