<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
if(!submitcheck('bmtagadd') && !submitcheck('bmtagsdetail') && !submitcheck('bmtagcode')){
	templatebox(lang('tagtemplate'),'mtagnew[template]',empty($mtag['template']) ? '' : $mtag['template'],10,110);
	trbasic(lang('arr_pre'),'mtagnew[setting][val]',empty($mtag['setting']['val']) ? 'v' : $mtag['setting']['val'],'text',lang('agarr_pre'));
	$usourcearr = array('0' => lang('browse_user'),'1' => lang('active_user'));
	trbasic(lang('user_source'),'mtagnew[setting][usource]',makeoption($usourcearr,isset($mtag['setting']['usource']) ? $mtag['setting']['usource'] : '0'),'select');
	trbasic(lang('view_ch_field'),'mtagnew[setting][detail]',empty($mtag['setting']['detail']) ? 0 : $mtag['setting']['detail'],'radio');
	trbasic(lang('tagjspick'),'mtagnew[setting][js]',empty($mtag['setting']['js']) ? 0 : $mtag['setting']['js'],'radio');
	tabfooter();
}else{
	if(empty($mtagnew['template'])){
		if(!submitcheck('bmtagcode')){
			amessage('input_tag_tpl',M_REFERER); 
		}else $errormsg = lang('input_tag_tpl');//生成代码出错的提示信息
	}
}
?>
