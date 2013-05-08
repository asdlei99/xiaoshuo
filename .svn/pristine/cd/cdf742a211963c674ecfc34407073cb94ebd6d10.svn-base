<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
if(!submitcheck('bmtagadd') && !submitcheck('bmtagsdetail') && !submitcheck('bmtagcode')){
	templatebox(lang('tagtemplate'),'mtagnew[template]',empty($mtag['template']) ? '' : $mtag['template'],10,110);
	trbasic(lang('arr_pre'),'mtagnew[setting][val]',empty($mtag['setting']['val']) ? 'v' : $mtag['setting']['val'],'text',lang('agarr_pre'));
	$sourcearr = array('0' => lang('nolimit_coclass')) + vcaidsarr();
	trbasic(lang('list_result'),'mtagnew[setting][limits]',empty($mtag['setting']['limits']) ? '10' : $mtag['setting']['limits']);
	trbasic(lang('vote_coclass_limited'),'mtagnew[setting][vsource]',makeoption($sourcearr,empty($mtag['setting']['vsource']) ? '0' : $mtag['setting']['vsource']),'select');
	trbasic(lang('vote_id_limited'),'mtagnew[setting][vids]',empty($mtag['setting']['vids']) ? '' : $mtag['setting']['vids']);
	trbasic(lang('tagjspick'),'mtagnew[setting][js]',empty($mtag['setting']['js']) ? 0 : $mtag['setting']['js'],'radio');
	tabfooter();
}else{
	if(empty($mtagnew['template'])){
		if(!submitcheck('bmtagcode')){
			amessage('input_tag_tpl',M_REFERER); 
		}else $errormsg = lang('input_tag_tpl');//生成代码出错的提示信息
	}
	$mtagnew['setting']['limits'] = empty($mtagnew['setting']['limits']) ? 10 : max(0,intval($mtagnew['setting']['limits']));
	$mtagnew['setting']['vids'] = empty($mtagnew['setting']['vids']) ? '' : trim($mtagnew['setting']['vids']);
	if($mtagnew['setting']['vids']){
		$vids = array_filter(explode(',',$mtagnew['setting']['vids']));
		$mtagnew['setting']['vids'] = empty($vids) ? '' : implode(',',$vids);
	}
}
?>
