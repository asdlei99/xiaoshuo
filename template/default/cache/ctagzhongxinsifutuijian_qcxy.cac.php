<?php
$ctagzhongxinsifutuijian_qcxy_0 = array (
  'cname' => '_中心四幅图推荐--青春校园',
  'ename' => 'zhongxinsifutuijian_qcxy',
  'tclass' => 'farchives',
  'template' => '	<dl>
      <dt><a  href="/archive.php?aid={xsid}" target="_blank">{u$pic}</a></dt>
      <dd>
            <h3>《<a  href="/archive.php?aid={xsid}" target="_blank">{u$subject30}</a>》</h3>
            <h4>作者：<a href="/archive.php?aid={xsid}" target="_blank">{u$author10}</a></h4>
            <span><br><a href="javascript:;" onclick="ajax_favorite_alert(\'{xsid}\');">[加入书架]</a><br>
            <a  href="/archive.php?aid={xsid}" target="_blank" title="点击阅读">[点击阅读]</a></span>
      </dd>
      <dd style="clear:both;display:block;height:1px;width:100%;"></dd>
      <dd style="height:auto;">
            <p><a  href="/archive.php?aid={xsid}" target="_blank">{u$jianjie120}...</a></p>
      </dd>
</dl>
',
  'setting' => 
  array (
    'limits' => 4,
    'casource' => '181',
    'orderby' => 'vieworder_asc',
    'validperiod' => '1',
  ),
  'disabled' => 0,
) ;
?>