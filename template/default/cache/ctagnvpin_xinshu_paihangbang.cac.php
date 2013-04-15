<?php
$ctagnvpin_xinshu_paihangbang_0 = array (
  'cname' => '女频新书排行榜',
  'ename' => 'nvpin_xinshu_paihangbang',
  'tclass' => 'catalogs',
  'template' => '<div class="main w230 mr10" style="width:232px;float:left;margin:0px;margin-left:5px;">
      <div class="mod-1">
        <!-- {title}新书榜 -->
        <div class="mod-hd">
          <h2>{title}新书榜</h2>
          <div class="mod-hd-m"><a href="{listurl}" title="更多" target="_blank">更多</a></div>
        </div>
        <div class="mod-bd">
          {c$nanpin_xinshu_tuwenshuoming}
                  <ul class="topList3">
                  {c$nanpin_xinshu_list_15}
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