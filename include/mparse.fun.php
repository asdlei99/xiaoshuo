<?php
//进入空间页面一定需要读取空间主的会员资料
$mid = empty($mid) ? 0 : max(0,intval($mid));
if(!($_da = $db->fetch_one("SELECT m.*,s.* FROM {$tblprefix}members m LEFT JOIN {$tblprefix}members_sub s ON s.mid=m.mid WHERE m.mid='$mid'"))) message(lang('plepoimemid'));
$_da = array_merge($_da,$db->fetch_one("SELECT * FROM {$tblprefix}members_$_da[mchid] WHERE mid='$mid'"));
arr_tag2atm($_da,'m');
$_da['cms_counter'] = "<script type=\"text/javascript\" src=\"".$cms_abs."counter.php?mid=$mid\"></script>";

load_cache('mtconfigs,mcatalogs');
$uclasses = loaduclasses($mid);
$mstpls = load_mtconfig($mid,'setting');
$mcatalogs = marray_intersect_key($mcatalogs,$mstpls);//提取当前模板中的全部生效栏目

function mcn_tpl($temparr=array(),$mode='index'){//首页直接读取而不用分析
	global $mstpls;
	$tplname = @$mstpls[$temparr['mcaid']][$mode];
	return $tplname ? $tplname : '';
}
function ms_arctpl($chid,$mode='archive'){
	global $mid;
	$arctpls = load_mtconfig($mid,'arctpls');
	return @$arctpls[$mode][$chid];
}
function mcn_parsearr($temparr=array()){
	global $mcatalogs,$uclasses;
	if(empty($temparr['mid'])) return array();
	if(!empty($temparr['ucid']) && !empty($uclasses[$temparr['ucid']])){//两种属性
		$item = $uclasses[$temparr['ucid']];
		$item['indexurl'] = mcn_url($item['mcaid'],$item['ucid']);
		$item['listurl'] = mcn_url($item['mcaid'],$item['ucid'],1);
		$item['mcatalog'] = @$mcatalogs[$item['mcaid']]['title'];
		$item['uclass'] = $item['title'];
	}elseif(!empty($temparr['mcaid']) && !empty($mcatalogs[$temparr['mcaid']])){
		$item = $mcatalogs[$temparr['mcaid']];
		$item['indexurl'] = mcn_url($item['mcaid']);
		$item['listurl'] = mcn_url($item['mcaid'],0,1);
		$item['mcatalog'] = $item['title'];
		$item['uclass'] = '';
	}
	$item['mid'] = $temparr['mid'];
	return $item;
}
function arr_mnownav(&$tag){
	global $mcatalogs,$uclasses,$_midarr;
	$rets = array();
	if(!empty($_midarr['mcaid']) && ($item = @$mcatalogs[$_midarr['mcaid']])){
		$item['indexurl'] = mcn_url($item['mcaid']);
		$item['listurl'] = mcn_url($item['mcaid'],0,1);
		$item['sn_row'] = $i = empty($i) ? 1 : $i+1;
		$rets[] = $item;
	}
	if(!empty($_midarr['ucid']) && ($item = @$uclasses[$_midarr['ucid']])){
		$item['indexurl'] = mcn_url($item['mcaid'],$item['ucid']);
		$item['listurl'] = mcn_url($item['mcaid'],$item['ucid'],1);
		$item['sn_row'] = $i = empty($i) ? 1 : $i+1;
		$rets[] = $item;
	}
	unset($item);
	return $rets;
}
function mcn_url($mcaid=0,$ucid=0,$mode=0){//$mode:0为首页1为列表页
	global $mid,$cms_abs,$virtualurl;
	$url = $cms_abs.'mspace/'.($mode ? 'list.php' : '').'?mid='.$mid;
	if($mcaid){//ucid必须在有mcaid的前提下使用
		$url .= '&mcaid='.$mcaid;
		$ucid && $url .= '&ucid='.$ucid;
	}
	return en_virtual($url);
}
?>
