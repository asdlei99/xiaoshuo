<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
//只适用于主站//清除全站缓存后需要重新设置
$vip_gtid = 6;
sys_cache('nvconfigs');
load_cache('mtpls');

if(!submitcheck('bnv_configs')){
	tabheader('小说系统参数','nv_configs',"?entry=$entry");
	trbasic('普通会员 阅读价格','nvconfigsnew[readprice0]',empty($nvconfigs['readprice0']) ? '' : $nvconfigs['readprice0'],'text','每千字节需要支付多少经典币');
	tabfooter('bnv_configs');
}else{
	$nvconfigsnew['readprice0'] = empty($nvconfigsnew['readprice0']) ? 0 : round(max(0,floatval($nvconfigsnew['readprice0'])),1);
	
	
	$cacstr = var_export($nvconfigsnew,TRUE);
	if(@$fp = fopen(M_ROOT.'./include/syscache/nvconfigs.cac.php','wb')){
		fwrite($fp,"<?php\n\$nvconfigs = $cacstr ;\n?>");
		fclose($fp);
	}
	amessage('小说系统参数设置成功！',M_REFERER);
}

?>
