<?
include_once dirname(__FILE__).'/include/general.inc.php';
include_once dirname(__FILE__).'/include/common.fun.php';
include_once M_ROOT.'./include/farchive.cls.php';
include_once M_ROOT.'./include/farcedit.cls.php';
parse_str(un_virtual($_SERVER['QUERY_STRING']));
$page = empty($page) ? 1 :  max(1, intval($page));
$aid = empty($aid) ? 0 :  max(0, intval($aid));
$fid = empty($fid) ? 0 :  max(0, intval($fid));

if($aid){//����������Ϣ������ҳ��
	$arc = new cls_farchive();
	$arc->arcid($aid);
	if(!$arc->aid) message('choosemesid');
	if(!$arc->archive['checked'] && !$curuser->isadmin()) message('pointmessagenocheck');
	if(($arc->archive['startdate'] > $timestamp) || ($arc->archive['enddate'] && $arc->archive['enddate'] < $timestamp)) message('chooseavaimes');//�����Ƿ�ʧЧ��Ϣ
	if(!($tplname = $arc->catalog['arctpl'])) message('pointconpagetemp');

	if($cache1circle){
		$cachefile = htmlcac_dir('farc',date('Ym',$arc->archive['createdate']),1).cac_namepre($arc->aid,$arc->archive['createdate']).'_'.$page.'.php';
		if(is_file($cachefile) && (filemtime($cachefile) > ($timestamp - $cache1circle * 60))){
			mexit(read_htmlcac($cachefile));
		}
	}
	$_da = &$arc->archive;
	
	$_mp = array();
	$_mp['durlpre'] = $cms_abs.en_virtual('freeinfo.php?aid='.$arc->aid.'&page={$page}',1);
	$_mp['static'] = 0;
	$_mp['nowpage'] = max(1,intval($page));
	@extract($btags);
	extract($_da,EXTR_OVERWRITE);
	_aenter($_da,1);
	tpl_refresh($tplname);
	@include M_ROOT."template/$templatedir/pcache/$tplname.php";
	
	$_content = ob_get_contents();
	ob_clean();
	$cache1circle && save_htmlcac($_content,$cachefile);
	mexit($_content);
}elseif($fid){//����ҳ��ҳ��
	$addid = empty($addid) ? '' : trim($addid);//���Ӳ���,���ڶ���ҳ��
	if(empty($freeinfos[$fid])) message('definerelaisopage');

	//����������վ
	switch_cache($freeinfos[$fid]['sid']);
	$sid = $freeinfos[$fid]['sid'];
	if_siteclosed($sid);

	if(!$addid && $cache1circle && (!$listcachenum || $page <= $listcachenum)){//�����Ӳ����򲻻���
		$cachefile = htmlcac_dir('farc','',1).cac_namepre($fid).'_'.$page.'.php';
		if(is_file($cachefile) && (filemtime($cachefile) > ($timestamp - $cache1circle * 60))){
			mexit(read_htmlcac($cachefile));
		}
	}
	if(!($tplname = $freeinfos[$fid]['tplname'])) message('definereltem');
	
	$_da = array('fid' => $fid,'sid' => $sid,'addid' => $addid);
	
	$_mp = array();
	$_mp['durlpre'] = $cms_abs.en_virtual('freeinfo.php?fid='.$fid.($addid ? "&addid=$addid" : '').'&page={$page}',1);
	$_mp['static'] = 0;
	$_mp['nowpage'] = max(1,intval($page));
	$_mp['s_num'] = 0;//��̬ҳ������
	@extract($btags);
	extract($_da,EXTR_OVERWRITE);
	_aenter($_da,1);
	tpl_refresh($tplname);
	
	@include M_ROOT."template/$templatedir/pcache/$tplname.php";
	
	$_content = ob_get_contents();
	ob_clean();
	if(!$addid && $cache1circle) save_htmlcac($_content,$cachefile);
	mexit($_content);
}
mexit(lang('pageparammiss'));
?>

