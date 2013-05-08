<?php
!defined('M_COM') && exit('No Permission');
load_cache('mtconfigs,grouptypes,rprojects,acatalogs,cotypes,mchannels');
//∑÷Œˆ“≥√Ê…Ë÷√
$nmuid = empty($nmuid) ? 0 : max(0,intval($nmuid));
if($nmuid && $u_url = read_cache('murl',$nmuid)){
	$u_tplname = $u_url['tplname'];
	$u_onlyview = empty($u_url['onlyview']) ? 0 : 1;
	$u_mtitle = $u_url['mtitle'];
	$u_guide = $u_url['guide'];
	$vars = array('lists',);
	foreach($vars as $var) if(!empty($u_url['setting'][$var])) ${'u_'.$var} = explode(',',$u_url['setting'][$var]);
}
if(empty($u_tplname) || !empty($u_onlyview)){
	include_once M_ROOT."./include/upload.cls.php";
	include_once M_ROOT."./include/fields.fun.php";
	include_once M_ROOT."./include/fields.cls.php";
	$curuser->detail_data();
	$mchid = $curuser->info['mchid'];
	$mchannel = $mchannels[$mchid];
	foreach(array('ccoids','useredits') as $var) $$var = $mchannel[$var] ? explode(',',$mchannel[$var]) : array();
	$mfields = read_cache('mfields',$mchid);
	if(!submitcheck('bmemberdetail')){
		$a_field = new cls_field;
		$submitstr = '';
		$no_view = true;
		echo "<div class=\"itemtitle\"><ul class=\"tab1 tab0 bdtop\">\n";
		foreach ($subMenu_member as $k => $v) {
			$nclassstr = 'td24'.($action == $k ? ' current' : '');
			echo "<li".($nclassstr ? " class=\"$nclassstr\"" : '')."><a href=\"/adminm.php?action={$k}\"><span>{$v}</span></a></li>\n";
		}
		echo "</ul></div><div class=\"blank15h\"></div>";
	
		mtabheader(empty($u_mtitle) ? lang('baseoption') : $u_mtitle,'memberdetail',"adminm.php?action=memberinfo&nmuid=$nmuid",2,1,1);
		echo '<tr><td width="25%" class="item1"><b>’À ∫≈</b></td>
				<td class="item2">'.$curuser->info['mname'].'</td></tr>';
		
		if(empty($u_lists) || in_array('email',$u_lists)){
			mtrbasic('*'.lang('email'),'minfosnew[email]',$curuser->info['email']);
			$submitstr .= makesubmitstr('minfosnew[email]',1,'email',0,50);
		}
		if(empty($u_lists) || in_array('caid',$u_lists)){
			if(in_array('caid',$ccoids)){
				$noedit = noedit('caid');
				$catalogs = &$acatalogs;
				mtrcns('*'.lang('memberrelatecatalog').$noedit,'minfosnew[caid]',$curuser->info['caid'],-1,0,$mchid,1,lang('p_choose'));
				!$noedit && $submitstr .= makesubmitstr('minfosnew[caid]',1,0,0,0,'common');
			}
		}
		foreach($cotypes as $k => $v){
			if(empty($u_lists) || in_array("ccid$k",$u_lists)){
				if(in_array('ccid'.$k,$ccoids)){
					$noedit = noedit('ccid'.$k);
					mtrcns('*'.lang('memberrelatecoclass').'&nbsp; -&nbsp; '.$v['cname'].$noedit,"minfosnew[ccid$k]",$curuser->info["ccid$k"],-1,$k,$mchid,1,lang('p_choose'));
					!$noedit && $submitstr .= makesubmitstr("minfosnew[ccid$k]",1,0,0,0,'common');
				}
			}
		}
		if(empty($u_lists) || in_array('mtcid',$u_lists)){
			$noedit = noedit('mtcid');
			//mtrbasic(lang('spacetemplateproject').$noedit,'minfosnew[mtcid]',makeoption(mtcidsarr($mchid),$curuser->info['mtcid']),'select');
		}
		
		foreach($grouptypes as $k => $v){
			if(empty($u_lists) || in_array("grouptype$k",$u_lists)){
				if(!$v['mode'] && !in_array($mchid,explode(',',$v['mchids']))){
					$noedit = noedit("grouptype$k");
					mtrbasic(lang('usergroup').$noedit,"minfosnew[grouptype$k]",makeoption(ugidsarr($k,$mchid),$curuser->info["grouptype$k"]),'select');
				}
			}
		}
		foreach($mfields as $k => $field){
			if(empty($u_lists) || in_array($k,$u_lists)){
				if(!$field['issystem'] && !$field['isfunc'] && !$field['isadmin']){
					$a_field->init(1);
					$a_field->field = read_cache('mfield',$mchid,$k);
					$noedit = noedit($k,!$curuser->pmbypmids('field',$a_field->field['pmid']));
					$a_field->oldvalue = isset($curuser->info[$k]) ? $curuser->info[$k] : '';
					$a_field->trfield('minfosnew',$noedit);
					!$noedit && $submitstr .= $a_field->submitstr;
				}
			}
		}
		unset($a_field);
		mtabfooter('bmemberdetail');
		check_submit_func($submitstr);
		m_guide(@$u_guide);
	}else{
		if(empty($u_lists) || in_array('email',$u_lists)){
			$minfosnew['email'] = empty($minfosnew['email']) ? '' : trim($minfosnew['email']);
			if(empty($minfosnew['email']) || !isemail($minfosnew['email'])) mcmessage('mememill',M_REFERER);
			$curuser->updatefield('email',$minfosnew['email'],'main');
		}
	
		if(empty($u_lists) || in_array('caid',$u_lists)){
			if(in_array('caid',$ccoids) && !noedit('caid')){
				$curuser->updatefield('caid',empty($minfosnew['caid']) ? 0 : $minfosnew['caid'],'main');
			}
		}
		foreach($cotypes as $k => $v){
			if(empty($u_lists) || in_array("ccid$k",$u_lists)){
				if(in_array('ccid'.$k,$ccoids) && !noedit('ccid'.$k)){
					$curuser->updatefield("ccid$k",empty($minfosnew["ccid$k"]) ? 0 : $minfosnew["ccid$k"],'main');
				}
			}
		}
		if(empty($u_lists) || in_array('mtcid',$u_lists)){
			if(!noedit('mtcid')){
				$curuser->updatefield('mtcid',empty($minfosnew['mtcid']) ? 0 : $minfosnew['mtcid'],'main');
			}
		}
		foreach($grouptypes as $k => $v) {
			if(empty($u_lists) || in_array("grouptype$k",$u_lists)){
				if(!$v['mode'] && !in_array($mchid,explode(',',$v['mchids'])) && !noedit("grouptype$k")){
					$curuser->handgrouptype($k,empty($minfosnew['grouptype'.$k]) ? 0 : $minfosnew['grouptype'.$k],-1);
				}
			}
		}
	
		$c_upload = new cls_upload;	
		$mfields = fields_order($mfields);
		$a_field = new cls_field;
		foreach($mfields as $k => $field){
			if(empty($u_lists) || in_array($k,$u_lists)){
				if(!$field['issystem'] && !$field['isfunc'] && !$field['isadmin']){
					$a_field->init(1);
					$a_field->field = read_cache('mfield',$mchid,$k);
					if(noedit($k,!$curuser->pmbypmids('field',$a_field->field['pmid']))) continue;
					$a_field->oldvalue = isset($curuser->info[$k]) ? $curuser->info[$k] : '';
					$a_field->deal('minfosnew');
					if(!empty($a_field->error)){
						$c_upload->rollback();
						mcmessage($a_field->error,M_REFERER);
					}
					$curuser->updatefield($k,$a_field->newvalue,$field['tbl']);
				}
			}
		}
		unset($a_field);
		$curuser->updatedb();
		$c_upload->closure(1, $memberid, 'members');
		$c_upload->saveuptotal(1);
		mcmessage('memmesmodfin',M_REFERER);
	
	}
}else include(M_ROOT.$u_tplname);
?>
