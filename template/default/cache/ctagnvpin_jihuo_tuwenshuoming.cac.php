<?php
$ctagnvpin_jihuo_tuwenshuoming_0 = array (
  'cname' => '女频新书推荐首图',
  'ename' => 'nvpin_jihuo_tuwenshuoming',
  'tclass' => 'archives',
  'template' => '	<dl class="picList3">
	<dt>《<a href="{arcurl}" target="_blank" title="{subject}">{u$subject30}</a>》</dt>
	<dd class="pic"><a href="{arcurl}" target="_blank" title="{subject}"><img src="{thumb}" alt="《{subject}》"></a></dd>
        <dd class="intro" style="height:auto;" title="{u$abstract60} ...">{u$abstract60} ...</dd>
</dl>',
  'setting' => 
  array (
    'limits' => 1,
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