<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
include_once M_ROOT."./include/database.fun.php";
if(!submitcheck('bdbpack')){
	$submitstr = '';
	tabheader('����������ʽ�����ݱ�','dbpack',"?entry=a_dbpack",2,0,1);
	for($i = 1;$i < 11;$i ++){
		trbasic('���ݱ�-'.$i.'&nbsp; &nbsp; <input class="checkbox" type="checkbox" name="nodata'.$i.'" value="1"> ���ṹ','dbtable'.$i);
	}
	trbasic('����˵��','','��������һ��.sql�ļ�����������ϵͳʱ�������ơ�<br>ע�⣺���ű�ֻ����gbk������ļ���','');
	tabfooter('bdbpack');
}else{
	$sqlcompat = 'MYSQL40';
	$sqlcharset = $dumpcharset = 'gbk';
	$usehex = 0;
	$db->query('SET SQL_QUOTE_SHOW_CREATE=0', 'SILENT');
	$setnames = ($sqlcharset && $db->version() > '4.1' && (!$sqlcompat || $sqlcompat == 'MYSQL41')) ? "SET NAMES '$dumpcharset';\n\n" : '';
	if($db->version() > '4.1'){
		if($sqlcharset) $db->query("SET NAMES '".$sqlcharset."';\n\n");
		if($sqlcompat == 'MYSQL40'){
			$db->query("SET SQL_MODE='MYSQL40'");
		}elseif($sqlcompat == 'MYSQL41') {
			$db->query("SET SQL_MODE=''");
		}
	}
	for($i = 1;$i < 11;$i ++){
		$dbtable = trim(${'dbtable'.$i});
		$dbdata = empty(${'nodata'.$i}) ? 1 : 0;
		if(!$dbtable) continue;
		$sqldump = $setnames;
		$sqldump .= pack_sqldump($dbtable,$dbdata);
		$dumpfile = M_ROOT.'./updatedata/'.$dbtable.'.sql';
		@$fp = fopen($dumpfile,'wb');
		@flock($fp, 2);
		@fwrite($fp, $sqldump);
		@fclose($fp);
	}
	amessage('data_export_finish','?entry=a_dbpack');
}

?>
