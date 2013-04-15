<?php
$ctagnvpin_jihuo_list_0 = array (
  'cname' => '女频图文激活列表',
  'ename' => 'nvpin_jihuo_list',
  'tclass' => 'archives',
  'template' => '					{if $v[\'sn_row\']!==1}<li style="background-image:none;">
<span style="color:#656565;margin-left:-1px;">[{catalog}]</span>
<span><a href="{arcurl}" target="_blank">{u$subject30}</a></span>
</li>{/if}',
  'setting' => 
  array (
    'limits' => 6,
    'caidson' => '1',
    'casource' => '2',
    'ccids1' => '32',
    'chsource' => '2',
    'chids' => '4',
    'orderby' => 'createdate_desc',
    'orderby1' => 'mclicks_desc',
    'closed' => '-1',
    'abover' => '-1',
    'wherestr' => 'a.thumb != \\\'\\\'',
  ),
  'disabled' => 0,
) ;
?>