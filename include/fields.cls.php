<?php
!defined('M_COM') && exit('No Permission');
@set_time_limit(0);
class cls_field{
	var $field = array();
	var $oldvalue = '';
	var $newvalue = '';
	var $error = '';
	var $isadd = 0;
	var $mc = 0;
	var $searchstr = '';
	var $filterstr = '';
	var $submitstr = '';
	function __construct(){
		$this->cls_field();
	}
	function cls_field(){
		$this->init();
	}
	function init($mc=0){
		$this->field = array();
		$this->oldvalue = '';
		$this->newvalue = '';
		$this->error = '';
		$this->isadd = 0;
		$this->mc = $mc;
		$this->searchstr = '';
		$this->filterstr = '';
		$this->submitstr = '';
	}
	function trfield($varpre='',$noeditstr=''){
		if(empty($this->field['ename']) || empty($this->field['available'])) return;
		$trname = ($this->field['notnull'] ? '*' : '').$this->field['cname'].$noeditstr;
		$varname = !$varpre ? $this->field['ename'] : ($varpre.'['.$this->field['ename'].']');
		$oldstr = $this->isadd ? $this->field['vdefault'] : $this->oldvalue;//多项选择
		$datatype = $this->field['datatype'];
		$mode = $this->field['mode'];
		if(in_array($datatype,array('text','int','float'))){
			$oldstr = mhtmlspecialchars($oldstr);
			$datatype = 'text';
		}elseif($datatype == 'select'){
			$sourcearr = select_arr($this->field['innertext'],$this->field['fromcode']);
			$oldstr = !$mode ? makeoption($sourcearr,$oldstr) : makeradio($varname,$sourcearr,$oldstr);
		}elseif($datatype == 'mselect'){
			$sourcearr = select_arr($this->field['innertext'],$this->field['fromcode']);
			$oldarr = explode("\t",$oldstr);
			$oldstr = !$mode ? multiselect($varname.'[]',$sourcearr,$oldarr) : makecheckbox($varname.'[]',$sourcearr,$oldarr);
		}elseif($datatype == 'multitext'){
			$oldstr = mhtmlspecialchars($oldstr);
		}elseif($datatype == 'date'){
			$oldstr = $oldstr ? date('Y-m-d',$oldstr) : '';
		}
		$func = $this->mc ? 'mtrspecial' : 'trspecial';
		$func($trname,$varname,$oldstr,$datatype,$mode,$this->field['guide'],$this->field['min'],$this->field['max']);
		$this->make_submitstr($varname);
	}
	function trsearch(){
		if(!$this->field['available'] || !$this->field['issearch']) return;
		global ${$this->field['ename']},${$this->field['ename'].'str'},${$this->field['ename'].'from'},${$this->field['ename'].'to'};
		$var = ${$this->field['ename']};
		$varstr = ${$this->field['ename'].'str'};
		$varfrom = ${$this->field['ename'].'from'};
		$varto = ${$this->field['ename'].'to'};
		$mode = $this->field['mode'];
		$datatype = $this->field['datatype'];
		$func = $this->mc ? 'mtrspecial' : 'trspecial';
		if(in_array($datatype,array('select','mselect'))){
			$sourcearr = select_arr($this->field['innertext'],$this->field['fromcode']);
			$sourcestr = '';
			if($this->field['issearch'] == '1'){
				$sourcearr = array('' => lang('nolimit')) + $sourcearr;
				$sourcestr = !$mode ? makeoption($sourcearr,$var) : makeradio($this->field['ename'],$sourcearr,$var);
				$func($this->field['cname'],$this->field['ename'],$sourcestr,'select',$mode,$this->field['guide']);
			}else{
				if($var){
					$varstr = implode("\t",$var);
				}elseif($varstr){
					$var = explode("\t",$varstr);
				}else{
					$varstr = '';
					$var = array();
				}
				$sourcestr = !$mode ? multiselect($this->field['ename'].'[]',$sourcearr,$var) : makecheckbox($this->field['ename'].'[]',$sourcearr,$var);
				$func($this->field['cname'],$this->field['ename'],$sourcestr,'mselect',$mode,$this->field['guide']);
			}
		}elseif($datatype == 'text'){
			$var = empty($var) ? '' : cutstr(trim($var),20,'');
			$func($this->field['cname'],$this->field['ename'],$var,$datatype,$mode,$this->field['guide']);
		}elseif(in_array($datatype,array('int','float','date',))){
			$datatype = in_array($datatype,array('int','float')) ? 'text' : 'date';
			$mode = in_array($datatype,array('int','float')) ? 1 : 0;
			if($this->field['issearch'] == '1'){
				$var = trim($var);
				if($this->field['datatype'] == 'date' && !isdate($var)){
					$var = '';
				}elseif(in_array($this->field['datatype'],array('int','float')) && !is_numeric($var)){
					$var = '';
				}
				if($var != ''){
					($this->field['datatype'] == 'int') && ($var = intval($var));
					($this->field['datatype'] == 'float') && ($var = floatval($var));
				}
				$func($this->field['cname'],$this->field['ename'],$var,$datatype,$mode,$this->field['guide']);
			}else{
				$varfrom = trim($varfrom);
				if($this->field['datatype'] == 'date' && !isdate($varfrom)){
					$varfrom = '';
				}elseif(in_array($this->field['datatype'],array('int','float')) && !is_numeric($varfrom)){
					$varfrom = '';
				}
				if($varfrom != ''){
					($this->field['datatype'] == 'int') && ($varfrom = intval($varfrom));
					($this->field['datatype'] == 'float') && ($varfrom = floatval($varfrom));
				}
				$func($this->field['cname'].'&nbsp;>=',$this->field['ename'].'from',$varfrom,$datatype,$mode,$this->field['guide']);
				${$this->field['ename'].'to'} = trim(${$this->field['ename'].'to'});
				if($this->field['datatype'] == 'date' && !isdate(${$this->field['ename'].'to'})){
					${$this->field['ename'].'to'} = '';
				}elseif(in_array($this->field['datatype'],array('int','float')) && !is_numeric(${$this->field['ename'].'to'})){
					${$this->field['ename'].'to'} = '';
				}
				if(${$this->field['ename'].'to'} != ''){
					($this->field['datatype'] == 'int') && (${$this->field['ename'].'to'} = intval(${$this->field['ename'].'to'}));
					($this->field['datatype'] == 'float') && (${$this->field['ename'].'to'} = floatval(${$this->field['ename'].'to'}));
				}
				$func($this->field['cname'].'&nbsp;<',$this->field['ename'].'to',${$this->field['ename'].'to'},$datatype,$mode,$this->field['guide']);
			}
		}
	}
	function deal_search($fpre = ''){//$fpre为查询字串中的表别名，如a.,c.,m.等
		if(!$this->field['available'] || !$this->field['issearch']) return;
		$fn = $this->field['ename'];
		global ${$fn},${$fn.'str'},${$fn.'from'},${$fn.'to'};
		if($this->field['datatype'] == 'select'){
			if($this->field['issearch'] == '1'){
				if(${$fn} != ''){
					$this->searchstr = $fpre.$fn."='".${$fn}."'";
					$this->filterstr = $fn."=".rawurlencode(stripslashes(${$fn}));
				}
			}else{
				if(!empty(${$fn})){
					${$fn.'str'} = implode("\t",${$fn});
				}elseif(!empty(${$fn.'str'})){
					${$fn} = explode("\t",${$fn.'str'});
				}else{
					${$fn.'str'} = '';
				}
				if(${$fn.'str'} != ''){
					$this->searchstr = $fpre.$fn." ".multi_str(${$fn});
					$this->filterstr = $fn."str=".rawurlencode(stripslashes(${$fn.'str'}));
				}
			}
		}elseif($this->field['datatype'] == 'mselect'){
			if($this->field['issearch'] == '1'){
				if(${$fn} != ''){
					$this->searchstr = $fpre.$fn." LIKE '%".str_replace(array(' ','*'),'%',addcslashes(${$fn},'%_'))."%'";
					$this->filterstr = $fn."=".rawurlencode(stripslashes(${$fn}));
				}
			}else{
				if(!empty(${$fn})){
					${$fn.'str'} = implode("\t",${$fn});
				}elseif(!empty(${$fn.'str'})){
					${$fn} = explode("\t",${$fn.'str'});
				}else{
					${$fn.'str'} = '';
				}
				if(${$fn.'str'} != ''){
					foreach(${$fn} as $v){
						$this->searchstr .= ($this->searchstr ? ' OR ' : '').$fpre.$fn." LIKE '%".str_replace(array(' ','*'),'%',addcslashes($v,'%_'))."%'";
					}
					$this->searchstr = '('.$this->searchstr.')';
					$this->filterstr = $fn."str=".rawurlencode(stripslashes(${$fn.'str'}));
				}
			}
		}elseif($this->field['datatype'] == 'text'){
			${$fn} = empty(${$fn}) ? '' : cutstr(trim(${$fn}),20,'');
			if(${$fn} != ''){
				if($this->field['issearch'] == '1'){
					$this->searchstr = $fpre.$fn."='".${$fn}."'";
				}else{
					$this->searchstr = $fpre.$fn." LIKE '%".str_replace(array(' ','*'),'%',addcslashes(${$fn},'%_'))."%'";
				}		
				$this->filterstr = $fn."=".rawurlencode(stripslashes(${$fn}));
			}
		}elseif(in_array($this->field['datatype'],array('int','float','date'))){
			if($this->field['issearch'] == '1'){
				${$fn} = trim(${$fn});
				if($this->field['datatype'] == 'date' && !isdate(${$fn})){
					${$fn} = '';
				}elseif(in_array($this->field['datatype'],array('int','float')) && !is_numeric(${$fn})){
					${$fn} = '';
				}
				if(${$fn} != ''){
					($this->field['datatype'] == 'int') && (${$fn} = intval(${$fn}));
					($this->field['datatype'] == 'float') && (${$fn} = floatval(${$fn}));
					if($this->field['datatype'] == 'date'){
						$this->searchstr = $fpre.$fn."='".strtotime(${$fn})."'";
					}else{
						$this->searchstr = $fpre.$fn."='".${$fn}."'";
					}
					$this->filterstr = $fn."=".rawurlencode(${$fn});
				}
			}else{
				${$fn.'from'} = trim(${$fn.'from'});
				if($this->field['datatype'] == 'date' && !isdate(${$fn.'from'})){
					${$fn.'from'} = '';
				}elseif(in_array($this->field['datatype'],array('int','float')) && !is_numeric(${$fn.'from'})){
					${$fn.'from'} = '';
				}
				if(${$fn.'from'} != ''){
					($this->field['datatype'] == 'int') && (${$fn.'from'} = intval(${$fn.'from'}));
					($this->field['datatype'] == 'float') && (${$fn.'from'} = floatval(${$fn.'from'}));
					if($this->field['datatype'] == 'date'){
						$this->searchstr = $fpre.$fn.">='".strtotime(${$fn.'from'})."'";
					}else{
						$this->searchstr = $fpre.$fn.">='".${$fn.'from'}."'";
					}
					$this->filterstr = $fn."from=".rawurlencode(${$fn.'from'});
				}

				${$fn.'to'} = trim(${$fn.'to'});
				if($this->field['datatype'] == 'date' && !isdate(${$fn.'to'})){
					${$fn.'to'} = '';
				}elseif(in_array($this->field['datatype'],array('int','float')) && !is_numeric(${$fn.'to'})){
					${$fn.'to'} = '';
				}
				if(${$fn.'to'} != ''){
					($this->field['datatype'] == 'int') && (${$fn.'to'} = intval(${$fn.'to'}));
					($this->field['datatype'] == 'float') && (${$fn.'to'} = floatval(${$fn.'to'}));
					if($this->field['datatype'] == 'date'){
						$this->searchstr .= ($this->searchstr ? " AND " : "").$fpre.$fn."<'".strtotime(${$fn.'to'})."'";
					}else{
						$this->searchstr .= ($this->searchstr ? " AND " : "").$fpre.$fn."<'".${$fn.'to'}."'";
					}
					$this->filterstr .= ($this->filterstr ? '&' : '').$fn."to=".rawurlencode(${$fn.'to'});
				}
			}
		}
		return;
	}
	function deal($varpre=''){
		global $c_upload,$ftp_pwd;
		$datatype = $this->field['datatype'];
		$varname = empty($varpre) ? $this->field['ename'] : $varpre;
		global $$varname;
		$var = $$varname;
		$this->newvalue = empty($varpre) ? $var : (isset($var[$this->field['ename']]) ? $var[$this->field['ename']] : '');
		if($datatype == 'mselect'){
			$this->newvalue = !empty($this->newvalue) ? implode("\t",$this->newvalue) : '';
		}elseif(in_array($datatype,array('image','file','flash','media'))){
			$this->newvalue = upload_s($this->newvalue,$this->oldvalue,$datatype,$this->field['rpid']);
		}elseif(in_array($datatype,array('images','files','medias','flashs'))){//返回数组，以便分析数量限制
			$this->newvalue = upload_m($this->newvalue,$this->oldvalue,substr($datatype,0,strlen($datatype) - 1),$this->field['rpid']);
		}
		$this->pre_deal();
		if(!$this->check_null()) return;
		if(!$this->check_limit()) return;
		if($this->field['rpid'] &&  in_array($this->field['datatype'],array('text','multitext','htmltext'))){
			$this->newvalue = addslashes($c_upload->remotefromstr(stripslashes($this->newvalue),$this->field['rpid']));
		}
		$ftp_pwd = false;
		$this->end_deal();
	}
	function pre_deal(){
		$min = $this->field['min'];
		$max = $this->field['max'];
		if(in_array($this->field['datatype'],array('htmltext','date','multitext','text','select','mselect'))){
			$this->field['nohtml'] && $this->newvalue = strip_tags($this->newvalue);
			$this->newvalue = trim($this->newvalue);
			if(in_array($this->field['datatype'],array('htmltext','multitext','text'))){
				if($min && strlen($this->newvalue) < $min) $this->error = $this->field['cname']." &nbsp;".lang('lengsmalmilim');
				if($max && strlen($this->newvalue) > $max) $this->error = $this->field['cname']." &nbsp;".lang('lenglargmaxlimi');
			}
		}elseif($this->field['datatype'] == 'int'){
			$this->newvalue = intval($this->newvalue);
			if($min && $this->newvalue < $min) $this->error = $this->field['cname']." &nbsp;".lang('smallminilimi');
			if($max && $this->newvalue > $max) $this->error = $this->field['cname']." &nbsp;".lang('largmaxlimi');
		}elseif($this->field['datatype'] == 'float'){
			$this->newvalue = floatval($this->newvalue);
			if($min && $this->newvalue < $min) $this->error = $this->field['cname']." &nbsp;".lang('smallminilimi');
			if($max && $this->newvalue > $max) $this->error = $this->field['cname']." &nbsp;".lang('largmaxlimi');
		}elseif(in_array($this->field['datatype'],array('images','files','medias','flashs'))){
			$counts = $this->newvalue ? count($this->newvalue) : 0;
			if($min && $counts < $min) $this->error = $this->field['cname']." &nbsp;".lang('attatamosmaminili');
			if($max && $counts > $max) $this->newvalue = marray_slice($this->newvalue,0,$max);
			$this->newvalue = $this->newvalue ? addslashes(serialize($this->newvalue)) : '';
		}
		return;
	}
	function check_null(){
		if($this->field['notnull'] && empty($this->newvalue)){
			$this->error = $this->field['cname'].lang('notnull');
			return false;
		}
		return true;
	}
	function check_limit(){
		$mlimit = $this->field['mlimit'];
		if($this->field['datatype'] == 'date'){
			$mlimit = 'date';
		}elseif($this->field['datatype'] == 'int'){
			$mlimit = 'int';
		}elseif($this->field['datatype'] == 'float'){
			$mlimit = 'number';
		}
		if(empty($this->newvalue) || empty($mlimit)) return true;
		$cname = $this->field['cname'];
		if($mlimit == 'date' && !isdate($this->newvalue)){
			$this->error = "$cname ".lang('liminpda');
		}elseif($mlimit == 'int' && !is_numeric($this->newvalue)){
			$this->error = "$cname ".lang('liminpint');
		}elseif($mlimit == 'number' && !is_numeric($this->newvalue)){
			$this->error = "$cname ".lang('liminpnum');
		}elseif($mlimit == 'letter' && !preg_match("/^[a-z]+$/i",$this->newvalue)){
			$this->error = "$cname ".lang('limiinputlett');
		}elseif($mlimit == 'numberletter' && !preg_match("/^[0-9a-z]+$/i",$this->newvalue)){
			$this->error = "$cname ".lang('limitinputnumberl');
		}elseif($mlimit == 'tagtype' && !preg_match("/^[a-z]+\w*$/i",$this->newvalue)){
			$this->error = "$cname ".lang('limitinputtagtype');
		}elseif($mlimit == 'email' && !isemail($this->newvalue)){
			$this->error = "$cname ".lang('limitinputemail');
		}
		return $this->error ? false : true;
	}
	function end_deal(){
		if(!empty($this->newvalue)){
			if($this->field['datatype'] == 'date'){
				$this->newvalue = strtotime($this->newvalue);
			}elseif($this->field['datatype'] == 'htmltext'){
				html_atm2tag($this->newvalue);
			}
		}
		return;
	}
	function make_submitstr($varname=''){//需要当前值，单个图片可以处理，图集不要处理了,需要返回错误控件的焦点
		$datatype = $this->field['datatype'];
		if(in_array($datatype,array('select','mselect'))) return;
		$notnull = $this->field['notnull'];
		$mlimit = $this->field['mlimit'];
		$regular = $this->field['regular'];
		$min = $this->field['min'];
		$max = $this->field['max'];

		if(in_array($datatype,array('images','flashs','medias','files'))){
			$extmode = substr($datatype,0,strlen($datatype)-1);
		}elseif(in_array($datatype,array('image','flash','media','file'))) $extmode = $datatype;
		$exts = '';
		if(!empty($extmode)){
			global $localfiles;
			load_cache('localfiles');
			$exts = implode(',',array_keys($localfiles[$extmode]));
		}

		if(!$notnull && !$mlimit && !$regular && !$min && !$max && !$exts && $datatype != 'date') return;
		$regular = addslashes($regular);
		if(in_array($datatype,array('image','flash','media','file'))){
			$this->submitstr = "rmsg = checksimple('$varname','$notnull','$exts');\n";
		}elseif(in_array($datatype,array('images','flashs','medias','files'))){
			$this->submitstr = "rmsg = checkmultiple('$varname','$notnull','$exts','$min','$max');\n";
		}elseif($datatype == 'htmltext'){
			$this->submitstr = "rmsg = checkhtmltext('$varname','$notnull','$min','$max');\n";
		}elseif($datatype == 'multitext'){
			$this->submitstr = "rmsg = checkmultitext('$varname','$notnull','$min','$max');\n";
		}elseif($datatype == 'text'){
			$this->submitstr = "rmsg = checktext('$varname','$notnull','$mlimit','$regular','$min','$max');\n";
		}elseif($datatype == 'date'){
			$this->submitstr = "rmsg = checkdate('$varname','$notnull','$min','$max');\n";
		}elseif($datatype == 'int'){
			$this->submitstr = "rmsg = checkint('$varname','$notnull','$regular','$min','$max');\n";
		}elseif($datatype == 'float'){
			$this->submitstr = "rmsg = checkfloat('$varname','$notnull','$regular','$min','$max');\n";
		}
		$this->submitstr .= "if(rmsg){\n	if(dom=\$id('alert_$varname'))dom.innerHTML = rmsg;\n	i = false;\n}\n";
	}
}
?>