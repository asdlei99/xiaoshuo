<?php $_pinglunlist=_ctag_parse(array("ename" => "pinglunlist","tclass" => "commus","disabled" => "0","limits" => "5","cuid" => "5","idsource" => "aid",));foreach($_pinglunlist as $v){_aenter($v);?>
<li><span><?php echo _utag_parse(array("ename" => "ztinfo","tclass" => "odeal","tname" => "$v[content]","dealhtml" => "clearhtml",));?>
</span><font><?php echo _utag_parse(array("ename" => "createdate_all","tclass" => "date","tname" => "$v[createdate]","date" => "Y-m-d","time" => "H:i",));?>
</font><a href="<?=$cms_abs?>mspace/index.php?mid=<?=$v['mid']?>" target="_blank"><?=$v['mname']?></a></li><?php _aquit();} unset($_pinglunlist,$v);?>
