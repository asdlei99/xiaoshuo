<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
if(!submitcheck('bmtagadd') && !submitcheck('bmtagsdetail') && !submitcheck('bmtagcode')){
	templatebox(lang('tagtemplate'),'mtagnew[template]',empty($mtag['template']) ? '' : $mtag['template'],10,110);
	trbasic(lang('arr_pre'),'mtagnew[setting][val]',empty($mtag['setting']['val']) ? 'v' : $mtag['setting']['val'],'text',lang('agarr_pre'));
	trbasic(lang('list_result'),'mtagnew[setting][limits]',empty($mtag['setting']['limits']) ? 10 : $mtag['setting']['limits']);
	tabfooter();

	tabheader(lang('filter0_set'));
	$matidsarr = array();
	foreach($matypes as $k => $v){
		$matidsarr[$k] = $v['cname'];
		$imatid = $k;
	}
	trbasic(lang('pointmatype'),'mtagnew[setting][matid]',makeoption($matidsarr,empty($mtag['setting']['matid']) ? '0' : $mtag['setting']['matid']),'select');
	$sourcearr = array('0' => lang('nolimitcatas'),'1' => lang('handpoint'),'2' => lang('activecatas'),'3' => lang('nearofactive'),);
	sourcemodule(lang('caid_attr')."&nbsp;&nbsp;&nbsp;<input class=\"checkbox\" type=\"checkbox\" name=\"mtagnew[setting][caidson]\" value=\"1\"".(empty($mtag['setting']['caidson']) ? "" : " checked").">".lang('include_son'),
				'mtagnew[setting][casource]',
				$sourcearr,
				empty($mtag['setting']['casource']) ? '0' : $mtag['setting']['casource'],
				'1',
				'mtagnew[setting][caids][]',
				caidsarr(),
				empty($mtag['setting']['caids']) ? array() : explode(',',$mtag['setting']['caids'])
				);

	foreach($cotypes as $k => $cotype) {
		sourcemodule(lang('colasslimit')."-$cotype[cname]"."&nbsp;&nbsp;&nbsp;<input class=\"checkbox\" type=\"checkbox\" name=\"mtagnew[setting][ccidson$k]\" value=\"1\"".(empty($mtag['setting']['ccidson'.$k]) ? "" : " checked").">".lang('include_son'),
					"mtagnew[setting][cosource$k]",
					$sourcearr,
					empty($mtag['setting']['cosource'.$k]) ? '0' : $mtag['setting']['cosource'.$k],
					'1',
					"mtagnew[setting][ccids$k][]",
					ccidsarr($k),
					empty($mtag['setting']['ccids'.$k]) ? array() : explode(',',$mtag['setting']['ccids'.$k])
					);
	}
	tabfooter();

	$orderbyarr = array(
		'' => lang('nosetting'),
		'createdate_desc' => lang('createdate_desc'),
		'createdate_asc' => lang('createdate_asc'),
		'refreshdate_desc' => lang('refreshdate_desc'),
	);
	tabheader(lang('more_filter')."&nbsp;&nbsp;&nbsp;&nbsp;<input class=\"checkbox\" type=\"checkbox\" name=\"viewdetail\" value=\"1\" onclick=\"alterview('morefilter')\">".lang('view'));
	echo "<tbody id=\"morefilter\" style=\"display: none;\">";
	trbasic(lang('order'),'mtagnew[setting][orderby]',makeoption($orderbyarr,empty($mtag['setting']['orderby']) ? '' : $mtag['setting']['orderby']),'select');
	$createurl = "&nbsp; >><a href=\"?entry=liststr&tclass=marchives_$imatid\" target=\"_blank\">".lang('create_str')."</a>";
	trbasic(lang('order_str').$createurl,'mtagnew[setting][orderstr]',empty($mtag['setting']['orderstr']) ? '' : stripslashes($mtag['setting']['orderstr']),'textarea');
	trbasic(lang('startno'),'mtagnew[setting][startno]',empty($mtag['setting']['startno']) ? '' : $mtag['setting']['startno'],'text',lang('agstartno'));
	trbasic(lang('filter_sql_str').$createurl,'mtagnew[setting][wherestr]',empty($mtag['setting']['wherestr']) ? '' : $mtag['setting']['wherestr'],'textarea');
	trbasic(lang('tagjspick'),'mtagnew[setting][js]',empty($mtag['setting']['js']) ? 0 : $mtag['setting']['js'],'radio');
	echo "</tbody>";
	tabfooter();
}else{
	if(empty($mtagnew['template'])){
		if(!submitcheck('bmtagcode')){
			amessage('input_tag_tpl',M_REFERER); 
		}else $errormsg = lang('input_tag_tpl');//生成代码出错的提示信息
	}
	$mtagnew['setting']['limits'] = empty($mtagnew['setting']['limits']) ? 10 : max(0,intval($mtagnew['setting']['limits']));
	$mtagnew['setting']['startno'] = max(0,intval($mtagnew['setting']['startno']));
	$mtagnew['setting']['orderstr'] = empty($mtagnew['setting']['orderstr']) ? '' : trim($mtagnew['setting']['orderstr']);
	$mtagnew['setting']['wherestr'] = empty($mtagnew['setting']['wherestr']) ? '' : stripslashes(trim($mtagnew['setting']['wherestr']));

	$idvars = array('caids');//数组参数的处理
	foreach($cotypes as $k => $cotype) $idvars[] = 'ccids'.$k;
	foreach($idvars as $k){
		if(empty($mtagnew['setting'][$k])){
			unset($mtagnew['setting'][$k]);
		}else $mtagnew['setting'][$k] = implode(',',$mtagnew['setting'][$k]);
	}
}
?>
