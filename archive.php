<?
include_once dirname(__FILE__).'/include/general.inc.php';
include_once M_ROOT.'./include/common.fun.php';
include_once M_ROOT.'./include/archive.cls.php';

//����������Ϣ
parse_str(un_virtual($_SERVER['QUERY_STRING']));
$page = empty($page) ? 1 : max(1, intval($page));
$addno = empty($addno) ? 0 : min($arcplusnum,max(0,intval($addno)));
$addno = empty($addno) ? '' : $addno;
empty($aid) && message('choosearchive');
$aid = max(0,intval($aid));
$arc = new cls_archive();
if(!$arc->arcid($aid)) message('choosearchive');
if(!$arc->archive['checked'] && !$curuser->isadmin()) message('poinarcnoche'); 
//����������վ
switch_cache($arc->archive['sid']);
$sid = $arc->archive['sid'];
if_siteclosed($sid);


//����Ȩ����ۻ��֣����³���
$ispre = 0;//�Ƿ�����ǰ��ҳ
$pretpl = $arc->channel['pretpl'];
if(!arc_allow($arc->archive,'aread')){//����Ȩ�ޣ�����б���ҳ������뱸��ҳ��
	if(!$pretpl) message('noarchbrowspermis');
	$ispre = 1;
}

if($crids = $arc->arc_crids()){//��Ҫ�Ե�ǰ�û���ֵ
	$cridstr = '';
	foreach($crids['total'] as $k => $v) $cridstr .= ($cridstr ? ',' : '').abs($v).$currencys[$k]['unit'].$currencys[$k]['cname'];
	$commu = read_cache('commu',8);
	if(!empty($commu['setting']['autoarc'])){//���Զ���ֵ�����������ǰ��ҳ����ǰ��ҳ��������ʾ���������ӣ�ѡ���Ƿ���
		if(!$pretpl) message('������ĵ���Ҫ֧�����֣� '.$cridstr."<br><br><a href=\"subscribe.php?aid=$aid\">>>".lang('subscribe')."</a>");
		$ispre = 1;
	}else{//�Զ���ֵ,��ǰ��Ա��ֵ���������֧������
		if(!$curuser->crids_enough($crids['total'])) message(lang('subarcwantpaycur').$cridstr.lang('younosubsarchivewantenoughcur'));
		$curuser->updatecrids($crids['total'],0,lang('subscribearchive'));
		$curuser->payrecord($arc->aid,0,$cridstr,1);
		if(!empty($crids['sale'])){
			$actuser = new cls_userinfo;
			$actuser->activeuser($arc->archive['mid']);
			foreach($crids['sale'] as $k => $v) $crids['sale'][$k] = -$v;
			$actuser->updatecrids($crids['sale'],1,lang('salearchive'));
			unset($actuser);
		}
	}
}

//��ȡ����ҳ��
if(!$enablestatic && $cache1circle){
	$cachefile = htmlcac_dir($ispre ? 'pre' : 'arc',date('Ym',$arc->archive['createdate']),1).cac_namepre($arc->aid).'_'.$page.'.php';//ǰ��ҳ����ʽҳ,����ҳ�Ļ�����Ҫ���ֿ�????????????????????????
	if(is_file($cachefile) && (filemtime($cachefile) > ($timestamp - $cache1circle * 60))) mexit(read_htmlcac($cachefile));
}

//����ģ����Դ
$tplname = $ispre ? $pretpl : $arc->channel['arctpl'.$addno];
if($arc->archive['arctpl'.$addno]) $tplname = $arc->archive['arctpl'.$addno];
//var_dump($tplname);
!$tplname && message('definereltem');
$arc->detail_data();
$durlpre = $arc->urlpre($addno);
$_da = &$arc->archive;
arc_parse($_da);
$_mp = array();
$_mp['durlpre'] = $durlpre;
$_mp['static'] = 0;
$_mp['nowpage'] = max(1,intval($page));
$_mp['s_num'] = 0;//��̬ҳ������
_aenter($_da,1);
@extract($btags);
extract($_da,EXTR_OVERWRITE);
tpl_refresh($tplname);
include M_ROOT."template/$templatedir/pcache/$tplname.php";

$_content = ob_get_contents();
ob_clean();
if($enablestatic){
	$_content .= "<script language=\"javascript\" src=\"".$cms_abs."static.php?mode=arc&aid=$aid".($sid ? "&sid=$sid" : '').($addno ? "&addno=$addno" : '')."\"></script>";
}elseif($cache1circle) save_htmlcac($_content,$cachefile);
mexit($_content);

?>

