<?php
!defined('M_COM') && exit('No Permission');
@set_time_limit(0);

function m_guide($mguide){
	if(empty($mguide)) return;
	echo "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"2\" class=\"tabmain\">\n".
		"<tr class=\"header\"><td>".lang('guide')."</td></tr>\n".
		"<tr><td class=\"item2\">$mguide</td></tr></table>\n";
}
function m_sites($urlpre = '',$num = 5){
	global $sid,$infloat,$handlekey;
	$sidsarr = array(0 => lang('msite')) + sidsarr(1);
	$i = 0;
	tabheader(lang('selectsite'),'','',$num);
	foreach($sidsarr as $k => $v){
		if(!($i % $num)) echo "<tr>";
		echo "<td class=\"item2\" width=\"".intval(100 / $num)."%\">>>".($sid == $k ? "<b>$v</b>" : "<a href=\"$urlpre".($k ? "&sid=$k" : '')."\"".($infloat?" onclick=\"floatwin('open_$handlekey',this)\"":'').">$v</a>")."</td>\n";
		$i ++;
		if(!($i % $num)) echo "</tr>\n";
	}
	if($i % $num){
		while($i % $num){
			echo "<td class=\"item2\" width=\"".intval(100 / $num)."%\"></td>\n";
			$i ++;
		}
		echo "</tr>\n";
	}
	tabfooter();
}
function noedit($var = '',$otherfbd = 0){
	global $useredits,$freeupdate;
	empty($useredits) && $useredits = array();
	return !$otherfbd && ($freeupdate || in_array($var,$useredits)) ? '' : '&nbsp; <img src="images/common/lock.gif" align="absmiddle">';
}
function murl_nav($arr = array(),$current='',$numpl=8){//针对所选择的链接，高亮当前页
	echo "<div class=\"itemtitle\"><ul class=\"tab1 tab0 bdtop\">\n";
	foreach($arr as $k => $v){
		$nclassstr = 'td24'.($k == $current ? ' current' : '');
		echo "<li".($nclassstr ? " class=\"$nclassstr\"" : '')."><a href=\"$v[1]\"><span>$v[0]</span></a></li>\n";
	}
	echo "</ul></div><div class=\"blank15h\"></div>";
}
function mtabheader($tname='',$fname='',$furl='',$col=2,$fupload=0,$checksubmit=0,$newwin=0, $target = ''){
	global $inajax,$infloat,$ajaxtarget,$handlekey;
	$tablestr = '';
	if($fname){
		$ques = strpos($furl, '?') === false ? '?' : '&';
		$tablestr .= "<form ".($target == '' ? '' : 'target="_blank"')." name=\"$fname\" id=\"$fname\" method=\"post\"".(!$fupload ? "" : " enctype=\"multipart/form-data\"")." action=\"$furl".($infloat?"{$ques}infloat=$infloat&handlekey=$handlekey":'')."\" onsubmit=\"var f=1;".($checksubmit ? "f=check_{$fname}_submit(this);":'').($newwin ? "return f?ajaxform(this):f":'return f')."\">\n";
		$GLOBALS['checkfname']=$fname;
	}
	$tablestr .= "<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\" class=\"tabmain\">\n";
	$tablestr .= "<tr class=\"header\"><td colspan=\"$col\"><b>$tname</b></td></tr>\n";
	echo $tablestr;
}
function mstrbutton($name,$value='',$onclick = ''){
	$value = !$value ? 'submit' : $value;
	return "<input class=\"button\" type='".($onclick ? 'button' : 'submit')."' name=\"$name\" value=\"".lang($value)."\"".($onclick ?  " onclick=\"$onclick\"" : '').">";
}
function mform_str($fname='',$furl='',$col=2,$fupload=0,$checksubmit=0,$newwin=0){
	global $inajax,$infloat,$ajaxtarget,$handlekey;
	$GLOBALS['checkfname']=$fname;
	$ques = strpos($furl, '?') === false ? '?' : '&';
	echo "<form name=\"$fname\" id=\"$fname\" method=\"post\"".(!$fupload ? "" : " enctype=\"multipart/form-data\"")." action=\"$furl".($infloat?"{$ques}infloat=$infloat&handlekey=$handlekey":'')."\" onsubmit=\"var f=1;".($checksubmit ? "f=check_{$fname}_submit(this);":'').($newwin ? "return f?ajaxform(this):f":'return f')."\">\n";
}
function mtabheader_e(){
	echo "<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\" class=\"tabmain\">\n";
}
function mtabfooter($bname='',$bvalue='',$addstr=''){
	$bvalue = empty($bvalue) ? lang('submit') : $bvalue;
	$tablestr = "</table>\n";
	if($bname) $tablestr .= "<input class=\"button\" type=\"submit\" name=\"$bname\" value=\"$bvalue\">\n";
	if($addstr) $tablestr .= $addstr;
	if($bname) $tablestr .= "</form>\n";
	echo $tablestr;
}
function mtrcategory($tdarray = array()){
	$tablestr = "<tr class=\"category\" align=\"center\">\n";
	foreach($tdarray as $v){
		if(is_array($v)){
			$align = " class=\"$v[1]\"";
			$v = $v[0];
		}else{
			$align = '';
		}
		$tablestr .= "<td$align>$v</td>\n";
	}
	$tablestr .= "</tr>\n";
	echo $tablestr;
}
function mtr_regcode($rname){
	global $cms_regcode;
	$submitstr = '';
	if($cms_regcode && in_array($rname,explode(',',$cms_regcode))){
		echo "<tr><td class=\"item1\"><b>".lang('safecode')."</b></td>".
		"<td class=\"item2\"><input type=\"text\" name=\"regcode\" id=\"regcode\" size=\"4\" maxlength=\"4\">&nbsp;&nbsp;".
		"<img src=\"regcode.php\" alt=\"".lang('safetips')."\" style=\"vertical-align: middle;cursor:pointer;\" onclick=\"this.src='regcode.php?t='+(new Date).getTime()\">".
		"<div id=\"alert_regcode\" name=\"alert_regcode\" class=\"red\"></div><font class=\"gray\">".lang('safemark')."</font>".
		"</td></tr>";
		$submitstr = makesubmitstr('regcode',1,'number',4,4);
	}
	return $submitstr;
}
function mtrrange($trname,$arr1,$arr2,$type='text',$guide='',$width = '25%'){
	echo "<tr><td width=\"$width\" class=\"item1\">$trname</td>\n";
	echo "<td class=\"item2\">\n";
	echo (empty($arr1[2]) ? '' : $arr1[2])."<input type=\"text\" size=\"".(empty($arr1[4]) ? 10 : $arr1[4])."\" id=\"$arr1[0]\" name=\"$arr1[0]\" value=\"".mhtmlspecialchars($arr1[1])."\"".($type == 'calendar' ? " onclick=\"ShowCalendar(this.id);\"" : '')."><span id=\"alert_$arr1[0]\" name=\"alert_$arr1[0]\" class=\"red\"></span>".(empty($arr1[3]) ? '' : $arr1[3]).
	(empty($arr2[2]) ? '' : $arr2[2])."<input type=\"text\" size=\"".(empty($arr2[4]) ? 10 : $arr2[4])."\" id=\"$arr2[0]\" name=\"$arr2[0]\" value=\"".mhtmlspecialchars($arr2[1])."\"".($type == 'calendar' ? " onclick=\"ShowCalendar(this.id);\"" : '')."><span id=\"alert_$arr2[0]\" name=\"alert_$arr2[0]\" class=\"red\"></span>".(empty($arr2[3]) ? '' : $arr2[3]).
	(empty($guide) ? '' : "<br /><font class=\"gray\">$guide</font>").
	"</td></tr>";
}
function mtrbasic($trname,$varname,$value = '',$type = 'text',$guide='',$width = '25%') {
	$check = array();
	echo "<tr><td width=\"$width\" class=\"item1\"><b>$trname</b></td>\n";
	echo "<td class=\"item2\">\n";
	if($type == 'radio') {
		$value ? $check['true'] = "checked" : $check['false'] = "checked";
		$value ? $check['false'] = '' : $check['true'] = '';
		echo "<input class=\"radio\" type=\"radio\" name=\"$varname\" value=\"1\" $check[true]> ".lang('yes')." &nbsp; &nbsp; \n".
			"<input class=\"radio\" type=\"radio\" name=\"$varname\" value=\"0\" $check[false]> ".lang('no')." \n";
	}elseif($type == 'select') {
		echo "<select style=\"vertical-align: middle;\" name=\"$varname\">$value</select>";
	}elseif($type == 'text' || $type == 'password' || $type == 'btext'){
		echo "<input type=\"$type\" size=\"".($type == 'btext' ? 50 : 25)."\" id=\"$varname\" name=\"$varname\" value=\"".mhtmlspecialchars($value)."\">\n";
	}elseif($type == 'calendar') {
		echo "<input type=\"$type\" size=\"25\" id=\"$varname\" name=\"$varname\" value=\"".mhtmlspecialchars($value)."\" onclick=\"ShowCalendar(this.id);\">\n";
	}elseif($type == 'textarea' || $type == 'btextarea'){
		$rows = $type == 'textarea' ? 4 : 10;
		$cols = $type == 'textarea' ? 60 : 100;
		echo "<textarea rows=\"$rows\" name=\"$varname\" id=\"$varname\" cols=\"$cols\">".mhtmlspecialchars($value)."</textarea>\n";
	}else{
		echo $value;
	}
	echo "<div id=\"alert_$varname\" name=\"alert_$varname\" class=\"red\"></div>";
	if($guide)echo "<font class=\"gray\">$guide</font>";
	echo "</td></tr>\n";
}
function mtrspecial($trname,$varname,$value = '',$type = 'htmltext',$mode=0,$guide='',$min=0,$max=0,$width='25%'){
	global $cms_abs,$ftp_url,$cmsurl,$subject_table;
	empty($guide) || $guide = "<font class=\"gray\">$guide</font>";
	$alert = "<div id=\"alert_$varname\" name=\"alert_$varname\" class=\"red\"></div>";
	$trname = '<b>'.$trname.'</b>';
	if($type == 'htmltext'){
		echo !$mode ? "<tr><td colspan=\"2\" class=\"item1 item4\">$trname&nbsp;$alert$guide</td></tr><tr><td colspan=\"2\" class=\"item2\">\n" : "<tr><td width=\"$width\" class=\"item1 item4\">$trname&nbsp;$alert<br />$guide</td><td class=\"item2\">\n";
//		include_once M_ROOT.'./include/fckeditor/fckeditor.php';
//		$sBasePath = $cmsurl.'include/fckeditor/';
//		$oFCKeditor = new FCKeditor($varname);
//		$oFCKeditor->BasePath	= $sBasePath;
//		$oFCKeditor->Height		= !$mode ? '500' : '280';
//		$oFCKeditor->Value		= tag2atm($value,1);
//		$oFCKeditor->ToolbarSet	= !$mode ? 'Default' : 'Basic';
//		$oFCKeditor->Create();
		echo "<textarea cols=\"80\" id=\"$varname\" name=\"$varname\" rows=\"10\">" . htmlspecialchars(tag2atm($value, 1)) . '</textarea>'.
			"<script type=\"text/javascript\">CKEDITOR.replace('$varname',{" . ($mode ? "toolbar : 'simple'" : 'height : 500') . '});</script>';
		echo "</td></tr>\n";
	}elseif(in_array($type,array('images','files','medias','flashs'))){
		$type = substr($type,0,strlen($type)-1);
		echo "<tr><td width=\"$width\" class=\"item1\">$trname</td>\n";
		echo "<td class=\"item2\">\n";
		uploadmodule($varname,$value,$type,$mode,$min,$max);
		echo "$alert$guide</td></tr>\n";
	}elseif($type == 'image'){
		echo "<tr><td width=\"$width\" class=\"item1\">$trname</td>\n";
		echo "<td class=\"item2\">\n";
		singlemodule($varname,$value,'image');
		echo "$alert$guide</td></tr>\n";
	}elseif(in_array($type,array('file','flash','media'))){
		echo "<tr><td width=\"$width\" class=\"item1\">$trname</td>\n";
		echo "<td class=\"item2\">\n";
		singlemodule($varname,$value,$type,$mode);
		echo "$alert$guide</td></tr>\n";
	}elseif($type == 'text'){
		if($subject_table && ($varname == 'subject' || strpos($varname,'[subject]')))$alert = "&nbsp;&nbsp;<input type=\"button\" value=\"".lang('checksubject')."\" onclick=\"checksubject(this,'$subject_table','$varname');\">$alert";
		echo "<tr><td width=\"$width\" class=\"item1\">$trname</td>\n";
		echo "<td class=\"item2\"><input type=\"text\" size=\"".($mode ? 60 : 20)."\" id=\"$varname\" name=\"$varname\" value=\"$value\">$alert$guide</td></tr>\n";
	}elseif($type == 'multitext'){//
		echo "<tr><td width=\"$width\" class=\"item1\">$trname</td>\n";
		echo "<td class=\"item2\"><textarea rows=\"".($mode ? 10 : 4)."\" id=\"$varname\" name=\"$varname\" cols=\"".($mode ? 100 : 50)."\">$value</textarea>$alert$guide</td></tr>\n";
	}elseif($type == 'select'){
		echo "<tr><td width=\"$width\" class=\"item1\">$trname</td>\n";
		echo "<td class=\"item2\">".($mode ? $value : "<select name=\"$varname\">$value</select>")."$alert$guide</td></tr>\n";
	}elseif($type == 'mselect'){
		echo "<tr><td width=\"$width\" class=\"item1\">$trname</td>\n";
		echo "<td class=\"item2\">$value$alert$guide</td></tr>\n";
	}elseif($type == 'date'){
		echo "<tr><td width=\"$width\" class=\"item1\">$trname</td>\n";
		echo "<td class=\"item2\"><input type=\"text\" id=\"$varname\" size=\"10\" name=\"$varname\" value=\"$value\" onclick=\"ShowCalendar(this.id);\">$alert$guide</td></tr>\n";
	}
}
function mtrcns($trname,$varname,$value = 0,$sid=0,$coid = 0,$chid = 0,$ism=0,$addstr='',$framein=0){
	mtrbasic($trname,$varname,mcnselect($varname,$value,$sid,$coid,$chid,$ism,$addstr,$framein),'');
}
function mcnselect($varname,$value = 0,$sid=0,$coid = 0,$chid = 0,$ism=0,$addstr='',$framein=0){//$addstr为空时的字符，也是提示性字符//$framein不排除结构性栏目
	global $ca_vmode,$cotypes;
	//不管sid是什么，当前基于$catalogs来操作。
	$vmode = $coid ? @$cotypes[$coid]['vmode'] : $ca_vmode;
	
	if(!$vmode){
		if($coid) {
			$str = "<select style=\"vertical-align: middle;\" name=\"$varname\">".umakeoption(($addstr ? array('0' => array('title' => $addstr)) : array()) + uccidsarr($coid,$chid,$framein,0,$ism),$value)."</select>";
		} else {
			$allMenu = ucaidsarr($chid,$framein,0,$ism);
			//TODO 删除发布小说多于的栏目选项
			unset($allMenu[22]);
			unset($allMenu[24]);
			unset($allMenu[10]);
			unset($allMenu[11]);
			unset($allMenu[12]);
			unset($allMenu[13]);
			unset($allMenu[23]);
			$str = "<select style=\"vertical-align: middle;\" name=\"$varname\">".umakeoption(($addstr ? array('0' => array('title' => $addstr)) : array()) + $allMenu,$value)."</select>";
		}
		
	}elseif($vmode == 1){
		if($coid) $str = umakeradio($varname,($addstr ? array('0' => array('title' => $addstr)) : array()) + uccidsarr($coid,$chid,$framein,1,$ism),$value);
		else $str = umakeradio($varname,($addstr ? array('0' => array('title' => $addstr)) : array()) + ucaidsarr($chid,$framein,1,$ism),$value);
	}else{
		global $catalogs;
		$items = $coid ? read_cache('coclasses',$coid) : $catalogs;
		$str = "<input type=\"hidden\" name=\"$varname\" value=\"$value\"><input onclick=\"cataarea('scatainfo$coid','$varname',$sid,$coid,$chid,$ism,0);return false\" class=\"uploadbtn\" type=\"button\" value=\"".($addstr ? $addstr : lang('p_choose'))."\" />&nbsp; <span id=\"scatainfo$coid\">".@$items[$value]['title']."</span>";
	}

	return $str;
}
function mtrcns_m($trname,$varname,$value = '',$sid =0,$coid = 0,$chid = 0,$addstr='',$framein=0){
	mtrbasic($trname,$varname,mcnselect_m($varname,$value,$sid,$coid,$chid,$addstr,$framein),'');
}
function mcnselect_m($varname,$value = '',$sid = 0,$coid = 0,$chid = 0,$addstr='',$framein=0){//$addstr为空时的字符，也是提示性字符//$framein不排除结构性栏目
	$str = "<input type=\"hidden\" name=\"$varname\" value=\"$value\"><input onclick=\"cataarea('mcatainfo$coid','$varname',$sid,$coid,$chid,0,1);return false\" class=\"uploadbtn\" type=\"button\" value=\"".($addstr ? $addstr : lang('p_choose'))."\" />&nbsp; <span id=\"mcatainfo$coid\"></span>";
	return $str;
}

