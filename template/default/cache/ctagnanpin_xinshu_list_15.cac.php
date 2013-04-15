<?php
$ctagnanpin_xinshu_list_15_0 = array (
  'cname' => '男频新书推荐里边15',
  'ename' => 'nanpin_xinshu_list_15',
  'tclass' => 'archives',
  'template' => '	{if $v[\'sn_row\']!=1}<li class="No{$v[\'sn_row\']}"><span>《<a href="{arcurl}" target="_blank">{u$subject30}</a>》</span>
<span class="author">{author}</span></li>{/if}',
  'setting' => 
  array (
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