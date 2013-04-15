<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
backallow('cotype') || amessage('no_apermission');
load_cache('cotypes,channels,mtpls,rprojects,ccfields');
sys_cache('fieldwords');
include_once M_ROOT."./include/upload.cls.php";
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/fields.cls.php";

if($action=='cotypesedit') {
	if(!submitcheck('bcotypesedit') && !submitcheck('bcotypesadd')) {
		$addfieldstr = "&nbsp; &nbsp; >><a href=\"?entry=cotypes&action=ccfieldsedit\">".lang('iscustom_coclass_field').'</a>';
		tabheader(lang('cotypem_manager').$addfieldstr,'cotypesedit','?entry=cotypes&action=cotypesedit','10');
		trcategory(array(lang('id'),lang('cotype_name'),lang('order'),lang('self_reg'),lang('cnode_leaguer'),lang('mainline_leaguer'),lang('delete'),lang('detail'),lang('coclass')));
		foreach($cotypes as $k => $cotype){
			echo "<tr class=\"txt\">\n".
				"<td class=\"txtC w35\">$k</td>\n".
				"<td class=\"txtL\"><input type=\"text\" size=\"30\" maxlength=\"30\" name=\"cotypesnew[$k][cname]\" value=\"$cotype[cname]\"></td>\n".
				"<td class=\"txtC w40\"><input type=\"text\" size=\"4\" maxlength=\"4\" name=\"cotypesnew[$k][vieworder]\" value=\"$cotype[vieworder]\"></td>\n".
				"<td class=\"txtC w60\">".($cotype['self_reg'] ? 'Y' : '-')."</td>\n".
				"<td class=\"txtC w60\"><input class=\"checkbox\" type=\"checkbox\" name=\"cotypesnew[$k][sortable]\" value=\"1\"".($cotype['sortable'] ? " checked" : "")."></td>\n".
				"<td class=\"txtC w60\"><input class=\"checkbox\" type=\"checkbox\" name=\"cotypesnew[$k][mainline]\" value=\"1\"".($cotype['mainline'] ? " checked" : "")."></td>\n".
				"<td class=\"txtC w40\"><a href=\"?entry=cotypes&action=cotypesdelete&coid=$k\">".lang('delete')."</a></td>\n".
				"<td class=\"txtC w40\"><a href=\"?entry=cotypes&action=cotypedetail&coid=$k\" onclick=\"return floatwin('open_cotypesedit',this)\">".lang('setting')."</a></td>\n".
				"<td class=\"txtC w40\"><a href=\"?entry=coclass&action=coclassedit&coid=$k\" onclick=\"return floatwin('open_cotypesedit',this)\">".lang('admin')."</a></td>\n".
				"</tr>";
		}
		tabfooter('bcotypesedit',lang('modify'));

		tabheader(lang('add_cotypem'),'cotypesadd','?entry=cotypes&action=cotypesedit',2,0,1);
		trbasic(lang('cotype_name'),'cotypeadd[cname]');
		trbasic(lang('is_self_reg'),'cotypeadd[self_reg]',0,'radio');
		tabfooter('bcotypesadd',lang('add'));
		$submitstr = '';
		$submitstr .= makesubmitstr('cotypeadd[cname]',1,0,0,30);
		check_submit_func($submitstr);
		a_guide('cotypesedit');
	}elseif(submitcheck('bcotypesedit')){
		if(!empty($cotypesnew)){
			foreach($cotypesnew as $k => $cotype) {
				$cotype['vieworder'] = max(0,intval($cotype['vieworder']));
				$cotype['notblank'] = empty($cotype['notblank']) ? 0 : 1;
				$cotype['sortable'] = empty($cotype['sortable']) ? 0 : 1;
				$cotype['mainline'] = empty($cotype['sortable']) || empty($cotype['mainline']) ? 0 : 1;
				$cotype['cname'] = trim(strip_tags($cotype['cname']));
				$cotype['cname'] = $cotype['cname'] ? $cotype['cname'] : $cotypes[$k]['cname'];
				$db->query("UPDATE {$tblprefix}cotypes SET 
							cname='$cotype[cname]', 
							vieworder='$cotype[vieworder]', 
							notblank='$cotype[notblank]', 
							sortable='$cotype[sortable]',
							mainline='$cotype[mainline]' 
							WHERE coid='$k'
							");
			}
			adminlog(lang('edit_cotype_mlist'));
			updatecache('cotypes');
			amessage('cotypeeditfinish',"?entry=cotypes&action=cotypesedit");
		}
	}
	elseif(submitcheck('bcotypesadd')) {
		empty($cotypeadd['cname']) && amessage('cotypenamemiss', '?entry=cotypes&action=cotypesedit');
		$db->query("INSERT INTO {$tblprefix}cotypes SET 
			cname='$cotypeadd[cname]',
			self_reg='$cotypeadd[self_reg]'
			");
		if($coid = $db->insert_id()){
			$db->query("ALTER TABLE {$tblprefix}archives ADD ccid$coid smallint(6) unsigned NOT NULL default 0",'SILENT');
			$db->query("ALTER TABLE {$tblprefix}members ADD ccid$coid smallint(6) unsigned NOT NULL default 0",'SILENT');
			adminlog(lang('add_cotype'));
			updatecache('cotypes');
			amessage('cotypeaddfinish',"?entry=cotypes&action=cotypesedit");
		}else{
			amessage('cotypeaddfailed',"?entry=cotypes&action=cotypesedit");
		}
	}
}elseif($action == 'cotypedetail' && $coid){
	$forward = empty($forward) ? M_REFERER : $forward;
	!($cotype = $cotypes[$coid]) && amessage('choosecotype',$forward);
	if(!submitcheck('bcotypedetail')){
		tabheader(lang('cotypem_detail_edit'),'cotypedetail',"?entry=cotypes&action=cotypedetail&coid=$coid&forward=".rawurlencode($forward));
		trbasic(lang('cotype_name'),'',$cotype['cname'],'');
		trbasic(lang('cnode_leaguer_cotype'),'cotypenew[sortable]',$cotype['sortable'],'radio');
		trbasic(lang('mainline_leaguer_cotype'),'cotypenew[mainline]',$cotype['mainline'],'radio');
		$vmodearr = array('0' => lang('vmode0'),'1' => lang('vmode1'),'2' => lang('vmode2'),);
		trbasic(lang('coclassvmode'),'',makeradio('cotypenew[vmode]',$vmodearr,empty($cotype['vmode']) ? 0 : $cotype['vmode']),'');
		if(empty($cotype['self_reg'])){
			trbasic(lang('is_notblank_catas'),'cotypenew[notblank]',$cotype['notblank'],'radio');
			trbasic(lang('ctrl_permission'),'cotypenew[permission]',$cotype['permission'],'radio');
			trbasic(lang('ctrl_awardcp'),'cotypenew[awardcp]',$cotype['awardcp'],'radio');
			trbasic(lang('ctrl_taxcp'),'cotypenew[taxcp]',$cotype['taxcp'],'radio');
			trbasic(lang('ctrl_ftaxcp'),'cotypenew[ftaxcp]',$cotype['ftaxcp'],'radio');
			trbasic(lang('ctrl_sale'),'cotypenew[sale]',$cotype['sale'],'radio');
			trbasic(lang('ctrl_fsale'),'cotypenew[fsale]',$cotype['fsale'],'radio');
		}
		tabfooter('bcotypedetail');
		a_guide('cotypedetail');
	}else{
		$cotypenew['notblank'] = empty($cotypenew['notblank']) ? 0 : 1;
		$cotypenew['permission'] = empty($cotypenew['permission']) ? 0 : 1;
		$cotypenew['awardcp'] = empty($cotypenew['awardcp']) ? 0 : 1;
		$cotypenew['taxcp'] = empty($cotypenew['taxcp']) ? 0 : 1;
		$cotypenew['ftaxcp'] = empty($cotypenew['ftaxcp']) ? 0 : 1;
		$cotypenew['sale'] = empty($cotypenew['sale']) ? 0 : 1;
		$cotypenew['fsale'] = empty($cotypenew['fsale']) ? 0 : 1;
		$db->query("UPDATE {$tblprefix}cotypes SET 
			notblank='$cotypenew[notblank]',
			sortable='$cotypenew[sortable]',
			vmode='$cotypenew[vmode]',
			vmode='$cotypenew[vmode]',
			permission='$cotypenew[permission]',
			awardcp='$cotypenew[awardcp]',
			taxcp='$cotypenew[taxcp]',
			ftaxcp='$cotypenew[ftaxcp]',
			sale='$cotypenew[sale]',
			fsale='$cotypenew[fsale]',
			mainline='$cotypenew[mainline]' 
			WHERE coid='$coid'");
		adminlog(lang('det_modify_cotype'));
		updatecache('cotypes');
		amessage('cotypemsetfinish',axaction(6,$forward));
	}
}elseif($action == 'cotypesdelete' && $coid) {
	if(!isset($confirm) || $confirm != 'ok'){
		$message = lang('del_alert')."<br><br>";
		$message .= lang('confirmclick').">><a href=?entry=cotypes&action=cotypesdelete&coid=$coid&confirm=ok>".lang('delete')."</a><br>";
		$message .= lang('giveupclick').">><a href=?entry=cotypes&action=cotypesedit>".lang('goback')."</a>";
		amessage($message);
	}
	$deletefield = "ccid$coid";
	$db-> query("ALTER TABLE {$tblprefix}archives DROP $deletefield",'SILENT'); 
	$db-> query("ALTER TABLE {$tblprefix}members DROP $deletefield",'SILENT'); 
	$db->query("DELETE FROM {$tblprefix}cotypes WHERE coid='$coid'",'SILENT');
	$db->query("DELETE FROM {$tblprefix}coclass WHERE coid='$coid'",'SILENT');
	updatecache('cotypes');
	@unlink(M_ROOT."./dynamic/cache/coclasses".$coid.".cac.php");
	adminlog(lang('del_cotype'));
	amessage('cotypedelfinish',"?entry=cotypes&action=cotypesedit");
}elseif($action == 'ccfieldadd'){
	if(!submitcheck('bccfieldadd')){
		tabheader(lang('add_class_msg_field'),'ccfieldadd',"?entry=cotypes&action=ccfieldadd",2,0,1);
		$submitstr = '';
		if(empty($fieldnew['datatype'])){
			trbasic(lang('field_type'),'fieldnew[datatype]',makeoption($datatypearr),'select');
			tabfooter('bccfieldaddpre',lang('continue'));
		}else{
			list($fmode,$fnew,$fsave) = array('cn',true,false);
			include_once M_ROOT."./include/fields/$fieldnew[datatype].php";
			tabfooter('bccfieldadd',lang('add'));
		}
		check_submit_func($submitstr);
		a_guide('ccfieldadd');
	}else{
		$enamearr = $usednames['ccfields'];
		$fconfigarr = array(
			'errorurl' => '?entry=cotypes&action=ccfieldsedit',
			'enamearr' => $enamearr,
			'altertable' => $tblprefix.'coclass',
			'fieldtable' => $tblprefix.'cnfields',
			'sqlstr' => "iscc='1'",
		);
		list($fmode,$fnew,$fsave) = array('cn',true,true);
		include_once M_ROOT."./include/fields/$fieldnew[datatype].php";
		adminlog(lang('add_cotype_msg_field'));
		updatecache('ccfields');
		updatecache('usednames','ccfields');
		amessage('fieldaddfinish','?entry=cotypes&action=ccfieldsedit');
	}
}elseif($action == 'ccfieldsedit'){
	if(!submitcheck('bccfieldsedit')){
		tabheader(lang('class_msg_field_manager')."&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>><a href=\"?entry=cotypes&action=ccfieldadd\">".lang('add_field')."</a>",'ccfieldsedit','?entry=cotypes&action=ccfieldsedit','5');
		trcategory(array(lang('delete'),lang('field_name'),lang('order'),lang('field_ename'),lang('field_type'),lang('edit')));
		foreach($ccfields as $k => $ccfield) {
			fieldlist($k,$ccfield,'cc');
		}
		tabfooter('bccfieldsedit');
		a_guide('ccfieldsedit');
	}else{
		if(!empty($delete)){
			foreach($delete as $id){
				$fieldename = $ccfields[$id]['ename'];
				$db->query("ALTER TABLE {$tblprefix}coclass DROP $fieldename"); 
				$db->query("DELETE FROM {$tblprefix}cnfields WHERE iscc=1 AND ename='$id'");
				unset($ccfields[$id]);
				unset($fieldsnew[$id]);
			}
		}
		foreach($ccfields as $id => $field){
			$fieldsnew[$id]['cname'] = trim(strip_tags($fieldsnew[$id]['cname']));
			$field['cname'] = $fieldsnew[$id]['cname'] ? $fieldsnew[$id]['cname'] : $field['cname'];
			$field['vieworder'] = max(0,intval($fieldsnew[$id]['vieworder']));
			$db->query("UPDATE {$tblprefix}cnfields SET 
						vieworder='$field[vieworder]',
						cname='$field[cname]'
						WHERE iscc=1 AND ename='$id'");
		}
		adminlog(lang('edit_cotype_msg_field'));
		updatecache('ccfields');
		updatecache('usednames','ccfields');
		amessage('fieldmodifyfinish','?entry=cotypes&action=ccfieldsedit');
	}
}elseif($action == 'ccfielddetail' && $fieldename){
	!isset($ccfields[$fieldename]) && amessage('choosefield', '?entry=cotypes&action=ccfieldsedit');
	$field = $ccfields[$fieldename];
	if(!submitcheck('bccfielddetail')){
		$submitstr = '';
		tabheader(lang('field_edit')."&nbsp;&nbsp;[$field[cname]]",'ccfielddetail',"?entry=cotypes&action=ccfielddetail&fieldename=$fieldename",2,0,1);
		list($fmode,$fnew,$fsave) = array('cn',false,false);
		include_once M_ROOT."./include/fields/$field[datatype].php";
		tabfooter('bccfielddetail');
		check_submit_func($submitstr);
		a_guide('ccfielddetail');
	}else{
		$fconfigarr = array(
			'altertable' => $tblprefix.'coclass',
			'fieldtable' => $tblprefix.'cnfields',
			'wherestr' => "WHERE ename='$fieldename' AND iscc=1",
		);
		list($fmode,$fnew,$fsave) = array('cn',false,true);
		include_once M_ROOT."./include/fields/$field[datatype].php";
		adminlog(lang('det_modify_cotype_msg_field'));
		updatecache('ccfields');
		amessage('fieldmodifyfinish','?entry=cotypes&action=ccfieldsedit');
	}
} 
?>
