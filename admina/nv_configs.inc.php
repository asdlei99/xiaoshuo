<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
//ֻ��������վ//���ȫվ�������Ҫ��������
$vip_gtid = 6;
sys_cache('nvconfigs');
load_cache('mtpls');

if(!submitcheck('bnv_configs')){
	tabheader('С˵ϵͳ����','nv_configs',"?entry=$entry");
	trbasic('��ͨ��Ա �Ķ��۸�','nvconfigsnew[readprice0]',empty($nvconfigs['readprice0']) ? '' : $nvconfigs['readprice0'],'text','ÿǧ�ֽ���Ҫ֧�����پ����');
	tabfooter('bnv_configs');
}else{
	$nvconfigsnew['readprice0'] = empty($nvconfigsnew['readprice0']) ? 0 : round(max(0,floatval($nvconfigsnew['readprice0'])),1);
	
	
	$cacstr = var_export($nvconfigsnew,TRUE);
	if(@$fp = fopen(M_ROOT.'./include/syscache/nvconfigs.cac.php','wb')){
		fwrite($fp,"<?php\n\$nvconfigs = $cacstr ;\n?>");
		fclose($fp);
	}
	amessage('С˵ϵͳ�������óɹ���',M_REFERER);
}

?>
