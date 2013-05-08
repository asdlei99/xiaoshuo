<?php
!defined('M_COM') && exit('No Permission');
load_cache('rprojects');
@set_time_limit(0);
$datatypearr = array(
	'text' => lang('text'),
	'multitext' => lang('multitext'),
	'htmltext' => lang('htmltext'),
	'image' => lang('image_f'),
	'images' => lang('images'),
	'flash' => lang('flash'),
	'flashs' => lang('flashs'),
	'media' => lang('media'),
	'medias' => lang('medias'),
	'file' => lang('file_f'),
	'files' => lang('files_f'),
	'select' => lang('select'),
	'mselect' => lang('mselect'),
	'date' => lang('date_f'),
	'int' => lang('int'),
	'float' => lang('float'),
);
$limitarr = array(
	'' => lang('nolimitformat'),
	'int' => lang('int'),
	'number' => lang('number'),
	'letter' => lang('letter'),
	'numberletter' => lang('numberletter'),
	'tagtype' => lang('tagtype'),
	'date' => lang('date'),
	'email' => lang('email'),
);
$rpidsarr = array('0' => lang('notremote'));
foreach($rprojects as $rpid => $rproject){
	$rpidsarr[$rpid] = $rproject['cname'];
}
$commonarr = array('1' => lang('based_msg'),'0'=> lang('advancedmes'));

