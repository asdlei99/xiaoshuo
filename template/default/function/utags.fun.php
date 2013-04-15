<?php
function dateformat($timestamp,$dateformat='Y-n-j H:i:s'){
	$result = @date("$dateformat",$timestamp);
	return $result;
}
function u_volidsarr($aid){
	global $db,$tblprefix,$mcharset;
	$volidsarr = array();
	$query = $db->query("SELECT * FROM {$tblprefix}vols WHERE aid=$aid ORDER BY volid");
	while($row = $db->fetch_array($query)) $volidsarr[$row['volid']] = $row['vtitle'];
	return $volidsarr;
}

?>
