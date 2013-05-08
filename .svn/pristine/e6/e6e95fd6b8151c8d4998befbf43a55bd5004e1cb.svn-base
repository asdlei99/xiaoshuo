<?php
!defined('M_COM') && exit('No Permission');
include_once M_ROOT."./include/archive.cls.php";
$arc = new cls_archive();
function arc_static($aid=0,$addno='',$needwri=1){//可能需要多个页面同时进行
	global $db,$tblprefix,$arc,$sid,$timestamp,$cms_abs,$enablestatic,$archivecircle,$templatedir,$G,$_no_dbhalt,
	$btags,$mconfigs,$_mp,$_actid,$_midarr,$_a_vars,$_a_var,$mpnav,$mptitle,$mpstart,$mpend,$mppre,$mpnext,$mppage,$mpcount,$mpacount;
	@extract($mconfigs,EXTR_SKIP);
	$addno = !$addno ? '' : $addno;
	if($aid){
		$arc->init();
		$arc->arcid($aid);
	}
	if(empty($arc->aid)) return false;
	switch_cache($arc->archive['sid']);
	$sid = $arc->archive['sid'];
	@extract($btags);

	$tplname = $arc->channel['arctpl'.$addno];
	if($arc->archive['arctpl'.$addno]) $tplname = $arc->archive['arctpl'.$addno];
	
	if(!$enablestatic || !arc_allowstatic($arc->archive) || empty($tplname)){
		arc_un_static(0,$addno,$needwri,1);
		return false;
	}
	$arc->detail_data();
	$_da = &$arc->archive;
	$surlpre = $arc->urlpre($addno,1);
	$file_pre = arc_basedir($_da).urlformat($_da,array('addno' => $addno));//取出除page之外的文件路径
	arc_parse($_da);
	$_o_content = ob_get_contents();
	ob_clean();
	$_no_dbhalt = true;
	$pcount = 1;
	for($_pp = 1;$_pp<=$pcount;$_pp ++){
		$_mp = $G = array();
		$_mp['surlpre'] = $surlpre;
		$_mp['static'] = 1;
		$_mp['nowpage'] = $_pp;
		_aenter($_da,1);
		extract($_da,EXTR_OVERWRITE);
		tpl_refresh($tplname);
		@include M_ROOT."template/$templatedir/pcache/$tplname.php";
		$_content = ob_get_contents();
		ob_clean();
		$_content .= "<script language=\"javascript\" src=\"".$cms_abs."static.php?mode=arc&aid=$aid".($addno ? "&addno=$addno" : '').($sid ? "&sid=$sid" : '')."\"></script>";
		$arcfile = m_parseurl($file_pre,array('page' => $_pp),0);
		mmkdir($arcfile,0,1);
		str2file($_content,$arcfile);
		unset($_content);
		$pcount = @$_mp['pcount'];
	}
	echo $_o_content;
	unset($_o_content);
	$_no_dbhalt = false;
	if($needwri){
		$db->query("UPDATE {$tblprefix}archives_sub SET needstatic$addno='".($timestamp + (!$archivecircle ? 86400*365 : $archivecircle * 60))."' WHERE aid='".$arc->aid."'");
	}
	return true;
}
function arc_un_static($aid=0,$addno='',$needwri=1,$clearold=0){
	global $db,$tblprefix,$arc,$archivecircle,$timestamp;
	$addno = !$addno ? '' : $addno;
	if($aid){
		$arc->init();
		$arc->arcid($aid);
	}
	if(empty($arc->aid)) return false;

	//清除原有静态文件并生成新的初始静态文件
	$filepre = arc_basedir($arc->archive).urlformat($arc->archive,array('addno' => $addno));
	$clearold && m_unlink($filepre);
	arc_blank($arc->aid,$addno,m_parseurl($filepre,array('page' => 1)),1);//强制将初始文件写入

	if($needwri){
		$db->query("UPDATE {$tblprefix}archives_sub SET needstatic$addno='".($timestamp + (!$archivecircle ? 86400*365 : $archivecircle * 60))."' WHERE aid='".$arc->aid."'");
	}
	return true;
}
?>