function fieldlist($fname,$field=array(),$mode='ch'){
	global $datatypearr,$chid,$mchid,$matid;
	if($mode == 'ch'){
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"".(!empty($field['mcommon']) || !empty($field['issystem']) ? ' disabled' : '')."></td>\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"fieldsnew[$fname][available]\" value=\"1\"".($field['available'] ? ' checked' : '').(!empty($field['issystem']) ? ' disabled' : '')."></td>\n".
			"<td class=\"txtL\"><input type=\"text\" size=\"25\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC w60\"><input class=\"checkbox\" type=\"checkbox\" name=\"fieldsnew[$fname][isadmin]\" value=\"1\"".(!empty($field['issystem']) ? ' disabled' : '').($field['isadmin'] ? ' checked' : '')."></td>\n".
			"<td class=\"txtC w60\"><input type=\"text\" size=\"4\" name=\"fieldsnew[$fname][vieworder]\" value=\"$field[vieworder]\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w50\"><a href=\"?entry=channels&action=fielddetail&chid=$chid&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a></td>\n".
			"</tr>";
	}elseif($mode == 'fch'){
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"".(!empty($field['issystem']) ? ' disabled' : '')."></td>\n".
			"<td class=\"txtL\"><input type=\"text\" size=\"25\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC w60\"><input class=\"checkbox\" type=\"checkbox\" name=\"fieldsnew[$fname][isadmin]\" value=\"1\"".(!empty($field['issystem']) ? ' disabled' : '').($field['isadmin'] ? ' checked' : '')."></td>\n".
			"<td class=\"txtC w60\"><input type=\"text\" size=\"4\" name=\"fieldsnew[$fname][vieworder]\" value=\"$field[vieworder]\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w50\"><a href=\"?entry=fchannels&action=fielddetail&chid=$chid&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a></td>\n".
			"</tr>";
	}elseif($mode == 'init'){
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"".(empty($field['iscustom']) ? ' disabled' : '')."></td>\n".
			"<td class=\"txtL\"><input type=\"text\" size=\"25\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w60\"><a href=\"?entry=channels&action=initfielddetail&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a></td>\n".
			"</tr>";
	}elseif($mode == 'initm'){
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"".($field['issystem'] ? ' disabled' : '')."></td>\n".
			"<td class=\"txtL\"><input type=\"text\" size=\"25\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w60\">".($field['issystem'] ? lang('system') : "<a href=\"?entry=mchannels&action=initmfielddetail&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a>")."</td>\n".
			"</tr>";
	}elseif($mode == 'member'){
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"".($field['mcommon'] ? ' disabled' : '')."></td>\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"fieldsnew[$fname][available]\" value=\"1\"".($field['available'] ? ' checked' : '').($field['issystem'] ? ' disabled' : '')."></td>\n".
			"<td class=\"txtC\"><input type=\"text\" size=\"20\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w60\"><input class=\"checkbox\" type=\"checkbox\" name=\"fieldsnew[$fname][isadmin]\" value=\"1\"".(!empty($field['issystem']) ? ' disabled' : '').($field['isadmin'] ? ' checked' : '')."></td>\n".
			"<td class=\"txtC w60\"><input type=\"text\" size=\"4\" name=\"fieldsnew[$fname][vieworder]\" value=\"$field[vieworder]\"></td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w50\">".($field['issystem'] ? lang('system') : "<a href=\"?entry=mchannels&action=mfielddetail&mchid=$mchid&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a>")."</td>\n".
			"</tr>";
	}elseif($mode == 'ca'){
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"></td>\n".
			"<td class=\"txtL\"><input type=\"text\" size=\"25\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC w60\"><input type=\"text\" size=\"4\" name=\"fieldsnew[$fname][vieworder]\" value=\"$field[vieworder]\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w60\"><a href=\"?entry=catalogs&action=cafielddetail&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a></td>\n".
			"</tr>";
	}elseif($mode == 'cc'){
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"></td>\n".
			"<td class=\"txtL\"><input type=\"text\" size=\"25\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC w60\"><input type=\"text\" size=\"4\" name=\"fieldsnew[$fname][vieworder]\" value=\"$field[vieworder]\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w60\"><a href=\"?entry=cotypes&action=ccfielddetail&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a></td>\n".
			"</tr>";
	}elseif($mode == 'ma'){
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"></td>\n".
			"<td class=\"txtL\"><input type=\"text\" size=\"25\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w60\"><input class=\"checkbox\" type=\"checkbox\" name=\"fieldsnew[$fname][isadmin]\" value=\"1\"".(!empty($field['issystem']) ? ' disabled' : '').($field['isadmin'] ? ' checked' : '')."></td>\n".
			"<td class=\"txtC w60\"><input type=\"text\" size=\"4\" name=\"fieldsnew[$fname][vieworder]\" value=\"$field[vieworder]\"></td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w60\"><a href=\"?entry=matypes&action=fielddetail&matid=$matid&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a></td>\n".
			"</tr>";
	}elseif(in_array($mode,array('p','o','r','c','b',))){
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"></td>\n".
			"<td class=\"txtL\"><input type=\"text\" size=\"25\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC w60\"><input class=\"checkbox\" type=\"checkbox\" name=\"fieldsnew[$fname][isadmin]\" value=\"1\"".($field['isadmin'] ? ' checked' : '')."></td>\n".
			"<td class=\"txtC w60\"><input type=\"text\" size=\"4\" name=\"fieldsnew[$fname][vieworder]\" value=\"$field[vieworder]\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w50\"><a href=\"?entry=cufields&action=".$mode."fielddetail&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a></td>\n".
			"</tr>";
	}elseif(in_array($mode,array('mf','ml','mc','mr','mb',))){
		$nowarr = array('mf' => 1,'ml' => 2,'mc' => 3,'mr' => 4,'mb' => 5,);
		echo "<tr class=\"txt\">\n".
			"<td class=\"txtC w40\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$fname]\" value=\"$fname\"></td>\n".
			"<td class=\"txtL\"><input type=\"text\" size=\"25\" name=\"fieldsnew[$fname][cname]\" value=\"".mhtmlspecialchars($field['cname'])."\"></td>\n".
			"<td class=\"txtC w60\"><input class=\"checkbox\" type=\"checkbox\" name=\"fieldsnew[$fname][isadmin]\" value=\"1\"".($field['isadmin'] ? ' checked' : '')."></td>\n".
			"<td class=\"txtC w60\"><input type=\"text\" size=\"4\" name=\"fieldsnew[$fname][vieworder]\" value=\"$field[vieworder]\"></td>\n".
			"<td class=\"txtC\">".mhtmlspecialchars($fname)."</td>\n".
			"<td class=\"txtC w100\">".$datatypearr[$field['datatype']]."</td>\n".
			"<td class=\"txtC w50\"><a href=\"?entry=mcufields&action=fielddetail&cu=$nowarr[$mode]&fieldename=$fname\" onclick=\"return floatwin('open_fielddetail',this)\">".lang('detail')."</a></td>\n".
			"</tr>";
	}
}
function fields_order($fields){
	if(empty($fields) || !is_array($fields) || !function_exists('array_multisort')) return $fields;
	foreach($fields as $k => $field){
		if(in_array($field['datatype'],array('int','float','date','select','mselect'))){
			$fields[$k]['dorder'] = '0';
		}elseif(in_array($field['datatype'],array('text','multitext','htmltext'))){
			$fields[$k]['dorder'] = '1';
		}elseif(in_array($field['datatype'],array('image','flash','media','file'))){
			$fields[$k]['dorder'] = '2';
		}else{
			$fields[$k]['dorder'] = '3';
		}
		$dorder[$k] = $fields[$k]['dorder'];
	}
	array_multisort($dorder,SORT_ASC,$fields);
	return $fields;
}
function trspecial($trname,$varname,$value = '',$type = 'htmltext',$mode=0,$guide='',$min=0,$max=0,$width='25%'){
	global $cms_abs,$ftp_url,$cmsurl,$subject_table;
	$addstr = "<div id=\"alert_$varname\" name=\"alert_$varname\" class=\"mistake0\"></div>";
	if($guide) $addstr .= "<div class=\"tips1\">$guide</div>";
	if($type == 'htmltext'){
		if ($mode == 2) {
			echo !$mode ? "<tr><td colspan=\"2\" class=\"txt txtleft fB\">".$trname.$addstr."</td></tr><tr><td colspan=\"2\" class=\"txt txtleft\">\n" : "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td><td class=\" class=\"txt txtleft\">\n";
			echo "<textarea cols=\"80\" id=\"$varname\" name=\"$varname\" rows=\"20\">" . htmlspecialchars(tag2atm($value, 1)) . '</textarea>';
			if($mode) echo $addstr;
			echo "</td></tr>\n";
		} else {
			echo !$mode ? "<tr><td colspan=\"2\" class=\"txt txtleft fB\">".$trname.$addstr."</td></tr><tr><td colspan=\"2\" class=\"txt txtleft\">\n" : "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td><td class=\" class=\"txt txtleft\">\n";
			echo "<textarea cols=\"80\" id=\"$varname\" name=\"$varname\" rows=\"10\">" . htmlspecialchars(tag2atm($value, 1)) . '</textarea>'.
				"<script type=\"text/javascript\">CKEDITOR.replace('$varname',{" . ($mode ? "toolbar : 'simple'" : 'height : 500') . '});</script>';
			if($mode) echo $addstr;
			echo "</td></tr>\n";
		}
	}elseif(in_array($type,array('images','files','medias','flashs'))){
		$type = substr($type,0,strlen($type)-1);
		echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
		echo "<td class=\"txt txtleft\">\n";
		uploadmodule($varname,$value,$type,$mode,$min,$max);
		echo "$addstr</td></tr>\n";
	}elseif($type == 'image'){
		echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
		echo "<td class=\"txt txtleft\">\n";
		singlemodule($varname,$value,'image');
		echo "$addstr</td></tr>\n";
	}elseif(in_array($type,array('file','flash','media'))){
		echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
		echo "<td class=\"txt txtleft\">\n";
		singlemodule($varname,$value,$type,$mode);
		echo "$addstr</td></tr>\n";
	}elseif($type == 'text'){
		if($subject_table && ($varname == 'subject' || strpos($varname,'[subject]')))$addstr = "&nbsp;&nbsp;<input type=\"button\" value=\"".lang('checksubject')."\" onclick=\"checksubject(this,'$subject_table','$varname');\">$addstr";
		echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
		echo "<td class=\"txt txtleft\"><input type=\"text\" size=\"".($mode ? 60 : 20)."\" id=\"$varname\" name=\"$varname\" value=\"".$value."\">$addstr</td></tr>\n";
	}elseif($type == 'multitext'){//
		echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
		echo "<td class=\"txt txtleft\"><textarea rows=\"".($mode ? 10 : 4)."\" id=\"$varname\" name=\"$varname\" id=\"$varname\" cols=\"".($mode ? 100 : 50)."\">".$value."</textarea>$addstr</td></tr>\n";
	}elseif($type == 'select'){
		echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
		echo "<td class=\"txt txtleft\">".($mode ? $value : "<select name=\"$varname\">".$value."</select>")."$addstr</td></tr>\n";
	}elseif($type == 'mselect'){
		echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
		echo "<td class=\"txt txtleft\">".$value."$addstr</td></tr>\n";
	}elseif($type == 'date'){
		echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
		echo "<td class=\"txt txtleft\"><input type=\"text\" id=\"$varname\" size=\"10\" name=\"$varname\" value=\"".$value."\" onclick=\"ShowCalendar(this.id);\">$addstr</td></tr>\n";
	}
}
function uploadmodule($fieldname,$value = '',$mode = 'image',$vp = 0,$min = 0,$max = 0){
	global $localfiles;
	load_cache('localfiles');
	$upfilestr = '';
	${'exts_'.$mode} = implode(',',array_keys($localfiles[$mode]));
	if($value){
		$upfiles = @unserialize($value);
		if(is_array($upfiles)){
			$tmp=$vp && in_array($mode,array('media','flash'))?1:0;
			foreach($upfiles as $upfile){
				$upfile['remote'] = tag2atm($upfile['remote']);
				$upfilestr .= "\n$upfile[remote]|$upfile[title]".($tmp && !empty($upfile['player']) ? "|$upfile[player]" : '');
			}
		}
	}
	echo"<textarea id=\"$fieldname\" name=\"$fieldname\" wrap=\"off\" style=\"width:450px;height:200px;\">$upfilestr</textarea>&nbsp; <input type=\"button\" class=\"uploadbtn\" style=\"vertical-align: top;\" id=\"{$fieldname}select\" value=\"".lang('attachmentedit')."\" onclick=\"uploadwin('{$mode}s','$fieldname','$min','$max',$vp);\">";
}
function singlemodule($varname,$value = '',$mode = 'image',$vp = 0){
	$oldarr = explode('#',$value);
	$oldremote = tag2atm($oldarr[0]);
	global $localfiles;
	load_cache('localfiles');
	${'exts_'.$mode} = implode(',',array_keys($localfiles[$mode]));
	echo "<input type=\"text\" size=\"50\" id=\"$varname\" name=\"$varname\" value=\"$oldremote\">\n<input type=\"button\" class=\"uploadbtn\" id=\"{$varname}select\" value=\"".lang('attachmentedit')."\" onclick=\"uploadwin('$mode','$varname',1,1,$vp);\">\n";
}
function upload_s($newvalue,$oldvalue = '',$mode = 'image',$rpid=0){
	global $c_upload,$db,$tblprefix;
	if(!$newvalue) return '';
	$oldarr = explode('#',$oldvalue);
	$newarr = explode('#',$newvalue);
	if(!$newarr[0]) return '';
	if(basename($newarr[0]) == basename($oldarr[0])) return $oldvalue;
	if(islocal($newarr[0],1)){
		$filename = basename($newarr[0]);
		$newvalue = save_atmurl($newarr[0]);
		if($ufid = $db->result_one("SELECT ufid FROM {$tblprefix}userfiles WHERE filename='$filename' AND aid='0'")) $c_upload->ufids[] = $ufid;
	}else{
		$atm = $c_upload->remote_upload($newarr[0],$rpid);
		$newvalue = $atm['remote'];
		if(($mode == 'image') && !empty($atm['width']) && !empty($atm['height'])){
			$newvalue .= '#'.$atm['width'].'#'.$atm['height'];
			$sized = 1;
		}
	}
	if($mode == 'image'){
		if(empty($sized)){
			$info = @getimagesize(local_atm($newarr[0]));
			$newvalue .= '#'.(empty($info[0]) ? '' : $info[0]).'#'.(empty($info[1]) ? '' : $info[1]);
		}
	}else $newvalue .= !empty($newarr[1]) ? '#'.intval($newarr[1]) : '';
	unset($newarr,$atm,$info);
	return $newvalue;
}
function upload_m($newvalue,$oldvalue = '',$mode = 'image',$rpid=0){
	global $c_upload,$db,$tblprefix;
	if(!$newvalue) return '';
	
	$oldvalue = !$oldvalue ?  array() : unserialize($oldvalue);
	$oldarr = array();
	foreach($oldvalue as $k => $v) $oldarr[basename($v['remote'])] = $v;
	
	$temps = array_filter(explode("\n",$newvalue));
	if(!$temps) return '';
	$newarr = array();
	foreach($temps as $v){
		$v = str_replace(array("\n","\r"),'',$v);
		$row = explode('|',$v);
		$row[0] = trim($row[0]);
		if(!$row[0]) continue;
		$filename = basename($row[0]);
		$atm = array();
		if(array_key_exists($filename,$oldarr)){//旧数据
			$atm = $oldarr[$filename];
		}else{
			if(islocal($row[0],1)){//新的本地文件将附件id得到以便获取与文档的关联
				$atm['remote'] = save_atmurl($row[0]);
				if($info = $db->fetch_one("SELECT ufid,size FROM {$tblprefix}userfiles WHERE filename='$filename' AND aid='0'")){
					$c_upload->ufids[] = $info['ufid'];
					$atm['size'] = $info['size'];
				}
			}else $atm = $c_upload->remote_upload($row[0],$rpid);
		}
		$atm['title'] = empty($row[1]) ? '' : strip_tags($row[1]);
		if(!empty($row[2])) $atm['player'] = intval($row[2]);
		if($mode == 'image' && empty($atm['width']) && $info = @getimagesize(local_atm($row[0]))){//某些情况下的图片尺寸补全
			$atm['width'] = $info[0];
			$atm['height'] = $info[1];
		}
		$atm && $newarr[] = $atm;
	}
	unset($temps,$row,$atm,$info,$oldvalue,$oldarr);
	return $newarr;
}
function rm_filesize($url){
	$url = parse_url($url);
	if($fp = fsockopen($url['host'],empty($url['port']) ? 80 : $url['port'],$error)){
		fputs($fp,"GET ".(empty($url['path']) ? '/' : $url['path'])." HTTP/1.1\r\n");
		fputs($fp,"Host:$url[host]\r\n\r\n");
		while(!feof($fp)){
			$tmp = fgets($fp);
			if(trim($tmp) == ''){
				break;
			}elseif(preg_match('/Content-Length:(.*)/si',$tmp,$arr)){
				return trim($arr[1]);
			}
		}
	}
	return 0;
}

