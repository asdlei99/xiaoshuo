<?php
//////////////////////////CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC//////////////////////////////////////
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
backallow('cnode') || amessage('no_apermission');
load_cache('cotypes');
load_cache('catalogs,mtpls,cnconfigs,',$sid);
include_once M_ROOT."./include/cnode.fun.php";
include_once M_ROOT."./include/cparse.fun.php";
include_once M_ROOT."./include/parse/general.php";
$url_type = 'cnode';include 'urlsarr.inc.php';

if($action == 'cnconfigs'){
	if(!submitcheck('bcnconfigsave')){
		url_nav(lang('cnodeadmin'),$urlsarr,'cnconfigs');

		tabheader(lang('node_step2'),'cnconfigsedit',"?entry=cnodes&action=cnconfigs$param_suffix");
		foreach($cnconfigs as $cncid => $cnconfig){
			echo "<tr><td><input class=\"checkbox\" type=\"checkbox\" name=\"delete[".$cncid."]\" value=\"".$cncid."\">".lang('del').
				"<td class=\"txtL\"><input type=\"text\" size=\"50\" name=\"cname_$cncid\" value=\"$cnconfig[cname]\"></td></tr>";
			$num = $cnprow;
			$lv = 0;
			foreach($cnconfig['idsarr'] as $k => $ids){
				$itemstr = '';
				$lv ++;
				$trcls = $lv % 2 ? 2 : 1;
				if($k == 'ca'){
					$i = 0;
					foreach($catalogs as $caid => $catalog){
						$i ++;
						$itemstr .= "<input class=\"checkbox\" type=\"checkbox\" name=\"idsarrs_".$cncid."_".$k."[]\" value=\"$caid\"".(in_array($caid,$ids) ? " checked" : "").">".
									$catalog['title']."<font class=\"gray\">&nbsp;$catalog[level]</font>".(!($i % $num) ? "<br>" : "&nbsp;&nbsp;");
					}
					echo "<tr><td width=\"15%\" class=\"txtR borderright\"><b>".lang('catalog')."</b><br><input class=\"checkbox\" type=\"checkbox\" name=\"chkall".$cncid."_".$k."\" onclick=\"checkall(this.form,'idsarrs_".$cncid."_".$k."','chkall".$cncid."_".$k."')\">".lang('selectall')."</td>".
						"<td class=\"txtL\">".$itemstr."</td></tr>\n";
				}
				elseif(isset($cotypes[$k])){
					$i = 0;
					$coclasses = read_cache('coclasses',$k);
					foreach($coclasses as $ccid => $coclass){
						$i ++;
						$itemstr .= "<input class=\"checkbox\" type=\"checkbox\" name=\"idsarrs_".$cncid."_".$k."[]\" value=\"$ccid\"".(in_array($ccid,$ids) ? " checked" : "").">".
									$coclass['title']."<font class=\"gray\">&nbsp;$coclass[level]</font>".(!($i % $num) ? "<br>" : "&nbsp;&nbsp;");
					}
					echo "<tr><td width=\"15%\" class=\"txtR borderright\"><b>".$cotypes[$k]['cname']."</b><br><input class=\"checkbox\" type=\"checkbox\" name=\"chkall".$cncid."_".$k."\" onclick=\"checkall(this.form,'idsarrs_".$cncid."_".$k."','chkall".$cncid."_".$k."')\">".lang('selectall')."</td>".
						"<td class=\"txtL\">".$itemstr."</td></tr>\n";
				}
			}
		}
		tabfooter('bcnconfigsave',lang('save_config'));
		a_guide('cnconfigs');

	}else{
		foreach($cnconfigs as $cncid => $cnconfig){
			if(isset($delete[$cncid])){
				$db->query("DELETE FROM {$tblprefix}cnconfigs WHERE cncid=$cncid");
			}
			else{
				$cname = trim(${'cname_'.$cncid});
				$idsarr = array();
				foreach($cnconfig['idsarr'] as $k => $v){
					$idsarr[$k] = isset(${'idsarrs_'.$cncid.'_'.$k}) ? ${'idsarrs_'.$cncid.'_'.$k} : array();
				}
				$idsarr = addslashes(serialize($idsarr));
				$db->query("UPDATE {$tblprefix}cnconfigs SET cname='$cname',idsarr='$idsarr' WHERE cncid=$cncid");
			}
		}	
		updatecache('cnconfigs','',$sid);
		adminlog(lang('edit_catas_cmlist'));
		amessage('ccconfigsavefinish',"?entry=cnodes&action=cnodesupdate$param_suffix");
	}
}
elseif($action == 'cnconfigsadd'){
	if(!submitcheck('bcnconfigsadd')){
		url_nav(lang('cnodeadmin'),$urlsarr,'cnconfigsadd');
		$mainlinearr = array('ca' => lang('catalog'));
		foreach($cotypes as $coid => $cotype){
			if($cotype['sortable'] && $cotype['mainline']){
				$mainlinearr[$coid] = $cotype['cname'];
			}
		}
		tabheader(lang('node_step1'),'cnconfigsadd',"?entry=cnodes&action=cnconfigsadd$param_suffix");
		trbasic(lang('catas_cdescription'),'cname','','btext');
		trbasic(lang('mainline_cotype'),'mainline',makeoption($mainlinearr),'select',lang('agmainline'));
		trbasic("<input class=\"checkbox\" type=\"checkbox\" name=\"cnactor[ca]\" value=\"1\">".lang('catalog'),'',"<input type=\"text\" size=\"5\" name=\"cnorder[ca]\" value=\"\">",'',lang('agcncorder'));
		foreach($cotypes as $coid => $cotype){
			if($cotype['sortable']){
				trbasic("<input class=\"checkbox\" type=\"checkbox\" name=\"cnactor[$coid]\" value=\"1\">".$cotype['cname'],'',"<input type=\"text\" size=\"5\" name=\"cnorder[$coid]\" value=\"\">",'',lang('agcncorder'));
			}
		}
		tabfooter('bcnconfigsadd',lang('add'));
		a_guide('cnconfigs');
	
	}else{
		$cname = trim($cname);
		$mainline = !isset($mainline) ? 'ca' : $mainline;
		$idsarr = array($mainline => array());
		foreach($cnorder as $k => $v) $cnorder[$k] = max(0,intval($v));
		asort($cnorder);
		foreach($cnorder as $k => $v){
			if(!isset($idsarr[$k]) && isset($cnactor[$k])) $idsarr[$k] = array();
		}
		$idsarr = addslashes(serialize($idsarr));
		$db->query("INSERT INTO {$tblprefix}cnconfigs SET cname='$cname',idsarr='$idsarr',sid='$sid'");
		adminlog(lang('add_catas_configs'));
		updatecache('cnconfigs','',$sid);
		amessage('cconfigsaddfinish',"?entry=cnodes&action=cnconfigs$param_suffix");
	}
}elseif($action == 'cnodesupdate'){
	if(!submitcheck('bcnodesupdate')){
		url_nav(lang('cnodeadmin'),$urlsarr,'cnodesupdate');
		$modearr = array(0 => lang('cnode_all'),1 => lang('cnode_cnc'),2 => lang('cnode_top'));
		tabheader(lang('node_step3'),'cnodesupdate',"?entry=cnodes&action=cnodesupdate$param_suffix",3);
		trcategory(array(lang('id'),lang('config_name'),lang('catas_configs')));
		foreach($cnconfigs as $k => $v){
			$configstr = '';
			foreach($v['idsarr'] as $k1 => $v1) $configstr .= ($configstr ? '&nbsp; =>&nbsp; ' : '').($k1 == 'ca' ? lang('catalog') : @$cotypes[$k1]['cname']);
			echo "<tr class=\"txt\">".
				"<td class=\"txtC w30\">$k</td>\n".
				"<td class=\"txt\">$v[cname]</td>\n".
				"<td class=\"txtL\">$configstr</td>\n".
				"</tr>\n";
		
		}
		tabfooter('bcnodesupdate',lang('update'));
		echo "</form>\n";
		a_guide('cnconfigs');


	}else{
		$db->query("UPDATE {$tblprefix}cnodes SET inconfig=0  WHERE sid='$sid' AND cnlevel !=1");
		cnodesfromcnc($cnconfigs);
		updatecache('cnodes','',$sid);
		adminlog(lang('update_catas_cnode'));
		amessage('ccnodeupdatefinish', "?entry=cnodes&action=cnodescommon&ism=1$param_suffix");
	}
}elseif($action == 'scnodesupdate'){//基本节点更新
	url_nav(lang('cnodeadmin'),$urlsarr,'scnodesupdate');
	if(!isset($confirm) || $confirm != 'ok') {
		$message = lang('scnode_update')."<br><br>";
		$message .= lang('confirmclick').">><a href=?entry=cnodes&action=scnodesupdate&confirm=ok$param_suffix>".lang('update')."</a><br>";
		$message .= lang('giveupclick').">><a href=?entry=cnodes&action=cnodescommon$param_suffix>".lang('goback')."</a>";
		amessage($message);
	}
	$db->query("UPDATE {$tblprefix}cnodes SET inconfig=0  WHERE sid='$sid' AND cnlevel='1'");
	foreach($catalogs as $k => $v){
		$v = read_cache('catalog',$k,'',$sid);
		$cnstr = "caid=$k";
		if($cnid = $db->result_one("SELECT cnid FROM {$tblprefix}cnodes WHERE sid=$sid AND ename='$cnstr'")){
			$db->query("UPDATE {$tblprefix}cnodes SET inconfig='1' WHERE cnid='$cnid' AND sid='$sid'");
		}else{
			$db->query("INSERT INTO {$tblprefix}cnodes SET 
			ename='$cnstr', 
			sid='$sid', 
			inconfig='1',
			mainline='ca',
			caid='$k',
			cnlevel='1',
			indextpl='$v[indextpl]',listtpl='$v[listtpl]',bktpl='$v[bktpl]',
			ineedstatic='$timestamp',lneedstatic='$timestamp',bkneedstatic='$timestamp'");
			if($cnid = $db->insert_id()){
				updatecache('cnode',$cnid,$sid);
				cn_blank($cnstr,'i,l,bk',$sid,1);//静态模式下生成静态链接
			}
		}
	}
	foreach($cotypes as $coid => $cotype){
		if($cotype['mainline']){
			$coclasses = read_cache('coclasses',$coid);
			foreach($coclasses as $k => $v){
				$cnstr = "ccid$coid=$k";
				if($cnid = $db->result_one("SELECT cnid FROM {$tblprefix}cnodes WHERE sid=$sid AND ename='$cnstr'")){
					$db->query("UPDATE {$tblprefix}cnodes SET inconfig='1' WHERE cnid='$cnid' AND sid='$sid'");
				}else{
					$db->query("INSERT INTO {$tblprefix}cnodes SET 
					ename='$cnstr', 
					sid='$sid', 
					inconfig='1',
					mainline='$coid',
					caid='',
					cnlevel='1',
					ineedstatic='$timestamp',lneedstatic='$timestamp',bkneedstatic='$timestamp'");
					if($cnid = $db->insert_id()){
						updatecache('cnode',$cnid,$sid);
						cn_blank($cnstr,'i,l,bk',$sid,1);//静态模式下生成静态链接
					}
				}
			}
		}
	}
	updatecache('cnodes',1,$sid);
	amessage('scnodeupdatefinish', "?entry=cnodes&action=cnodescommon$param_suffix");
}
elseif($action == 'cnodescommon'){//ism表示交叉节点
	$ism = empty($ism) ? 0 : 1;
	$ismstr = !$ism ? '' : '&ism=1';
	$page = !empty($page) ? max(1, intval($page)) : 1;
	submitcheck('bfilter') && $page = 1;
	$viewdetail = empty($viewdetail) ? 0 : $viewdetail;
	$caid = !isset($caid)? '0' : $caid;
	$mainline = !isset($mainline)? '0' : $mainline;
	$cnlevel = !isset($cnlevel) ? '0' : $cnlevel;
	$inconfig = !isset($inconfig)? '-1' : $inconfig;
	$wheresql = "sid=$sid";
	$wheresql .= $ism ? ' AND cnlevel>1' : ' AND cnlevel=1';
	$mainline && $wheresql .= " AND mainline='$mainline'";
	$cnlevel && $wheresql .= " AND cnlevel='$cnlevel'";
	if(!empty($caid)){
		$caids = array($caid);
		$tempids = array();
		$tempids = son_ids($catalogs,$caid,$tempids);
		$caids = array_merge($caids,$tempids);
		$wheresql .= " AND caid ".multi_str($caids);
	}
	$inconfig != '-1' && $wheresql .= " AND inconfig='$inconfig'";
	$filterstr = '';
	foreach(array('viewdetail','caid','mainline','cnlevel','inconfig') as $k){
		$filterstr .= "&$k=".urlencode($$k);
	}

	foreach($cotypes as $coid => $cotype){
		if($cotype['sortable']){
			${"ccid$coid"} = isset(${"ccid$coid"}) ? ${"ccid$coid"} : 0;
			if(!empty(${"ccid$coid"})){
				$filterstr .= "&ccid$coid=".${"ccid$coid"};
				$wheresql .= " AND ename REGEXP 'ccid$coid=".${"ccid$coid"}."(&|$)'";
			}
		}
	}

	$wheresql = $wheresql ? ("WHERE ".$wheresql) : "";

	if(!submitcheck('bcnodescommon')){
		url_nav(lang('cnodeadmin'),$urlsarr,($ism ? '' : 's').'cnodescommon');

		tabheader(lang('filter_cnode').viewcheck('viewdetail',$viewdetail,'tbodyfilter').'&nbsp; &nbsp; '.strbutton('bfilter','filter0'),'cnodescommon',"?entry=cnodes&action=cnodescommon$ismstr$param_suffix&page=$page");
		echo "<tbody id=\"tbodyfilter\" style=\"display: ".(empty($viewdetail) ? 'none' : '')."\">";

		$mainlinearr = array('0' => lang('nolimit'),'ca' => lang('catalog'));
		foreach($cotypes as $coid => $cotype){
			($cotype['sortable'] && $cotype['mainline']) && $mainlinearr[$coid] = $cotype['cname'];
		}
		trbasic(lang('mainline'),'',makeradio('mainline',$mainlinearr,$mainline),'');

		$caidsarr = array('0' => lang('nolimit')) + caidsarr();
		trbasic(lang('catalog_attr'),'caid',makeoption($caidsarr,$caid),'select');

		foreach($cotypes as $coid => $cotype){
			if($cotype['sortable']){
				$ccidsarr = array('0' => lang('nolimit'));
				$ccidsarr = $ccidsarr + ccidsarr($coid);	
				trbasic("$cotype[cname]","ccid$coid",makeoption($ccidsarr,${"ccid$coid"}),'select');
			}
		}

		$inconfigarr = array('-1' => lang('nolimit'),'0' => lang('outconfig_cnode'),'1' => lang('inconfig_cnode'),);
		trbasic(lang('is_outconfig_cnode'),'',makeradio('inconfig',$inconfigarr,$inconfig),'');
		
		if($ism){
			$cnlevelarr = array('0'=>lang('nolimit'),'2'=>lang('acrossleve2'),'3'=>lang('acrossleve3'),'4'=>lang('acrossleve4'));
			trbasic(lang('cnode_levelnum'),'',makeradio('cnlevel',$cnlevelarr,$cnlevel),'');
		}
		echo "</tbody>";
		tabfooter();

		$pagetmp = $page;

		do{
			$query = $db->query("SELECT * FROM {$tblprefix}cnodes $wheresql ORDER BY cnid ASC LIMIT ".(($pagetmp - 1) * $atpp).",$atpp");
			$pagetmp--;
		} while(!$db->num_rows($query) && $pagetmp);
		$itemcnode = '';
		while($cnode = $db->fetch_array($query)) {
			$cnode['catalog'] = empty($cnode['caid']) ? '-' : $catalogs[$cnode['caid']]['title'];
			$cnode['inconfig'] = $cnode['inconfig'] ? '-' : lang('outconfig');
			view_cnurl($cnode['ename'],$cnode);
			$cnode['cname'] = cnode_cname($cnode['ename']);
			$itemcnode .= "<tr class=\"txt\"><td class=\"txtC\"><input class=\"checkbox\" type=\"checkbox\" name=\"selectid[$cnode[cnid]]\" value=\"$cnode[cnid]\">\n".
				"<td class=\"txtL\">$cnode[cname]</td>\n".
				"<td class=\"txtC\">".(empty($cnode['alias']) ? '-' : $cnode['alias'])."</td>\n".
				"<td class=\"txtC\">$cnode[inconfig]</td>\n".
				"<td class=\"txtC\">$cnode[catalog]</td>\n".
				"<td class=\"txtC\"><a href=\"$cnode[indexurl]\" target=\"_blank\">".lang('index')."</a>&nbsp; <a href=\"$cnode[listurl]\" target=\"_blank\">".lang('list_page0')."</a>&nbsp; <a href=\"$cnode[bkurl]\" target=\"_blank\">".lang('bklist')."</a></td>\n".
				"<td class=\"txtC\">".(!empty($mtpls[$cnode['indextpl']]) ? $mtpls[$cnode['indextpl']]['cname'] : $cnode['indextpl'])."</td>\n".
				"<td class=\"txtC\">".(!empty($mtpls[$cnode['listtpl']]) ? $mtpls[$cnode['listtpl']]['cname'] : $cnode['listtpl'])."</td>\n".
				"<td class=\"txtC\">".(!empty($mtpls[$cnode['bktpl']]) ? $mtpls[$cnode['bktpl']]['cname'] : $cnode['bktpl'])."</td>\n".
				"<td class=\"txtC\"><a href=\"?entry=cnodes&action=cnodedetail&cnid=$cnode[cnid]$param_suffix\" onclick=\"return floatwin('open_cnodedetail',this)\">".lang('edit')."</a></td></tr>\n";
		}
		$cnodecount = $db->result_one("SELECT count(*) FROM {$tblprefix}cnodes $wheresql");
		$multi = multi($cnodecount, $atpp, $page, "?entry=cnodes&action=cnodescommon$ismstr$param_suffix$filterstr");

		tabheader(lang('catas_cnode_list')."&nbsp;&nbsp;&nbsp;&nbsp;<input class=\"checkbox\" type=\"checkbox\" name=\"select_all\" value=\"1\">&nbsp;".lang('selectallpage'),'','',12);
		trcategory(array("<input class=\"checkbox\" type=\"checkbox\" name=\"chkall\" onclick=\"checkall(this.form, 'selectid', 'chkall')\">",lang('cnode_name'),lang('cnode_alias'),lang('outconfig'),lang('catalog_attr'),lang('look'),lang('index_tpl'),lang('list_tpl'),lang('bklist_tpl'),lang('detail')));
		echo $itemcnode;
		tabfooter();
		echo $multi;

		tabheader(lang('operate_item'));
		trbasic("<input class=\"checkbox\" type=\"checkbox\" name=\"cndeal[delete]\" value=\"1\">&nbsp;".lang('del_cnode'),'','','');
		trbasic("<input class=\"checkbox\" type=\"checkbox\" name=\"cndeal[indextpl]\" value=\"1\">&nbsp;".lang('cnode_index_tpl'),'cnindextpl',makeoption(array('' => lang('noset')) + mtplsarr('cindex')),'select');
		trbasic("<input class=\"checkbox\" type=\"checkbox\" name=\"cndeal[listtpl]\" value=\"1\">&nbsp;".lang('cnode_list_tpl'),'cnlisttpl',makeoption(array('' => lang('noset')) + mtplsarr('list')),'select');
		trbasic("<input class=\"checkbox\" type=\"checkbox\" name=\"cndeal[bktpl]\" value=\"1\">&nbsp;".lang('cnode_bklist_tpl'),'cnbktpl',makeoption(array('' => lang('noset')) + mtplsarr('list')),'select');
		tabfooter('bcnodescommon');
		a_guide('cnodesedit');
	}
	else{
		if(empty($cndeal) && empty($dealstr)){
			amessage('selectoperateitem',"?entry=cnodes&action=cnodescommon$ismstr$param_suffix&page=$page$filterstr");
		}
		if(empty($selectid) && empty($select_all)){
			amessage('selectcnode',"?entry=cnodes&action=cnodescommon$ismstr$param_suffix&page=$page$filterstr");
		}
		if(!empty($select_all)){
			if(empty($dealstr)){//第一页通过表单传送
				$dealstr = implode(',',array_keys(array_filter($cndeal)));
			}else{//通过url传送的参数
				$cndeal = array();
				foreach(array_filter(explode(',',$dealstr)) as $k){
					$cndeal[$k] = 1;
				}
			}

			$parastr = "";
			foreach(array('cnindextpl','cnlisttpl','cnbktpl') as $k){
				$parastr .= "&$k=".$$k;
			}
			
			$selectid = $cnstrarr = array();
			$npage = empty($npage) ? 1 : $npage;
			if(empty($pages)){
				$archivecount = $db->result_one("SELECT count(*) FROM {$tblprefix}cnodes $wheresql");
				$pages = @ceil($archivecount / $atpp);
			}
			if($npage <= $pages){
				$fromstr = empty($fromid) ? "" : "cnid>$fromid";
				$nwheresql = !$wheresql ? ($fromstr ? "WHERE $fromstr" : "") : ($wheresql.($fromstr ? " AND " : "").$fromstr);
				$query = $db->query("SELECT cnid,ename FROM {$tblprefix}cnodes $nwheresql ORDER BY cnid ASC LIMIT 0,$atpp");
				while($item = $db->fetch_array($query)) $selectid[] = $item['cnid'];
			}
			if(empty($selectid)) amessage('selectcnode',"?entry=cnodes&action=cnodescommon$ismstr$param_suffix&page=$page$filterstr");

		}

		if(!empty($cndeal['delete'])){
			$query = $db->query("SELECT ename FROM {$tblprefix}cnodes WHERE cnid ".multi_str($selectid));
			while($item = $db->fetch_array($query)) $cnstrarr[] = $item['ename'];
			foreach($cnstrarr as $cnstr){
				$dirstr = cn_htmldir($cnstr,$sid);
				@unlink(M_ROOT.$dirstr.$homedefault);
				m_unlink(M_ROOT.$dirstr.'{$page}.html');
				m_unlink(M_ROOT.$dirstr.'bk_{$page}.html');
				@rmdir(M_ROOT.$dirstr);//内部不为空则不能删除
				del_cnode($cnstr,$sid);
			}
			$db->query("DELETE FROM {$tblprefix}cnodes WHERE cnid ".multi_str($selectid), 'UNBUFFERED');
		}else{
			if(!empty($cndeal['indextpl'])) $db->query("UPDATE {$tblprefix}cnodes SET indextpl='".$cnindextpl."' WHERE cnid ".multi_str($selectid));
			if(!empty($cndeal['listtpl'])) $db->query("UPDATE {$tblprefix}cnodes SET listtpl='".$cnlisttpl."' WHERE cnid ".multi_str($selectid));
			if(!empty($cndeal['bktpl'])) $db->query("UPDATE {$tblprefix}cnodes SET bktpl='".$cnbktpl."' WHERE cnid ".multi_str($selectid));
			foreach($selectid as $id) updatecache('cnode',$id,$sid);
		}
		updatecache('cnodes','',$sid);
		if(!empty($select_all)){
			$npage ++;
			if($npage <= $pages){
				$fromid = max($selectid);
				$transtr = '';
				$transtr .= "&select_all=1";
				$transtr .= "&pages=$pages";
				$transtr .= "&npage=$npage";
				$transtr .= "&bcnodescommon=1";
				$transtr .= "&fromid=$fromid";
				amessage('operating',"?entry=cnodes&action=cnodescommon$ismstr$param_suffix&page=$page$filterstr$transtr$parastr&dealstr=$dealstr",$pages,$npage,"<a href=\"?entry=cnodes&action=cnodescommon$ismstr$param_suffix&page=$page$filterstr\">",'</a>');
			}
		}
		adminlog(lang('cnode_admin_operate'),lang('cnode_list_admin'));
		amessage('cnodeoperatefinish',"?entry=cnodes&action=cnodescommon$ismstr&page=$page$param_suffix$filterstr");
	
	}
}elseif($action = 'cnodedetail' && $cnid){
	$forward = empty($forward) ? M_REFERER : $forward;
	$cnode = $db->fetch_one("SELECT * FROM {$tblprefix}cnodes WHERE cnid=$cnid");
	if(!submitcheck('bcnodedetail')){
		tabheader(lang('cnode_detail_set'),'cnodedetail',"?entry=cnodes&action=cnodedetail$param_suffix&cnid=$cnid&forward=".urlencode($forward));
		trbasic(lang('cnode_name'),'',cnode_cname($cnode['ename']),'');
		trbasic(lang('cnode_alias'),'cnodenew[alias]',$cnode['alias']);
		trbasic(lang('cnode_url'),'cnodenew[appurl]',$cnode['appurl'],'btext',lang('agappurl'));
		trbasic(lang('index_tpl'),'cnodenew[indextpl]',makeoption(array('' => lang('noset')) + mtplsarr('cindex'),$cnode['indextpl']),'select');
		trbasic(lang('list_tpl'),'cnodenew[listtpl]',makeoption(array('' => lang('noset')) + mtplsarr('list'),$cnode['listtpl']),'select');
		trbasic(lang('bklist_tpl'),'cnodenew[bktpl]',makeoption(array('' => lang('noset')) + mtplsarr('list'),$cnode['bktpl']),'select');
		tabfooter('bcnodedetail');
		a_guide('cnodedetail');
	}
	else{
		$cnodenew['alias'] = trim($cnodenew['alias']);
		$cnodenew['appurl'] = trim($cnodenew['appurl']);
		$db->query("UPDATE {$tblprefix}cnodes SET
			alias='$cnodenew[alias]',
			appurl='$cnodenew[appurl]',
			indextpl='$cnodenew[indextpl]', 
			listtpl='$cnodenew[listtpl]',
			bktpl='$cnodenew[bktpl]'
			WHERE cnid='$cnid'");
		adminlog(lang('detail_catas_cnode'));
		updatecache('cnodes','',$sid);
		amessage('cnodesetfinish',axaction(6,$forward));
	}
}

function save_cnode($cnstr,$cncid){
	global $sid,$timestamp,$db,$tblprefix;
	parse_str($cnstr,$idsarr);
	$cnode = array('caid' => 0,'cnlevel' => count($idsarr),'mainline' => '');
	$i = 0;
	foreach($idsarr as $k => $v){
		!$i && $cnode['mainline'] = $k == 'caid' ? 'ca' : str_replace('ccid','',$k);
		$k == 'caid' && $cnode['caid'] = $v;
		$i ++;
	}
	unset($idsarr);
	if($cnid = $db->result_one("SELECT cnid FROM {$tblprefix}cnodes WHERE sid=$sid AND ename='$cnstr'")){
		$db->query("UPDATE {$tblprefix}cnodes SET inconfig='1' WHERE cnid='$cnid' AND sid='$sid'");
		return;
	}
	$db->query("INSERT INTO {$tblprefix}cnodes SET 
		ename='$cnstr', 
		sid='$sid', 
		inconfig='1',
		cncids='|$cncid|',
		mainline='$cnode[mainline]',
		caid='$cnode[caid]',
		cnlevel='$cnode[cnlevel]',
		ineedstatic='$timestamp',
		lneedstatic='$timestamp',
		bkneedstatic='$timestamp'
		");
	if($cnid = $db->insert_id()){
		cn_blank($cnstr,'i,l,bk',$sid,1);//静态模式下生成静态链接
		//直接写入单个节点的缓存
		$cnode['sid'] = $sid;
		$cnode['alias'] = $cnode['appurl'] = $cnode['indexurl'] = $cnode['listurl'] = $cnode['bkurl'] = $cnode['indextpl'] = $cnode['listtpl'] = $cnode['bktpl'] = '';
		$cnode['ename'] = $cnstr;
		$cnode['ineedstatic'] = $cnode['lneedstatic'] = $cnode['bkneedstatic'] = $timestamp;
		cnode2file($cnode,$cnstr,$sid);//根据数组写入单个节点缓存
	}
	unset($cnode);
	return;
}


?>
