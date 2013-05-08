<?php
define('NOROBOT', TRUE);
include_once dirname(__FILE__).'/include/general.inc.php';
include_once M_ROOT.'./include/common.fun.php';
include_once M_ROOT."./include/fields.cls.php";
load_cache('acatalogs,initmfields');
$catalogs = &$acatalogs;

//只有发送searchsubmit之后搜索文档列表才进行解析
if(!$nousersearch && !$curuser->check_allow('searchpermit')) message('beusenoseapermis');//分析搜索权限
if($search_repeat){
	if($timestamp - @$curuser->info['lastsearch'] < $search_repeat) message('searchoverquick');
	$db->query("UPDATE {$tblprefix}msession SET lastsearch='$timestamp' WHERE msid='".@$curuser->info['msid']."'",'SILENT');
}
$page = empty($page) ? 1 : max(1, intval($page));
$mchid = empty($mchid) ? 0 : max(0,intval($mchid));
if($mchid && empty($mchannels[$mchid])) $mchid =0;

//搜索资料初始化
$wherestr = "WHERE m.checked=1";
$filterstr = '';//分页链接的附加参数字串
$fromstr = "FROM {$tblprefix}members AS m LEFT JOIN {$tblprefix}members_sub AS s ON (s.mid=m.mid)";//只有区分模型才可以查找模型字段
$_da = array();

//会员组//暂时不区分模型//只取出非系统组系
foreach($grouptypes as $k => $v){
	if(!$v['issystem']){
		${'grouptype'.$k} = empty(${'grouptype'.$k}) ? 0 : max(0,intval(${'grouptype'.$k}));
		$_da['grouptype'.$k] = ${'grouptype'.$k};
		$_da['grouptype'.$k.'name'] = '';
		if(${"grouptype$k"}){
			$_da['grouptype'.$k.'name'] = $v['cname'];
			$wherestr .= " AND m.grouptype$k = '".${'grouptype'.$k}."'";
			$filterstr .= ($filterstr ? '&' : '')."grouptype$k=".${'grouptype'.$k};
		}
	}
}

//栏目关联//暂时不区分模型
$caid = empty($caid) ? 0 : max(0,intval($caid));
$_da['caid'] = $caid;
$_da['catalog'] = '';
if($caid){
	$_da['catalog'] = $catalogs[$caid]['title'];
	$tempids = array($caid);
	$tempids = son_ids($catalogs,$caid,$tempids);
	$wherestr .= " AND m.caid ".multi_str($tempids);
	$filterstr .= ($filterstr ? '&' : '')."caid=$caid";
}

//分类关联//暂时不区分模型//需要兼容类目节点页，所以要用ccid来表达不同的类系
foreach($cotypes as $k => $v){
	if(!$v['self_reg']){
		${"ccid$k"} = empty(${"ccid$k"}) ? 0 : max(0,intval(${"ccid$k"}));
		$_da["ccid$k"] = ${"ccid$k"};
		$_da['ccid'.$k.'title'] = '';
		if(${"ccid$k"}){
			$coclasses = read_cache('coclasses',$k);
			$_da['ccid'.$k.'title'] = $coclasses[${"ccid$k"}]['title'];
			$tempids = array(${"ccid$k"});
			$tempids = son_ids($coclasses,${"ccid$k"},$tempids);
			$wherestr .= " AND m.ccid$k ".multi_str($tempids);
			$filterstr .= ($filterstr ? '&' : '')."ccid$k=".${"ccid$k"};
		}
	}
}
//处理会员名称
$mname = empty($mname) ? '' : trim($mname);
$_da['mname'] = stripslashes($mname);
if($mname){
	$wherestr .= " AND m.mname LIKE '%".str_replace(array(' ','*'),'%',addcslashes($mname,'%_'))."%'";
	$filterstr .= ($filterstr ? '&' : '').'mname='.rawurlencode(stripslashes($mname));
}
//处理indays多少天以内注册
$indays = empty($indays) ? 0 : max(0,intval($indays));
$_da['indays'] = $indays;
if($indays){
	$wherestr .= " AND m.regdate>'".($timestamp - 86400 * $indays)."'";
	$filterstr .= ($filterstr ? '&' : '')."indays=$indays";
}

