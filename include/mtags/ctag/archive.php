<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
if(!submitcheck('bmtagadd') && !submitcheck('bmtagsdetail') && !submitcheck('bmtagcode')){
	templatebox(lang('tagtemplate'),'mtagnew[template]',empty($mtag['template']) ? '' : $mtag['template'],10,110);
	trbasic(lang('arr_pre'),'mtagnew[setting][val]',empty($mtag['setting']['val']) ? 'v' : $mtag['setting']['val'],'text',lang('agarr_pre'));
	$albumarr = array('0' => lang('not_direct_album'));
	foreach($channels as $k => $v){
		if($v['isalbum']) $albumarr[$k] = $v['cname'];
	}
	trbasic(lang('direct_aid'),'mtagnew[setting][aid]',empty($mtag['setting']['aid']) ? '' : $mtag['setting']['aid']);
	trbasic(lang('direct_belong_album'),'mtagnew[setting][album]',makeoption($albumarr,empty($mtag['setting']['album']) ? '0' : $mtag['setting']['album']),'select');
	trbasic(lang('view_channel_option_msg'),'mtagnew[setting][chdata]',empty($mtag['setting']['chdata']) ? '0' : $mtag['setting']['chdata'],'radio');
	trbasic(lang('tagjspick'),'mtagnew[setting][js]',empty($mtag['setting']['js']) ? 0 : $mtag['setting']['js'],'radio');
	tabfooter();
}else{
	if(empty($mtagnew['template'])){
		if(!submitcheck('bmtagcode')){
			amessage('input_tag_tpl',M_REFERER); 
		}else $errormsg = lang('input_tag_tpl');//���ɴ���������ʾ��Ϣ
	}else{
		$mtagnew['setting']['aid'] = max(0,intval($mtagnew['setting']['aid']));
	}
}
?>
