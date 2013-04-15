<?php
//---------------------------------------------------------
//�Ƹ�ͨ�н鵣��֧������ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------

require_once ("classes/PayRequestHandler.class.php");

function makeurl(&$pay){
	global $mcharset, $cms_abs;

	$order_sn = $pay->account . date('Ymd0000') . substr($pay->order_sn, strlen($pay->order_sn) - 6, 6);
	
	/* ����֧��������� */
	$reqHandler = new PayRequestHandler();
	$reqHandler->init();
	$reqHandler->setKey($pay->keyt);
	
	//----------------------------------------
	//����֧������
	//----------------------------------------
	$reqHandler->setParameter("bargainor_id", $pay->account);					//�̻���
	$reqHandler->setParameter("sp_billno", $pay->order_id);						//�̻�������
	$reqHandler->setParameter("transaction_id", $order_sn);						//�Ƹ�ͨ���׵���
	$reqHandler->setParameter("total_fee", $pay->totalfee * 100);				//��Ʒ�ܼۣ���λΪ��
	$reqHandler->setParameter("return_url", $pay->notify_url);					//���ش����ַ
	$reqHandler->setParameter("desc", $pay->subject);							//��Ʒ����
	$reqHandler->setParameter("attach", $pay->order_sn);						//�̼����ݰ���ԭ������
	//�û�ip,���Ի���ʱ��Ҫ�����ip��������ʽ�����ټӴ˲���
	#$reqHandler->setParameter("spbill_create_ip", $_SERVER['REMOTE_ADDR']);

	//�����URL
	return $reqHandler->getRequestURL();
	//debug��Ϣ
	//$debugInfo = $reqHandler->getDebugInfo();
	
	//echo "<br/>" . $reqUrl . "<br/>";
	//echo "<br/>" . $debugInfo . "<br/>";
	
	//�ض��򵽲Ƹ�֧ͨ��
	//$reqHandler->doSend();
}
?>