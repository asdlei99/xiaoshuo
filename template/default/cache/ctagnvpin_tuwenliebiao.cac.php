<?php
$ctagnvpin_tuwenliebiao_0 = array (
  'cname' => '女频图文列表',
  'ename' => 'nvpin_tuwenliebiao',
  'tclass' => 'catalogs',
  'template' => '	<div class="main w230 mr10" style="width:230px;margin:0px;margin-left:6px;">
      <div class="mod-1">
        <!-- {title}新书榜 -->
        <div class="mod-hd">
          <h2>{title}</h2>
          <div class="mod-hd-m"><a href="{listurl}" title="更多" target="_blank">更多</a></div>
        </div>
        <div class="mod-bd">
          {c$nvpin_jihuo_tuwenshuoming}
                  <ul class="topList3_list" style="background:none;">
                  {c$nvpin_jihuo_list}
                  </ul>
        </div>
        <!-- END 武侠仙侠新书榜 -->
      </div>
    </div>',
  'setting' => 
  array (
    'limits' => 6,
    'nsid' => '-1',
    'listby' => 'ca',
    'casource' => '1',
    'caids' => '3,15,16,18,19,20',
  ),
  'disabled' => 0,
) ;
?>