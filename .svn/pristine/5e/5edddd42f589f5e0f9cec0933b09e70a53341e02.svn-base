<?php
//////////////////////////CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC//////////////////////////////////////
!defined('M_COM') && exit('No Permission');
function cnodesfromcnc(&$cnconfigs){
	global $cotypes;
	foreach($cnconfigs as $cncid => $cnconfig){
		$idsarr = $cnconfig['idsarr'];
		$cnodes1 = array();
		$i = 0;
		foreach($idsarr as $k =>$ids){
			if(!$i && empty($ids)) continue;
			if(empty($ids)) unset($idsarr[$k]);
			$i ++;
		}
		$i = 0;
		$j = count($idsarr) - 1;
		foreach($idsarr as $k =>$ids){
			$kvar = $k == 'ca' ? 'caid' : 'ccid'.$k;
			if(!$i){
				foreach($ids as $id){
					$k2 = $kvar.'='.$id;
					save_cnode($k2,$cncid);
					$cnodes1[$k2] = '';
				}
			}else{
				foreach($cnodes1 as $k1 => $v1){
					foreach($ids as $id){
						$k2 = $k1.'&'.$kvar.'='.$id;
						save_cnode($k2,$cncid);
						if($i != $j) $cnodes1[$k2] = '';
					}
				}
			}
			$i ++;
		}
	}
	unset($idsarr,$ids);
	return;
}

function cnode_cname($cnstr){
	global $sid;
	parse_str($cnstr,$idsarr);
	$ret = '';
	foreach($idsarr as $k => $v){
		$item = $k == 'caid' ? read_cache('catalog',$v,'',$sid) : read_cache('coclass',str_replace('ccid','',$k),$v);
		$ret .= ($ret ? '=>' : '').$item['title'];
	}
	unset($item,$idsarr);
	return $ret;
}

?>