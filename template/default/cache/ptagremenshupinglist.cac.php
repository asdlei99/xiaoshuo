<?php
$ptagremenshupinglist_0 = array (
  'cname' => '���������б�',
  'ename' => 'remenshupinglist',
  'tclass' => 'outinfos',
  'template' => '			<li><a href="comments.php?aid={aid}" title="{content}" target="_blank" class="vip_{sn_row}">{u$content24}</a><span>{votes1}</span></li>',
  'setting' => 
  array (
    'dsid' => '0',
    'sqlstr' => 'SELECT * FROM `xs_comments` ORDER BY votes1 DESC',
    'length' => '10',
  ),
  'disabled' => 0,
) ;
?>