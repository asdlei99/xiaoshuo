<?php
$payonlines = array (
  'chinabank' => 
  array (
    'enable' => 0,
    'cname' => '��������',
    'send' => 'https://pay.chinabank.com.cn/select_bank',
    'receive' => 'payonline/chinabank.php',
    'partner' => '',
    'key' => '',
    'percent' => 0,
  ),
  'alipay' => 
  array (
    'enable' => 0,
    'cname' => '֧����',
    'send' => 'http://www.alipay.com/cooperate/gateway.do',
    'receive' => 'payonline/alipay.php',
    'partner' => '',
    'key' => '',
    'percent' => 0,
  ),
  'tenpay' => 
  array (
    'enable' => 0,
    'cname' => '�Ƹ�ͨ',
    'send' => 'https://www.tenpay.com/cgi-bin/v1.0/pay_gate.cgi?',
    'receive' => 'payonline/tenpay.php',
    'partner' => '',
    'key' => '',
    'percent' => 0,
  ),
  '99bill' => 
  array (
    'enable' => 0,
    'cname' => '��Ǯ',
    'send' => 'https://www.99bill.com/webapp/receiveMerchantInfoAction.do?',
    'receive' => 'payonline/99bill.php',
    'partner' => '',
    'key' => '',
    'percent' => 0,
  ),
  'cncard' => 
  array (
    'enable' => 0,
    'cname' => '����֧��',
    'send' => 'https://www.cncard.net/purchase/getorder.asp?',
    'receive' => 'payonline/cncard.php',
    'partner' => '',
    'key' => '',
    'percent' => 0,
  ),
) ;
?>