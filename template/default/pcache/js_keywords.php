<?php $_keywords=_ctag_parse(array("ename" => "keywords","tclass" => "keywords","disabled" => "0",));foreach($_keywords as $v){_aenter($v);?>
<a href="<?=$v['wordlink']?>" title="<?=$v['wordlink']?>"><?=$v['word']?></a>&nbsp;<?php _aquit();} unset($_keywords,$v);?>