//处理outdays多少天以前注册
$outdays = empty($outdays) ? 0 : max(0,intval($outdays));
$_da['outdays'] = $outdays;
if($outdays){
	$wherestr .= " AND m.regdate<'".($timestamp - 86400 * $outdays)."'";
	$filterstr .= ($filterstr ? '&' : '')."outdays=$outdays";
}

if(!$mchid){//不区分模型的搜索//能否处理通用字段
	//处理mchid信息
	$_da['mchid'] = 0;
	$_da['mchannel'] = '';

	$a_field = new cls_field;
	$fields = &$initmfields;
	foreach($fields as $k => $field){
		if($field['available'] && $field['issearch']){
			$a_field->init();
			$a_field->field = $field;
			$a_field->deal_search($a_field->field['tbl'] == 'sub' ? 's.' : 'c.');
			$wherestr .= $a_field->searchstr ? (' AND '.$a_field->searchstr) : '';
			$a_field->filterstr && $filterstr .= ($filterstr ? '&' : '').$a_field->filterstr;
			if($field['issearch'] == 1 || $field['datatype'] == 'text'){
				$_da[$k] = stripslashes($$k);
			}elseif(in_array($field['datatype'],array('select','mselect'))){
				$_da[$k.'str'] = ${$k.'str'};
			}else{
				$_da[$k.'from'] = ${$k.'from'};
				$_da[$k.'to'] = ${$k.'to'};
			}
		}
	}
	unset($a_field);
}else{
	//处理mchid信息
	$mchannel = $mchannels[$mchid];
	$_da['mchid'] = $mchid;
	$_da['mchannel'] = $mchannel['cname'];
	$wherestr .= " AND m.mchid='$mchid'";
	$filterstr .= ($filterstr ? '&' : '')."mchid=".$mchid;
	$fromstr .= " LEFT JOIN {$tblprefix}members_$mchid AS c ON (c.mid=m.mid)";

	$a_field = new cls_field;
	$fields = read_cache('mfields',$mchid);
	foreach($fields as $k => $field){
		$field = read_cache('mfield',$mchid,$k);
		if($field['available'] && !$field['issystem'] && $field['issearch']){
			$a_field->init();
			$a_field->field = $field;
			$a_field->deal_search($a_field->field['tbl'] == 'sub' ? 's.' : 'c.');
			$wherestr .= $a_field->searchstr ? (' AND '.$a_field->searchstr) : '';
			$a_field->filterstr && $filterstr .= ($filterstr ? '&' : '').$a_field->filterstr;
			if($field['issearch'] == 1 || $field['datatype'] == 'text'){
				$_da[$k] = stripslashes($$k);
			}elseif(in_array($field['datatype'],array('select','mselect'))){
				$_da[$k.'str'] = ${$k.'str'};
			}else{
				$_da[$k.'from'] = ${$k.'from'};
				$_da[$k.'to'] = ${$k.'to'};
			}
		}
	}
	unset($a_field);
}
//处理排序项
$orderby = empty($orderby) ? 'regdate' : $orderby;
$_da['orderby'] = $orderby;
if($orderby != 'regdate'){
	$filterstr .= ($filterstr ? '&' : '')."orderby=$orderby";
}

//处理排序模式
$ordermode = empty($ordermode) ? 0 : 1;
$_da['ordermode'] = $ordermode;
if($ordermode){
	$filterstr .= ($filterstr ? '&' : '')."ordermode=$ordermode";
}
//排序字串
$orderstr = "ORDER BY m.$orderby ".($ordermode ? 'ASC' : 'DESC');

//汇总查询字串
$sqlstr = "$fromstr $wherestr $orderstr";

$tplname = @$sptpls['msearch'];//不区分模型的搜索模板
if($mchid && $mchannel['srhtpl']) $tplname = $mchannel['srhtpl'];
if(!$tplname) message('definereltem');

$_da['filterstr'] = $filterstr;
$_da['sqlstr'] = $sqlstr;
$_da['nowpage'] = $page;
$_da['submit'] = empty($searchsubmit) ? 0 : 1;

$_mp = array();
$_mp['durlpre'] = $cms_abs."msearch.php?searchsubmit=1".($filterstr ? "&$filterstr" : '').'&page={$page}';
$_mp['static'] = 0;
$_mp['nowpage'] = max(1,intval($page));
_aenter($_da,1);
@extract($btags);
extract($_da,EXTR_OVERWRITE);
tpl_refresh($tplname);
@include M_ROOT."template/$templatedir/pcache/$tplname.php";
mexit();
?>