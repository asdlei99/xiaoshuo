<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
$datatype = 'file';
$isfunc = $fnew ? (isset($fieldnew['isfunc']) ? $fieldnew['isfunc'] : 0) : (isset($field['isfunc']) ? $field['isfunc'] : 0);
if(!$fsave){
	load_cache('permissions');
	trbasic(lang('field_type'),'',$datatypearr[$datatype],'');
	if($fnew){
		echo "<input type=\"hidden\" name=\"fieldnew[datatype]\" value=\"$datatype\">\n";
		echo "<input type=\"hidden\" name=\"fieldnew[isfunc]\" value=\"$isfunc\">\n";
	}
	trbasic(lang('field_cname'),'fieldnew[cname]',empty($field['cname']) ? '' : $field['cname']);
	$submitstr .= makesubmitstr('fieldnew[cname]',1,0,0,30);
	trbasic(lang('field_ename'),$fnew ? 'fieldnew[ename]' : '',empty($field['ename']) ? '' : $field['ename'],$fnew ? 'text' : '');
	if($fnew) $submitstr .= makesubmitstr('fieldnew[ename]',1,'tagtype',0,30);
	if(!$isfunc){
		!in_array($fmode,array('cn')) && empty($field['issystem']) && trbasic(lang('field_pmid'),'fieldnew[pmid]',makeoption(pmidsarr('field',lang('frommsg')),empty($field['pmid']) ? 0 : $field['pmid']),'select');
		empty($field['issystem']) && trbasic(lang('input_notnull'),'fieldnew[notnull]',empty($field['notnull']) ? 0 : $field['notnull'],'radio');
		trbasic(lang('form_guide'),'fieldnew[guide]',empty($field['guide']) ? '' : $field['guide'],'btext',lang('agguide'));
		$submitstr .= makesubmitstr('fieldnew[guide]',0,0,0,80);
		trbasic(lang('remote_download'),'fieldnew[rpid]',makeoption($rpidsarr,empty($field['rpid']) ? '0' : $field['rpid']),'select');
	}
	if($isfunc){
		trbasic(lang('php_func'),'fieldnew[func]',empty($field['func']) ? '' : $field['func'],'textarea');
	}
}else{
	$sqlstr = empty($fconfigarr['sqlstr']) ? "" : $fconfigarr['sqlstr'];
	$fieldnew['cname'] = trim(strip_tags($fieldnew['cname']));
	if($fnew){
		$filterstr = empty($fconfigarr['filterstr']) ? "/[^a-zA-Z_0-9]+|^[0-9_]+/" : $fconfigarr['filterstr'];
		(empty($fieldnew['ename']) || empty($fieldnew['cname'])) && amessage('field_data_miss',$fconfigarr['errorurl']);
		preg_match($filterstr,$fieldnew['ename']) && amessage('field_ename_illegal',$fconfigarr['errorurl']);
		$fieldnew['ename'] = strtolower($fieldnew['ename']);
		in_array($fieldnew['ename'], $fconfigarr['enamearr']) && amessage('field_ename_repeat',$fconfigarr['errorurl']);
		in_array($fieldnew['ename'], $fieldwords) && amessage('field_ename_notuse',$fconfigarr['errorurl']);
		$db->query("ALTER TABLE $fconfigarr[altertable] ADD $fieldnew[ename] varchar(255) NOT NULL default ''");
	}else{
		$fieldnew['cname'] = empty($fieldnew['cname']) ? $field['cname'] : $fieldnew['cname'];
	}
	if(!$isfunc){
		$fieldnew['guide'] = empty($fieldnew['guide']) ? '' : trim($fieldnew['guide']);
	}else{
		$fieldnew['func'] = empty($fieldnew['func']) ? '' : trim($fieldnew['func']);
	}
	foreach(array('datatype','ename','length','cname','notnull','nohtml','mode','guide','mlimit','rpid','issearch','innertext','min','max','regular','isfunc','func','vdefault','pmid',) as $var){
		isset($fieldnew[$var]) && $sqlstr .= (!$sqlstr ? '' : ',')."$var='".$fieldnew[$var]."'";
	}
	if($fnew){
		$db->query("INSERT INTO $fconfigarr[fieldtable] SET $sqlstr");
	}else{
		$wherestr = empty($fconfigarr['wherestr']) ? "WHERE ename='$field[ename]'" : $fconfigarr['wherestr'];
		$db->query("UPDATE $fconfigarr[fieldtable] SET $sqlstr $wherestr");
	}
}
?>
