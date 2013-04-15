<?php
$ptagart_j_list_0 = array (
  'cname' => '小说辑内文档列表',
  'ename' => 'art_j_list',
  'tclass' => 'alarchives',
  'template' => '<dd><h3><a href="{arcurl}" title="{subject}" target="_blank">{subject}</a>{if ($v[\'ccid3\'])}<font style="color:red;">[VIP]</font>{/if}</h3><div>{u$content_abs [tclass=odeal/] [tname=abstract/] [dealhtml=clearhtml/] [trim=300/] [wordlink=1/]}{/u$content_abs}</div></dd>',
  'setting' => 
  array (
    'val' => 'v',
    'limits' => 5,
    'chids' => '',
    'orderstr' => 'a.aid ASC',
    'closed' => '-1',
    'abover' => '-1',
    'length' => '10',
  ),
) ;
?>