function atm_size($value,$datatype,$mode=0){//使用没有经过addslashes的值,以k为单位
	if(empty($value)) return 0;
	$size = 0;
	if(in_array($datatype,array('image','flash','media','file'))){
		$temps = explode('#',$value);
		if($url = tag2atm($temps[0])) $size = islocal($url) ? filesize(local_file($url)) : rm_filesize($url);
	}elseif(in_array($datatype,array('images','flashs','medias','files'))){
		if($temps = @unserialize($value)){
			foreach($temps as $v){
				if($url = tag2atm($v['remote'])){
					$size += isset($v['size']) ? $v['size'] : (islocal($url) ? filesize(local_file($url)) : rm_filesize($url));
					if($mode) break;
				}
			}
		}
	}
	unset($temps,$url);
	return intval($size / 1024);
}

function atm_byte($value, $datatype){
	return ccstrlen($datatype == 'htmltext' ? html2text($value) : $value);
}
function select_arr($innertext='',$fromcode=0){
	if(!$innertext) return array();
	$rets = array();
	if(!$fromcode){
		$temps = explode("\n",$innertext);
		foreach($temps as $v){
			$temparr = explode('=',str_replace(array("\r","\n"),'',$v));
			$temparr[1] = isset($temparr[1]) ? $temparr[1] : $temparr[0];
			$rets[$temparr[0]] = $temparr[1];
		}
		unset($temps,$temparr);
		
	}else{
		include_once M_ROOT."./dynamic/function/fields.fun.php";
		$rets = @eval($innertext);
	}
	return !$rets ? array() : $rets;
}

?>
