<?php
$ctagpaihang_tuijianbang_0 = array (
  'cname' => '排行——推荐榜',
  'ename' => 'paihang_tuijianbang',
  'tclass' => 'archives',
  'template' => '	        <li>
    <span class="bookid">{sn_row}.</span>
    <span class="bookname">《<a href="{arcurl}" target="_blank" title="{subject}">{u$subject30}</a>》</span>
    <span class="amout" title="推荐数">{praises}</span>
</li>',
  'setting' => 
  array (
    'caidson' => '1',
    'casource' => '2',
    'chsource' => '2',
    'chids' => '4',
    'orderby' => 'praises_desc',
    'closed' => '-1',
    'abover' => '-1',
  ),
  'disabled' => 0,
) ;
?>