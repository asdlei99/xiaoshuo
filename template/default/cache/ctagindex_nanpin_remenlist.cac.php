<?php
$ctagindex_nanpin_remenlist_0 = array (
  'cname' => '首页男频热门小说列表',
  'ename' => 'index_nanpin_remenlist',
  'tclass' => 'archives',
  'template' => '		{if $v[\'sn_row\']!=1}
<li><span>{$v[\'sn_row\']}</span><p>《<a href="{arcurl}" target="_blank">{u$subject30}</a>》</p><em>{u$author10}</em></li>
{/if}',
  'setting' => 
  array (
    'nsid' => '-1',
    'caidson' => '1',
    'casource' => '1',
    'caids' => '1',
    'chsource' => '2',
    'chids' => '4',
    'orderby' => 'comments_desc',
    'closed' => '-1',
    'abover' => '-1',
  ),
  'disabled' => 0,
) ;
?>