<?php
$ctagmen_xiao_list_0 = array (
  'cname' => '会员推介小说列表',
  'ename' => 'men_xiao_list',
  'tclass' => 'catalogs',
  'template' => '<div id="lm2" class="lmc{sn_row}">
<dt><strong><img src="{$tplurl}images/tuijian2ico.gif"  align="absmiddle" /><a href="{indexurl}" target="_blank">{title}</a></strong><font onmouseover="changecla(this.id);" id="font_{sn_row}3">周</font><font onmouseover="changecla(this.id);" id="font_{sn_row}2">月</font><font onmouseover="changecla(this.id);" id="font_{sn_row}1">总</font></dt><dd id="dd_{sn_row}1" class="txt_tab" style="display:none"><ul>{c$men_xiao_pai_list}</ul></dd><dd id="dd_{sn_row}2" class="txt_tab" style="display:none"><ul>{c$men_m_pai_list}</ul></dd><dd id="dd_{sn_row}3" class="txt_tab" style="display:none"><ul>{c$men_w_pai_list}</ul></dd></div>',
  'setting' => 
  array (
    'listby' => 'ca',
    'casource' => '1',
    'caids' => '2,3,4,5,6,7',
  ),
  'disabled' => 0,
) ;
?>