function mtralbums($trname,$varname,$chid = 0,$isopen = 0){
	mtrbasic($trname,'',"<input type=\"hidden\" id=\"$varname\" name=\"$varname\" /><input type=\"button\" class=\"uploadbtn\" onclick=\"albumarea('albuminfo$isopen','$varname',$chid,0,$isopen,1);return false\" value=\"".lang('albumchoose')."\">&nbsp; <span id=\"albuminfo$isopen\"></span>",'');

}
function mcmessage($key='', $url = ''){
	global $mmsgs,$mmsgforwordtime,$inajax,$infloat,$handlekey,$no_mcfooter,$message_class;
	$msnum = $mmsgforwordtime ? $mmsgforwordtime : 1250;
	$str = @$mmsgs[$key] ? $mmsgs[$key] : $key;
	if(($num = func_num_args())>2){
		$ars = func_get_args();
		array_splice($ars, 1, 1);
		$ars[0] = &$str;
		$str = call_user_func_array('sprintf',$ars);
	}
	$class = empty($message_class) ? 'tabmain' : $message_class;
	if($url) {
		if($infloat){
			if(preg_match('/^javascript:/',$url)){
				$str .= "<script type=\"text/javascript\" reload=\"1\">var t = $msnum;".substr($url,11)."</script>";
			}else{
				$str .= "<br><br><br><a href=\"$url\" onclick=\"return floatwin('update_$handlekey', this);\">".lang('clickhere')."</a><script type=\"text/javascript\" reload=\"1\">setDelay(\"floatwin('update_$handlekey', '$url');\",$msnum);</script>";
			}
		}elseif(!(strpos($url,'history') === false)){
			$str .= "<br><br><a href=\"javascript:$url\">[".lang('rightnowjump')."]</a><script>setTimeout('$url',$msnum);</script>";
		}else $str .= "<br><br><a href=\"$url\">[".lang('rightnowjump')."]</a><script>setTimeout(\"redirect('$url');\",$msnum);</script>";
	}
	$str .= '&nbsp; <a href="javascript:window.history.go(-1);"'.($infloat?" onclick=\"return floatwin('close_$handlekey')\"":'').'>['.lang('返回').']</a>';
	$infloat && print('<div style="position:relative;margin-top:-20px">');
	echo "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\">\n".
		"<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\" align=\"center\" class=\"$class\">\n".
		"<tr class=\"header\"><td>".lang('promptmessage')."</td></tr><tr><td height=\"120\" align=\"center\" valign=\"middle\">$str</td></tr></table>\n".
		"</td></tr></table>\n".
		"<div class=\"blank9\"></div>";
	$infloat && print('</div>');
	if($no_mcfooter){
		if($inajax)afooter();else mexit('</div></div></body></html>');
	}else mcfooter();
}

function mcfooter(){
global $copyright,$cms_power,$cms_icpno,$inajax,$infloat,$cms_version;
	if($inajax){
		afooter();
	}
	if(!$infloat){?>
			<div class="blank9"></div>
		</div></td>
	</tr>
</table>
			</div>
		</div><!--con_con-->
	</div><!--conBox-->
</div>
<div class="blank9"></div>
<div class="area lineheight200 copy">
Copyright &copy; 2008-2012 <a href="http://oa.stawin.com.cn:86" target="_blank">203.171.225.68:86</a> All rights reserved.<br />
Powered by 小说网 v<?=$cms_version?> Code &copy; 2013-2015 203.171.225.68:86 Corporation
</div>
<!--</div>--><?php
}else echo '</div></div>';?>
</body>
</html>
<?php mexit();}?>