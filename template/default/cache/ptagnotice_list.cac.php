<?php
$ptagnotice_list_0 = array (
  'cname' => '公告内容分页',
  'ename' => 'notice_list',
  'tclass' => 'farchives',
  'template' => '<li><b><a href="{arcurl}" title="{subject}" target="_blank">{subject}</a></b><font>{u$createdate_nj [tclass=function/]}return dateformat(\'{createdate}\',\'n-j\');{/u$createdate_nj}</font></li>',
  'setting' => 
  array (
    'limits' => 45,
    'cols' => 1,
    'casource' => '1',
    'orderby' => 'createdate_desc',
    'length' => '10',
  ),
) ;
?>