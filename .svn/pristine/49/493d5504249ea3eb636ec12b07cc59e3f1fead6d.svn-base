<?php
$file = file('G:\a.txt');

$y = array();
$n = array();

foreach ($file as $f) {
	$p = '/(.*)(gmail\.com)|(yahoo\.com)|(yahoo\.com\.cn)|(yahoo\.cn)$/is';
	$f = trim($f);
	if (preg_match($p, $f) == true) {
		$n[] = $f;
	} else {
		$y[] = $f;
	}
}

foreach ($n as $i) {
	echo $i,'<br>';
}