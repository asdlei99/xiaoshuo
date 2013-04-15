<?php
$ptagziroulist_0 = array (
  'cname' => '自由专题内容',
  'ename' => 'ziroulist',
  'tclass' => 'alarchives',
  'template' => '<ul {if $v[\'sn_row\']%2} class="t"{/if}>
<li class="ztimg"><img width="84" height="104" src="{u$thumb_84_104}" alt="{subject}" /></li>
<li>{if $v[\'ccid3\']}<font class="cRed">[VIP]</font>{/if}<a href="{arcurl}" title="{subject}">{subject}</a>&nbsp;&nbsp;&nbsp;&nbsp;类别：{c$list_url_tit}&nbsp;&nbsp;&nbsp;&nbsp;作者：{author}&nbsp;&nbsp;&nbsp;&nbsp;<a href="{$cms_abs}favorite.php?aid={aid}">收藏</a></li>
<li class="ztjianjie"><strong>简介：</strong>{u$ztinfo_240}...<a href="{arcurl}">【阅读全文】</a></li>
<li>点击数：{clicks}&nbsp;&nbsp;|&nbsp;&nbsp;评论数：{comments}&nbsp;&nbsp;|&nbsp;&nbsp;收藏数：{favorites}</li>
</ul>',
  'setting' => 
  array (
    'chsource' => '1',
    'chids' => '4',
    'detail' => '1',
    'closed' => '-1',
    'abover' => '-1',
    'length' => '10',
  ),
  'disabled' => 0,
) ;
?>