<?php
$ctagtgzt_con_list_0 = array (
  'cname' => '推广专题辑内列表',
  'ename' => 'tgzt_con_list',
  'tclass' => 'alarchives',
  'template' => '<ul>
       <li class="tit"><span class="t">{if $v[\'ccid3\']}<font style="color:red; font-size:12px; font-wieght:100;">[VIP]</font>{/if}<a href="{arcurl}">{subject}</a></span><span class="z">{author}</span></li>
       <li class="img"><a href="{arcurl}">{u$thumb_180_240}</a></li>
       <li class="com"><strong>简介：</strong>{abstract}<a href="{arcurl}" style="color:#E10000;">【阅读全文】</a></li>
</ul>',
  'setting' => 
  array (
    'limits' => 1000,
    'detail' => '1',
    'closed' => '-1',
    'abover' => '-1',
  ),
  'disabled' => 0,
) ;
?>