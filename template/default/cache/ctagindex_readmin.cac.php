<?php
$ctagindex_readmin_0 = array (
  'cname' => '专题推介',
  'ename' => 'index_readmin',
  'tclass' => 'archives',
  'template' => '	    <div id="txtpic">
<div class="retxtpic_r"><b><a {if ($v[\'ccid3\'])}style="color:red;"{/if} href="{arcurl}" title="{subject}">{u$subject30}</a></b><br>作者：{author}<br>发表时间：{u$createdate_nj}<br /><a href="{arcurl}"  target="_blank">[全文阅读]</a>
</div>
<div class="retxtpic_l pic_on"><a href="{arcurl}" target="_blank">{u$thumb_66_87}</a></div>
</div>',
  'setting' => 
  array (
    'limits' => 2,
    'caidson' => '1',
    'casource' => '1',
    'caids' => '1,2,4,5,6,7,17,14,3,15,16,18,19,20',
    'ccids1' => '30',
    'chsource' => '2',
    'chids' => '4',
    'orderby' => 'favorites_desc',
    'closed' => '-1',
    'abover' => '-1',
  ),
  'disabled' => 0,
) ;
?>