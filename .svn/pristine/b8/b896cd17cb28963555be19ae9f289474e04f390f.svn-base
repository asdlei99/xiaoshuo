<?php
!defined('M_COM') && exit('No Permission');
function index_static($cnstr = '',$needwri = 1){
	global $db,$tblprefix,$cms_abs,$sid,$homedefault,$enablestatic,$cnindexcircle,$hometpl,$timestamp,$templatedir,$G,$_no_dbhalt,
	$btags,$mconfigs,$_mp,$_actid,$_midarr,$_a_vars,$_a_var,$mpnav,$mptitle,$mpstart,$mpend,$mppre,$mpnext,$mppage,$mpcount,$mpacount;
	@extract($mconfigs,EXTR_SKIP);
	@extract($btags);
	$_da = array();
	if(!$cnstr){
		$tplname = !$sid ? $hometpl : $btags['hometpl'];
		if(!$enablestatic || !$tplname || !($template = load_tpl($tplname))){//子站的各种配置切换
			index_unstatic($cnstr,$needwri);
			return false;
		}
		$htmlfile = M_ROOT.($sid ? cn_htmldir($cnstr,$sid,1) : '').$homedefault;
		$_da['rss'] = $cms_abs.'rss.php'.($sid ? "?sid=$sid" : '');
	}else{
		if(!$cnode = cnodearr($cnstr,$sid)) return false;
		if(!$enablestatic || !cn_allowstatic($cnstr,$sid) || !($tplname = $cnode['indextpl'])){
			index_unstatic($cnstr,$needwri);
			return false;
		}
		$htmlfile = M_ROOT.cn_htmldir($cnstr,$sid,1).$homedefault;
		$_da = cn_parsearr($cnstr,$sid,-1,'main');
		re_cnode($_da,$cnstr,$cnode);
	}
	$_o_content = ob_get_contents();
	ob_clean();
	$_no_dbhalt = true;
	$_mp = $G = array();
	_aenter($_da,1);
	extract($_da,EXTR_OVERWRITE);
	tpl_refresh($tplname);
	@include M_ROOT."template/$templatedir/pcache/$tplname.php";
	$_content = ob_get_contents();
	ob_clean();
	$_content .= "<script language=\"javascript\" src=\"".$cms_abs."static.php?mode=cnindex".($sid ? "&sid=$sid" : '').($cnstr ? "&$cnstr" : '')."\"></script>";
	@str2file($_content,$htmlfile);
	unset($_content);

	echo $_o_content;
	unset($_o_content,$_da,$cnode);
	$_no_dbhalt = false;
	if($needwri){
		if($cnstr){
			$db->query("UPDATE {$tblprefix}cnodes SET ineedstatic='".($timestamp + (!$cnindexcircle ? 86400*365 : $cnindexcircle * 60))."' WHERE ename='$cnstr'");
		}elseif($sid){
			$db->query("UPDATE {$tblprefix}subsites SET ineedstatic='".($timestamp + (!$cnindexcircle ? 86400*365 : $cnindexcircle * 60))."' WHERE sid='$sid'");
		}else $db->query("UPDATE {$tblprefix}mconfigs SET value='".($timestamp + (!$cnindexcircle ? 86400*365 : $cnindexcircle * 60))."' WHERE varname='ineedstatic'");
	}
	return true;
}
function list_static($cnstr = '',$isbk = 0,$needwri = 1){
	global $db,$tblprefix,$cms_abs,$liststaticnum,$virtualurl,$sid,$enablestatic,$cnlistcircle,$cms_abs,$timestamp,$templatedir,$G,$_no_dbhalt,
	$btags,$mconfigs,$_mp,$_actid,$_midarr,$_a_vars,$_a_var,$mpnav,$mptitle,$mpstart,$mpend,$mppre,$mpnext,$mppage,$mpcount,$mpacount;
	@extract($mconfigs,EXTR_SKIP);
	@extract($btags);

	if(!$cnode = cnodearr($cnstr,$sid)) return false;
	if(!$enablestatic || !cn_allowstatic($cnstr,$sid) || !($tplname = $cnode[$isbk ? 'bktpl' : 'listtpl'])){
		list_unstatic($cnstr,$isbk,$needwri);
		return false;
	}
	view_cnurl($cnstr,$cnode);
	$_da = cn_parsearr($cnstr,$sid,-1,'main');
	re_cnode($_da,$cnstr,$cnode);
	$filepre = cn_htmldir($cnstr,$sid,1).($isbk ? 'bk_' : '');

	$_o_content = ob_get_contents();
	ob_clean();
	$_no_dbhalt = true;
	$pcount = 1;
	for($_pp = 1;$_pp<=$pcount;$_pp ++){
		$_mp = $G = array();
		$_mp['durlpre'] = $cms_abs.en_virtual('list.php?'.($isbk ? 'bk=1&' : '').($sid ? "sid=$sid&" : '').$cnstr.'&page={$page}',1);
		$_mp['surlpre'] = substr($cnode[$isbk ? 'bkurl' : 'listurl'],0,-6).'{$page}.html';
		$_mp['static'] = 1;
		$_mp['nowpage'] = max(1,intval($_pp));
		$_mp['s_num'] = $liststaticnum;
		
		_aenter($_da,1);
		extract($_da,EXTR_OVERWRITE);
		tpl_refresh($tplname);
		@include M_ROOT."template/$templatedir/pcache/$tplname.php";
		$_content = ob_get_contents();
		ob_clean();
		$_content .= "<script language=\"javascript\" src=\"".$cms_abs."static.php?mode=".($isbk ? 'cnbk' : 'cnlist').($sid ? "&sid=$sid" : '').($cnstr ? "&$cnstr" : '')."\"></script>";
		@str2file($_content,M_ROOT.$filepre.$_pp.'.html');
		unset($_content);
		$pcount = empty($liststaticnum) ? @$_mp['pcount'] : min(@$_mp['pcount'],$liststaticnum);
		
	}
	echo $_o_content;
	unset($_o_content,$_da,$cnode);
	$_no_dbhalt = false;
	if($needwri){
		$db->query("UPDATE {$tblprefix}cnodes SET ".($isbk ? 'bk' : 'l')."needstatic='".($timestamp + (!$cnlistcircle ? 86400*365 : $cnlistcircle * 60))."' WHERE ename='$cnstr'");
	}
	return true;
}
function index_unstatic($cnstr='',$needwri=1){
	global $db,$tblprefix,$sid,$cnindexcircle,$homedefault,$timestamp;
	if($cnstr){
		if(!($cnode = cnodearr($cnstr,$sid))) return;
		cn_blank($cnstr,'i',$sid,1);
		$needwri && $db->query("UPDATE {$tblprefix}cnodes SET ineedstatic='".($timestamp + (!$cnindexcircle ? 86400*365 : $cnindexcircle * 60))."' WHERE ename='$cnstr'");
	}elseif($sid){
		cn_blank($cnstr,'i',$sid,1);
		$needwri && $db->query("UPDATE {$tblprefix}subsites SET ineedstatic='".($timestamp + (!$cnindexcircle ? 86400*365 : $cnindexcircle * 60))."' WHERE sid='$sid'");
	}else{
		@unlink(M_ROOT.$homedefault);
		$needwri && $db->query("UPDATE {$tblprefix}mconfigs SET value='".($timestamp + (!$cnindexcircle ? 86400*365 : $cnindexcircle * 60))."' WHERE varname='ineedstatic'");
	}
	return true;
}
function list_unstatic($cnstr,$isbk = 0,$needwri=1){
	global $db,$tblprefix,$sid,$cnlistcircle,$timestamp;
	if(!($cnode = cnodearr($cnstr,$sid))) return;
	cn_blank($cnstr,$isbk ? 'bk' : 'l',$sid,1);
	$needwri && $db->query("UPDATE {$tblprefix}cnodes SET ".($isbk ? 'bk' : 'l')."needstatic='".($timestamp + (!$cnlistcircle ? 86400*365 : $cnlistcircle * 60))."' WHERE ename='$cnstr'");
	return;
}

?>