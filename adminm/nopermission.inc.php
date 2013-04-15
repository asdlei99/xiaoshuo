<?php
!defined('M_COM') && exit('No Permission');
empty($handlekey) && $handlekey = '';
$tmp=empty($infloat)?'':" onclick=\"floatwin('close_$handlekey');return floatwin('open_login',this)\"";
mcmessage('loginmemcenter','',' [<a href="login.php"'.$tmp.'>'.lang('memberlogin').'</a>] [<a href="register.php" target="_blank">'.lang('register').'</a>]');
?>