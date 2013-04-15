<?php
!defined('M_COM') && exit('No Permission');
@set_time_limit(0);
function autokeyword($str){
	global $a_split;
	$str = preg_replace("/&#?\\w+;/", '', strip_tags($str));
	$result = $a_split->GetIndexText($a_split->SplitRMM($str),100);
	return $result;
}
function sizecount($filesize) {
	if($filesize >= 1073741824) {
		$filesize = round($filesize / 1073741824 * 100) / 100 . ' GB';
	} elseif($filesize >= 1048576) {
		$filesize = round($filesize / 1048576 * 100) / 100 . ' MB';
	} elseif($filesize >= 1024) {
		$filesize = round($filesize / 1024 * 100) / 100 . ' KB';
	} else {
		$filesize = $filesize . ' Bytes';
	}
	return $filesize;
}
function url_str($url='',$title='',$onclickid='',$utitle=''){
	return "<a href=\"$url\"".($utitle ? " title=\"$utitle\"" : '').($onclickid ? " onclick=\"return floatwin('$onclickid',this);\"" : '').">$title</a>";
}
function backallow($name){
	global $a_funcs,$curuser;
	return $curuser->info['isfounder'] || in_array(-1,$a_funcs) || in_array($name,$a_funcs) ? true : false; 
}
function adminlog($action='',$detail=''){
	global $curuser,$timestamp,$onlineip,$grouptypes;
	if(empty($action)) return;
	if($curuser->info['isfounder']){
		$agtname = lang('founder');	
	}else{
		$usergroups = read_cache('usergroups',2);
		$agtname = $usergroups[$curuser->info['grouptype2']]['cname'];	
	}
	$record = mhtmlspecialchars(
		$timestamp."\t".
		$curuser->info['mid']."\t".
		$curuser->info['mname']."\t".
		$agtname."\t".
		$onlineip."\t".
		$action."\t".
		$detail);
	record2file('adminlog',$record);
}
function ordercatalogs(&$catalogs,$pid) {
	$tempids = $ocatalogs = array();
	$tempids = son_ids($catalogs,$pid,$tempids);
	
	foreach($tempids as $tempid) {
		$ocatalogs[$tempid] = $catalogs[$tempid];
	}
	unset($tempids);
	return $ocatalogs;
}
function umakeoption($sarr=array(),$selected=''){
	$optionstr = '';
	foreach($sarr as $k => $v){
		if(isset($v['unsel'])){
			$optionstr .= "<optgroup label=\"$v[title]\" style=\"background-color :#E0ECF2;\"></optgroup>\n";			
		}else $optionstr .= "<option value=\"$k\"".($k == $selected ? ' selected' : '').">$v[title]</option>\n";
	}
	return $optionstr;
}
function umakeradio($varname,$arr=array(),$selectid='',$ppr=0){
	$str = '';
	$i = 0;
	foreach($arr as $k => $v){
		if(empty($v['unsel'])){
			$checked = $selectid == $k || (!$i && $selectid == '') ? 'checked' : '';
			$str .= "<input class=\"radio\" type=\"radio\" name=\"$varname\" id=\"_$varname$k\" value=\"$k\" $checked><label for=\"_$varname$k\">$v[title]</label>";
			$i ++;
			$str .= !$ppr || ($i % $ppr) ? '&nbsp;  &nbsp;' : '<br />';
		}
	}
	return $str;
}
function makeoption($selectarray, $selected='', $defaultstr='') {
	$selectstring = (!$selected && $defaultstr) ? "<option value=\"\">$defaultstr</option>\n" : '';
	if(is_array($selectarray)) {
		foreach($selectarray as $k => $v){
			if($k == $selected && empty($k) == empty($selected)){
				$selectstring .= "<option value=\"$k\" selected>";
			} else {
				$selectstring .= "<option value=\"$k\">";
			}
			$selectstring .= "$v</option>\n";
		}
	}
	return $selectstring;
}
function makeradio($varname,$arr=array(),$selectid='',$ppr=0,$onclick=''){
	$str = '';
	$i = 0;
	foreach($arr as $k => $v){
		$checked = $selectid == $k && empty($k) == empty($selectid) || (!$i && $selectid == '') ? ' checked' : '';
		$checked .= $onclick ? " onclick=\"$onclick\"" : '';
		$str .= "<input class=\"radio\" type=\"radio\" name=\"$varname\" id=\"_$varname$k\" value=\"$k\"$checked><label for=\"_$varname$k\">$v</label>";
		$i ++;
		$str .= !$ppr || ($i % $ppr) ? '&nbsp;  &nbsp;' : '<br />';
	}
	return $str;
}
function makecheckbox($varname,$sarr,$value=array(),$ppr=0,$pad=0){//$ppr每行单元数
	$str = '';
	$i = 0;
	foreach($sarr as $k => $v){
		$checked = in_array($k,$value) ? 'checked' : '';
		$str .= "<input class=\"checkbox\" type=\"checkbox\" name=\"$varname\" id=\"_$varname$k\" value=\"$k\" $checked><label for=\"_$varname$k\">$v</label>";
		$i++;
		$str .= ($ppr && !($i % $ppr)) || ($pad && $i == $pad) ?  '<br />' : '&nbsp;  &nbsp;';
	}
	return $str;
}
function multiselect($varname,$sarray,$value=array(),$width='50%'){
	$value = is_array($value)?$value:array();
	$selectstr = "<select name=\"$varname\" size=\"5\" multiple=\"multiple\" style=\"width:".$width."\">\n";
	if(is_array($sarray)){
		foreach($sarray as $k => $v) {
			if(in_array($k,$value)){
				$selectstr .= "<option value=\"$k\" selected>";
			} else {
				$selectstr .= "<option value=\"$k\">";
			}
			$selectstr .= $v."</option>";
		}
	}
	$selectstr .= "</select>";
	return $selectstr;
}
function autoabstract($str){
	global $autoabstractlength;
	if(!$autoabstractlength || empty($str)) return '';
	$str = str_replace(chr(0xa1).chr(0xa1),' ',html2text($str));
	$str = preg_replace("/&([^;&]*)(;|&)/s",' ',$str);
	$str = preg_replace("/\s+/s",' ',$str);
	return cutstr(trim($str),$autoabstractlength);
}

function multi($num, $perpage, $curpage, $mpurl, $maxpages = 0, $page = 10, $simple = 0, $onclick = '') {
	global $infloat,$handlekey;
	$multipage = '';
	$mpurl .= in_str('?',$mpurl) ? '&amp;' : '?';
	$onclick && $onclick .='(event);';
	$infloat && $onclick .= "return floatwin('open_$handlekey',this)";
	$onclick && $onclick = " onclick=\"$onclick\"";
	if($num > $perpage) {//只有超过1页时，才显示分页导航
		$offset = 2;//当前页码之前显示的页码数

		$realpages = @ceil($num / $perpage);
		$pages = $maxpages && $maxpages < $realpages ? $maxpages : $realpages;//需要统计的页数

		if($page > $pages) {
			$from = 1;
			$to = $pages;
		} else {
			$from = $curpage - $offset;
			$to = $from + $page - 1;
			if($from < 1) {
				$to = $curpage + 1 - $from;
				$from = 1;
				if($to - $from < $page) {
					$to = $page;
				}
			} elseif($to > $pages) {
				$from = $pages - $page + 1;
				$to = $pages;
			}
		}

		$multipage = ($curpage - $offset > 1 && $pages > $page ? '<a href="'.$mpurl.'page=1" class="p_redirect"'.$onclick.'>1...</a>' : '').
			($curpage > 1 && !$simple ? '<a href="'.$mpurl.'page='.($curpage - 1).'" class="p_redirect"><<</a>' : '');
		for($i = $from; $i <= $to; $i++) {
			$multipage .= $i == $curpage ? '<a class="p_curpage">'.$i.'</a>' :
				'<a href="'.$mpurl.'page='.$i.'" class="p_num"'.$onclick.'>'.$i.'</a>';
		}

		$multipage .= ($curpage < $pages && !$simple ? '<a href="'.$mpurl.'page='.($curpage + 1).'" class="p_redirect"'.$onclick.'>>></a>' : '').
			($to < $pages ? '<a href="'.$mpurl.'page='.$pages.'" class="p_redirect"'.$onclick.'>...'.$pages.'</a>' : '').
			(!$simple && $pages > $page ? '<a class="p_pages" style="padding: 0px"><input class="p_input" type="text" name="custompage" onKeyDown="if(event.keyCode==13) {window.location=\''.$mpurl.'page=\'+this.value; return false;}"></a>' : '');

		$multipage = $multipage ? '<div class="p_bar">'.(!$simple ? '<a class="p_total">&nbsp;'.$num.'&nbsp;</a>' : '').$multipage.'</div>' : '';
	}
	return $multipage;
}

function cridsarr($cash=0){
	global $currencys;
	$cridsarr = $cash ? array(0 => lang('cash')) : array();
	foreach($currencys as $crid => $currency) $cridsarr[$crid] = $currency['cname'];
	return $cridsarr;
}
function caidsarr($chid = '0'){
	global $catalogs;
	$caidsarr = array();
	foreach($catalogs as $catalog){
		if(!$chid || ($chid && in_array($chid,array_filter(explode(',',$catalog['chids']))))){
			$space ='';
			for($i=0;$i<$catalog['level'];$i++){
				$space .= '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			}
			$caidsarr[$catalog['caid']] = $space.$catalog['title'];
		}
	}
	return $caidsarr;
}
function fcaidsarr($chid = '0'){
	global $fcatalogs;
	$caidsarr = array();
	foreach($fcatalogs as $catalog) {
		if(!$chid || ($chid == $catalog['chid'])){
			$caidsarr[$catalog['caid']] = $catalog['title'];
		}
	}
	return $caidsarr;
}
function mcaidsarr($nowmstpl=0,$onlyadd=0){//$onlyadd为1时只列出允许添加分类的空间栏目
	global $mcatalogs,$mstpls;
	$caidsarr = array();
	foreach($mcatalogs as $k => $v){
		if($v['maxucid'] || !$onlyadd) $caidsarr[$k] = $v['title'];
	}
	if($nowmstpl) $caidsarr = marray_intersect_key($caidsarr,$mstpls);
	return $caidsarr;
}
function mtcidsarr($mchid = '0'){
	global $mtconfigs;
	$mtcidsarr = array();
	foreach($mtconfigs as $k => $v){
		if(!$mchid || (!empty($v['mchids']) && in_array($mchid,explode(',',$v['mchids'])))){
			$mtcidsarr[$k] = $v['cname'];
		}
	}
	return $mtcidsarr;
}
function pmidsarr($mode = 'aread',$addstr=''){
	global $permissions;
	$pmidsarr = array('0' => !$addstr ? lang('allopen') : $addstr);
	foreach($permissions as $k => $v){
		if(!empty($v[$mode])) $pmidsarr[$k] = $v['cname'];
	}
	return $pmidsarr;
}
function vcaidsarr(){
	global $vcatalogs;
	$caidsarr = array();
	foreach($vcatalogs as $k => $v){
		$caidsarr[$v['caid']] = $v['title'];
	}
	return $caidsarr;
}
function divselect($varname='',$value=0,$coid = 0,$chid=0,$isat=0,$add=''){//$coid为0时是栏目，否则为某个类系。$add为空值字串。
	global $catalogs,$cotypes,$catahidden;
	$ret = '';
	if($coid){
		if(empty($cotypes[$coid])) return $ret;
		$sarr = read_cache('coclasses',$coid);
	}else $sarr = $catalogs;
	foreach($sarr as $k => $v){
		$ids = empty($v[$isat ? 'atids' : 'chids']) ? array() : explode(',',$v[$isat ? 'atids' : 'chids']);
		if($enabled = !$v['isframe'] && (!$chid || in_array($chid,$ids))){
			$sarr[$k]['enabled'] = 1;
			mark_psoned($k,$sarr);
		}
	}
	$str = '';
	foreach($sarr as $k => $v){
		if(empty($catahidden) || !empty($v['enabled']) || !empty($v['soned'])){
			$str .= ",[$v[pid],$k,'$v[title]',".(empty($v['enabled']) ? 0 : 1).']';
		}
	}
	unset($arr);
	if($str){
		$str = substr($str,1);
		$add && $str = "[0,0,'$add',1],".$str;
		$str = '['.$str.']';
		$ret = "<div id=\"select_$varname\"></div><input type=\"hidden\" id=\"$varname\" name=\"$varname\" value=\"$value\" />".
		"<script type=\"text/javascript\" reload=\"1\">var arr=$str;listTree(\$id('select_$varname'),document.getElementById('$varname'),formatList(arr));</script>";
	}
	return $ret;
}
function mark_psoned($id,&$arr){
	$pid = $arr[$id]['pid'];
	while($pid){
		$arr[$pid]['soned'] = 1;
		$pid = $arr[$pid]['pid'];
	}
}
function volidsarr($aid,$cut=1){
	global $db,$tblprefix,$mcharset;
	$volidsarr = array();
	$query = $db->query("SELECT * FROM {$tblprefix}vols WHERE aid=$aid ORDER BY volid");
	while($row = $db->fetch_array($query)) $volidsarr[$row['volid']] = $cut ? cutstr($row['vtitle'],$mcharset == 'utf-8' ? 15 : 10,'..') : $row['vtitle'];
	return $volidsarr;
}
function ucaidsarr($chid = 0,$framein = 0,$nospace = 0,$ism = 0){//$at以合辑类型否则以文档模型
	global $catalogs,$catahidden;
	$caidsarr = array();
	foreach($catalogs as $caid =>$catalog){
		$space ='';
		if(!$nospace) for($i=0;$i<$catalog['level'];$i++) $space .= '&nbsp; ';
		$caidsarr[$caid]['title'] = $space.$catalog['title'];
		$avar = $ism ? 'mchids' : 'chids';
		if(!isset($catalog['chids'])) $catalog = read_cache('catalog',$caid,'',$catalog['sid']);
		$ids = !empty($catalog[$avar]) ? explode(',',$catalog[$avar]) : array();
		if(($chid && !in_array($chid,$ids)) || (!$framein && $catalog['isframe'])){
			if(empty($catahidden)){
				$caidsarr[$caid]['unsel'] = 1;
			}else unset($caidsarr[$caid]);
		}
	}
	return $caidsarr;
}
function uccidsarr($coid,$chid = 0,$framein = 0,$nospace = 0,$ism = 0){
	global $cotypes,$catahidden;
	$ccidsarr = array();
	if(empty($cotypes[$coid])) return $ccidsarr;
	$coclasses = read_cache('coclasses',$coid);
	foreach($coclasses as $ccid => $coclass){
		$space ='';
		if(!$nospace) for($i=0;$i<$coclass['level'];$i++) $space .= '&nbsp; ';
		$ccidsarr[$ccid]['title'] = $space.$coclass['title'];
		$avar = $ism ? 'mchids' : 'chids';
		$ids = !empty($coclass[$avar]) ? explode(',',$coclass[$avar]) : array();
		if(($chid && !in_array($chid,$ids)) || (!$framein && $coclass['isframe'])){
			if(empty($catahidden)){
				$ccidsarr[$ccid]['unsel'] = 1;
			}else unset($ccidsarr[$ccid]);
		}
	}
	unset($coclasses);
	return $ccidsarr;
}
function sidsarr($all=0){
	global $subsites;
	$sidsarr = array();
	foreach($subsites as $subsite){
		if($all || !$subsite['closed']) $sidsarr[$subsite['sid']] = $subsite['sitename'];
	}
	return $sidsarr;
}
function chidsarr($all=0){
	global $channels;
	$chidsarr = array();
	foreach($channels as $k => $v){
		if($all || $v['available']) $chidsarr[$k] = $v['cname'];
	}
	unset($k,$v);
	return $chidsarr;
}
function fchidsarr(){
	global $fchannels;
	$chidsarr = array();
	foreach($fchannels as $k => $v) $chidsarr[$k] = $v['cname'];
	return $chidsarr;
}
function mchidsarr(){
	global $mchannels;
	$chidsarr = array();
	foreach($mchannels as $k => $v) $chidsarr[$k] = $v['cname'];
	return $chidsarr;
}
function ugidsarr($gtid,$mchid=0){
	global $grouptypes,$mchannels;
	$ugidsarr = array();
	if(empty($grouptypes[$gtid])) return $ugidsarr;
	$usergroups = read_cache('usergroups',$gtid);
	foreach($usergroups as $k => $usergroup){
		if(!$mchid || in_array($mchid,explode(',',$usergroup['mchids'])))$ugidsarr[$k] = $usergroup['cname'];
	}
	return $ugidsarr;
}
function cuidsarr($cclass=''){//ch类交互id
	global $commus;
	$cuidsarr = array();
	if(empty($commus)) return $cuidsarr;
	foreach($commus as $k => $v){
		if($v['ch'] && (!$cclass || $cclass == $v['cclass'])){
			$cuidsarr[$k] = $v['cname'];
		}
	}
	return $cuidsarr;
}
function mcuidsarr($cclass=''){//ch类交互id
	global $mcommus;
	$cuidsarr = array();
	if(empty($mcommus)) return $cuidsarr;
	foreach($mcommus as $k => $v){
		if($v['ch'] && (!$cclass || $cclass == $v['cclass'])){
			$cuidsarr[$k] = $v['cname'];
		}
	}
	return $cuidsarr;
}
function mtplsarr($tpclass = 'archive'){
	global $mtpls;
	$mtplsarr = array();
	if(empty($mtpls)) return $mtplsarr;
	foreach($mtpls as $k => $mtpl){
		if($mtpl['tpclass'] == $tpclass){
			$mtplsarr[$k] = $mtpl['cname'];
		}
	}
	return $mtplsarr;
}

function ccidsarr($coid){
	global $cotypes;
	$ccidsarr = array();
	if(empty($cotypes[$coid])) return $ccidsarr;
	$coclasses = read_cache('coclasses',$coid);
	foreach($coclasses as $coclass){
		$space ='';
		for($i=0;$i<$coclass['level'];$i++) $space .= '&nbsp; &nbsp; &nbsp; ';
		$ccidsarr[$coclass['ccid']] = $space.$coclass['title'];
	}
	unset($coclasses);
	return $ccidsarr;
}

function check_submit_func($str=''){
		echo "<script type=\"text/javascript\" reload=\"1\">\n".
		"function check_$GLOBALS[checkfname]_submit(form){\n".
		"try{\n".
		"var i = true,dom,rmsg;\n".
		"clearalerts(form);\n".
		$str.
		"if(!i){alert('".lang('cheforcon')."');}\n return i;\n".
		"}catch(e){alert('".lang('cheforcon')."\\n\\n'+(e.description||e));return false;}\n".
		"}\n".
		"</script>\n";
}
function tabheader($tname='',$fname='',$furl='',$col=2,$fupload=0,$checksubmit=0,$newwin=0){
	$tablestr = '';
	if($fname) $tablestr .= form_str($fname,$furl,$fupload,$checksubmit,$newwin);
	$tablestr .= "<div class=\"conlist1\">$tname</div>";
	$tablestr .= "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\" tb tb2 bdbot\">\n";
	echo $tablestr;
}
function form_str($fname='',$furl='',$fupload=0,$checksubmit=0,$newwin=0){
	global $infloat,$ajaxtarget,$handlekey;
	$GLOBALS['checkfname']=$fname;
	$ques = strpos($furl, '?') === false ? '?' : '&';
	return "<form name=\"$fname\" id=\"$fname\" method=\"post\"".(!$fupload ? "" : " enctype=\"multipart/form-data\"")." action=\"$furl".($infloat?"{$ques}infloat=$infloat&handlekey=$handlekey":'')."\" onsubmit=\"var f=1;".($checksubmit ? "f=check_{$fname}_submit(this);":'').($newwin ? "return f?ajaxform(this):f":'return f')."\">\n";//ajaxpost('$fname', '$ajaxtarget', '$handlekey'".($newwin?",'','',1":'').")
}

function tabheader_e(){
	echo "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\" tb tb2 bdbot\">\n";
}
function tabfooter($bname='',$bvalue='',$addstr='',$fmclose=1){//$fmclose是否关闭form
	$bvalue = empty($bvalue) ? lang('submit') : $bvalue;
	$tablestr = "</table>\n";
	if($bname) $tablestr .= "<br /><input class=\"bigButton\" type=\"submit\" name=\"$bname\" value=\"$bvalue\">\n";
	if($addstr) $tablestr .= $addstr;
	if($bname && $fmclose) $tablestr .= "</form>\n";
	echo $tablestr;
	echo "<div class=\"blank9\"></div>";
}

function trcategory($tdarray = array()){
	$tablestr = "<tr class=\"title txt w40\">\n";
	foreach($tdarray as $v){
		if(is_array($v)){
			$align = " $v[1]";
			$v = $v[0];
		}else{
			$align = ' txtC';
		}
		$tablestr .= "<td class=\"title$align\">$v</td>\n";
	}
	$tablestr .= "</tr>\n";
	echo $tablestr;
}
function trhidden($varname,$value){
	echo "<input type=\"hidden\" name=\"$varname\" value=\"$value\">\n";
}
function viewcheck($name = '',$value = '',$body = '',$noblank = 0){
	return ($noblank ? '' : '&nbsp; &nbsp; ')."<input class=\"checkbox\" type=\"checkbox\" name=\"$name\" value=\"1\" onclick=\"alterview('$body')\"".(empty($value) ? '' : ' checked').">".lang($name);
}
function strbutton($name,$value='',$onclick = ''){
	$value = !$value ? 'submit' : $value;
	return "<input class=\"btn\" type='".($onclick ? 'button' : 'submit')."' name=\"$name\" value=\"".lang($value)."\"".($onclick ?  " onclick=\"$onclick\"" : '').">";
}
function url_nav($title='',$arr = array(),$current='',$numpl=8){//针对所选择的链接，高亮当前页
	$multi = count($arr) < $numpl ? 0 : 1;
	echo "<div class=\"itemtitle\"><h3".(!$multi ? '' : ' class=h3other').">$title</h3><ul class=\"tab1".(!$multi ? '' : '  tab0 bdtop')."\">\n";
	foreach($arr as $k => $v){
		$nclassstr = (!$multi ? '' : 'td24').($k == $current ? ' current' : '');
		echo "<li".($nclassstr ? " class=\"$nclassstr\"" : '')."><a href=\"$v[1]\"><span>$v[0]</span></a></li>\n";
	}
	echo "</ul></div><div class=\"blank15h\"></div>";
}

function makesubmitstr($varname,$notnull = 0,$mlimit = 0,$min = 0,$max = 0,$type = 'text',$regular = ''){
	if(!$notnull && !$mlimit && !$regular && !$min && !$max && $type != 'date') return '';
	$regular = addslashes($regular);
	if($type == 'text'){
		$submitstr = "rmsg = checktext('$varname','$notnull','$mlimit','$regular','$min','$max');\n";
	}elseif($type == 'int'){
		$submitstr = "rmsg = checkint('$varname','$notnull','$regular','$min','$max');\n";
	}elseif($type == 'float'){
		$submitstr = "rmsg = checkfloat('$varname','$notnull','$regular','$min','$max');\n";
	}elseif($type == 'date'){
		$submitstr = "rmsg = checkdate('$varname','$notnull','$min','$max');\n";
	}elseif($type == 'htmltext'){
		$submitstr = "rmsg = checkhtmltext('$varname','$notnull','$min','$max');\n";
	}elseif(in_array($type,array('image','flash','media','file'))){
		$submitstr = "rmsg = checksimple('$varname','$notnull','$mlimit');\n";
	}elseif(in_array($type,array('images','flashs','medias','files'))){
		$submitstr = "rmsg = checkmultiple('$varname','$notnull','$mlimit','$min','$max');\n";
	}elseif($type == 'multitext'){
		$submitstr = "rmsg = checkmultitext('$varname','$notnull','$min','$max');\n";
	}else{
		if(!$notnull)return '';
		$submitstr = "rmsg = checkempty('$varname',form,'$mlimit','$regular','$min','$max');\n";
	}
	return $submitstr . "if(rmsg){\n	if(dom=\$id('alert_$varname'))dom.innerHTML = rmsg;\n	i = false;\n}\n";
}
function choose_url_1($title = '',$id = '',$arr = array(),$onclickid = ''){
	if(empty($arr)) return '-';
	$ret = '<a href="#" id="'.$id.'" onmouseover="showMenu(this.id);">'.$title.'</a><ul class="popupmenu" id="'.$id.'_menu" style="display: none">';
	foreach($arr as $k => $v) $ret .= '<li><a href="'.$v.'"'.($onclickid?" onclick=\"return floatwin('open_$onclickid',this)\"":'').'>'.$k.'</a></li>';
	$ret .= '</ul>';
	return $ret;
}
function tr_abids($varpre,$atid){//得到当前新建文档或合辑允许归入某类个人合辑的列表，只查个人合辑的列表,并且是在合辑类型已经被分析的情况下
	global $db,$tblprefix,$sid,$memberid;
	if(empty($memberid)) return;
	$altype = read_cache('altype',$atid);
	$abidsarr = array(0 => lang('nosetting'));

	$query = $db->query("SELECT aid,subject FROM {$tblprefix}archives WHERE mid='$memberid' AND atid=$atid AND checked=1 AND abover=0 ORDER BY aid DESC LIMIT 0,30");
	while($row = $db->fetch_array($query)){
		$abidsarr[$row['aid']] = $row['subject'];
	}
	count($abidsarr) > 1 && trbasic(lang('setalbum').'&nbsp; -&nbsp; '.$altype['cname'],$varpre.'[]',makeoption($abidsarr),'select');
}
function trchoose($trname,$varname,$chooses,$value = '',$type = '',$guide = '',$width = '25%'){
	$type = !$type ? 'text' : $type;
	echo "<tr><td width=\"$width\" class=\"item1\">".$trname.(!$guide ? '' : "<font class=\"gray\">&nbsp; $guide</font>")."</td>\n";
	echo "<td class=\"item2\">\n";
	echo "<input type=\"$type\" size=\"".($type == 'btext' ? 50 : 25)."\" id=\"$varname\" name=\"$varname\" value=\"".mhtmlspecialchars($value)."\">\n";
	echo "<select name=\"\" onchange=\"javascript:\$id('".$varname."').value = this.value\">".makeoption($chooses)."</select>";
	echo "</td></tr>";
}
function tr_ugids($trname,$varname = 'ugidsnew',$oldarr = array(),$noall=0,$guide='',$width = '25%'){
	global $grouptypes;
	$items = $noall  ? array() : array('-1' => array(lang('allusergroup'),0));
	foreach($grouptypes as $gtid => $grouptype){
		if(!$grouptype['forbidden']){
			$ugids = ugidsarr($gtid);
			foreach($ugids  as $k => $v) $items[$k] = array($v,$gtid);
		}
	}
	echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."<br /><input class=\"checkbox\" type=\"checkbox\" name=\"chkall_$varname\" onclick=\"checkall(this.form, '".$varname."', 'chkall_$varname')\">".lang('selectall')."</td>\n";
	echo "<td class=\"txt txtleft\">\n";
	$oldgtid = 0;
	foreach($items as $k => $v){
		echo ($oldgtid != $v[1] ? '<br />' : '')."<input class=\"checkbox\" type=\"checkbox\" name=\"".$varname."[$k]\" value=\"$k\"".(in_array($k,$oldarr) ? " checked" : "").">$v[0] &nbsp;";
		$oldgtid = $v[1];
	}
	if($guide) echo "<div class=\"tips1\">$guide</div>";
	echo "</td></tr>\n";
}

function ugids_table($title = '',$submit = '',$varname = 'ugidsnew',$oldarr = array(),$ismember = 0){//ismember 0-含游客 1-不含游客 2-只是管理组
	global $grouptypes;
	$num = 4;
	$items = array();
	foreach($grouptypes as $gtid => $grouptype){
		if(!$grouptype['forbidden'] && ($gtid == 2 || $ismember != 2)){
			$ugids = ugidsarr($gtid);
			foreach($ugids  as $k => $v) $items[$k] = $v;
		}
	}
	$ismember != 2 && $items['0'] = lang('user0');
	!$ismember && $items['-1'] = lang('nouser');
	tabheader($title."<input class=\"checkbox\" type=\"checkbox\" name=\"chkall_$varname\" onclick=\"checkall(this.form, '".$varname."', 'chkall_$varname')\">".lang('selectall'),'','',2 * $num);
	$i = 0;
	foreach($items as $ugid => $item){
		if(!($i % $num)) echo "<tr>";
		echo "<td class=\"item1\" width=\"5%\" align=\"center\"><input class=\"checkbox\" type=\"checkbox\" name=\"".$varname."[$ugid]\" value=\"$ugid\"".(in_array($ugid,$oldarr) ? " checked" : "")."></td>\n<td class=\"item2\" width=\"20%\">$item</td>\n";
		$i ++;
		if(!($i % $num)) echo "</tr>\n";
	}
	if($i % $num){
		while($i % $num){
			echo "<td class=\"item1\" width=\"5%\"></td>\n<td class=\"item2\" width=\"20%\"></td>\n";
			$i ++;
		}
		echo "</tr>\n";
	}
	$submit != 'nofooter' && tabfooter($submit);
}
function trrange($trname,$arr1,$arr2,$type='text',$guide='',$width = '25%'){
	echo "<tr><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
	echo "<td class=\"txt txtleft\">\n";
	echo (empty($arr1[2]) ? '' : $arr1[2])."<input type=\"text\" size=\"".(empty($arr1[4]) ? 10 : $arr1[4])."\" id=\"$arr1[0]\" name=\"$arr1[0]\" value=\"".mhtmlspecialchars($arr1[1])."\"".($type == 'calendar' ? " onclick=\"ShowCalendar(this.id);\"" : '')."><span id=\"alert_$arr1[0]\" name=\"alert_$arr1[0]\" class=\"red\"></span>".(empty($arr1[3]) ? '' : $arr1[3]);
	echo (empty($arr2[2]) ? '' : $arr2[2])."<input type=\"text\" size=\"".(empty($arr2[4]) ? 10 : $arr2[4])."\" id=\"$arr2[0]\" name=\"$arr2[0]\" value=\"".mhtmlspecialchars($arr2[1])."\"".($type == 'calendar' ? " onclick=\"ShowCalendar(this.id);\"" : '')."><span id=\"alert_$arr2[0]\" name=\"alert_$arr2[0]\" class=\"red\"></span>".(empty($arr2[3]) ? '' : $arr2[3]);
	if($guide) echo "<div class=\"tips1\">$guide</div>";
	echo "</td></tr>";
}
function tr_regcode($rname){
	global $cms_regcode;
	$submitstr = '';
	if($cms_regcode && in_array($rname,explode(',',$cms_regcode))){
		echo "<tr><td class=\"txt txtright fB borderright\">".lang('regcode')."<font class=\"gray\">&nbsp; ".lang('agregcode')."</font>"."&nbsp; <div id=\"alert_regcode\" name=\"alert_regcode\" class=\"red\"></div></td>".
		"<td class=\"txt txtleft\"><input type=\"text\" name=\"regcode\" id=\"regcode\" size=\"4\" maxlength=\"4\">&nbsp;&nbsp;".
		"<img src=\"regcode.php\" alt=\"".lang('re_regcode')."\" style=\"vertical-align: middle;cursor:pointer;\" onclick=\"this.src='regcode.php?t='+(new Date).getTime()\"></td></tr>";
		$submitstr = makesubmitstr('regcode',1,'number',4,4);
	}
	return $submitstr;
}
function sourcemodule($trname,$svar,$sarr,$svalue,$sview,$idsvar,$idsarr,$idsvalue=array(),$width='25%',$rshow=1, $rowid=''){
	echo "<tr" . ($rowid ? " id=\"$rowid\"" : '') . ($rshow ? '' : ' style="display:none"') . "><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
	echo "<td class=\"txt txtleft\">\n";
	echo "<select style=\"vertical-align: middle;\" name=\"$svar\" onchange=\"checkidsarr(this.value,'$sview','".$idsvar."')\">".makeoption($sarr,$svalue)."</select>";
	echo "<input id=\"$idsvar\" name=\"$idsvar\" onfocus=\"setidswithi(this)\" type=\"\"".($svalue == $sview ? '' : ' style="visibility:hidden"')." value=\"" . implode(',', $idsvalue) . "\" />";
	echo "<br /><select id=\"mselect_$idsvar\" onchange=\"setidswiths(this)\" size=\"5\" multiple=\"multiple\" style=\"display:".($svalue == $sview ? '' : 'none').";width: 40%\">\n";
	foreach($idsarr as $k => $v)  echo "<option value=\"$k\"".(in_array($k,$idsvalue) ? ' selected' : '').">{$v}</option>";
	echo "</select>";
	echo "</td></tr>\n";
}
function tab_list($arr = array(),$num = 2){
	if(empty($arr)) return '';
	$ret = "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">";
	$i = 0;
	$width = floor(100 / $num).'%';
	$tdclass = 'class="txt"';
	foreach($arr as $v){
		if(!($i % $num)) $ret .= "<tr>";
		$ret .= "<td $tdclass width=\"$width\">$v</td>\n";
		$i ++;
		if(!($i % $num)) $ret .= "</tr>\n";
	}
	if($i % $num){
		while($i % $num){
			$ret .= "<td $tdclass width=\"$width\"></td>\n";
			$i ++;
		}
		$ret .= "</tr>\n";
	}
	$ret .= "</table><div class=\"blank9\"></div>\n";
	return $ret;
}

function trbasic($trname,$varname,$value = '',$type = 'text',$guide='',$width = '25%',$rshow = 1, $rowid = '') {
	$check = array();
	echo "<tr" . ($rowid ? " id=\"$rowid\"" : '') . ($rshow ? '' : ' style="display:none"') . "><td width=\"$width\" class=\"txt txtright fB borderright\">".$trname."</td>\n";
	echo "<td class=\"txt txtleft\">\n";
	if($type == 'radio') {
		$value ? $check['true'] = "checked" : $check['false'] = "checked";
		$value ? $check['false'] = '' : $check['true'] = '';
		echo "<input type=\"radio\" class=\"radio\" id=\"$varname\" name=\"$varname\" value=\"1\" $check[true]> ".lang('yes')." &nbsp; &nbsp; \n".
			"<input type=\"radio\" class=\"radio\" id=\"$varname\" name=\"$varname\" value=\"0\" $check[false]> ".lang('no')." \n";
	}elseif($type == 'select') {
		echo "<select style=\"vertical-align: middle;\" id=\"$varname\" name=\"$varname\">$value</select>";
	}elseif($type == 'text' || $type == 'password' || $type == 'btext'){
		echo "<input type=\"$type\" size=\"".($type == 'btext' ? 50 : 25)."\" id=\"$varname\" name=\"$varname\" value=\"".mhtmlspecialchars($value)."\">\n";
	}elseif($type == 'calendar') {
		echo "<input type=\"$type\" size=\"15\" id=\"$varname\" name=\"$varname\" value=\"".mhtmlspecialchars($value)."\" onclick=\"ShowCalendar(this.id);\">\n";
	}elseif($type == 'textarea' || $type == 'btextarea'){
		$rows = $type == 'textarea' ? 4 : 10;
		$cols = $type == 'textarea' ? 60 : 90;
		echo "<textarea rows=\"$rows\" name=\"$varname\" id=\"$varname\" cols=\"$cols\">".mhtmlspecialchars($value)."</textarea>\n";
	}else{
		echo $value;
	}
	echo "<div id=\"alert_$varname\" name=\"alert_$varname\" class=\"mistake0\"></div>";
	if($guide) echo "<div class=\"tips1\">$guide</div>";
	echo "</td></tr>\n";
}
function tralbums($trname,$varname,$chid = 0,$isopen = 0){
	trbasic($trname,'',"<input type=\"hidden\" id=\"$varname\" name=\"$varname\" /><input type=\"button\" class=\"uploadbtn\" onclick=\"albumarea('albuminfo$isopen','$varname',$chid,0,$isopen,1);return false\" value=\"".lang('albumchoose')."\">&nbsp; <span id=\"albuminfo$isopen\"></span>",'');

}
function trcns($trname,$varname,$value = 0,$sid = 0,$coid = 0,$chid = 0,$ism=0,$addstr='',$framein=0){
	trbasic($trname,$varname,cnselect($varname,$value,$sid,$coid,$chid,$ism,$addstr,$framein),'');
}
function cnselect($varname,$value = 0,$sid = 0,$coid = 0,$chid = 0,$ism=0,$addstr='',$framein=0){//$addstr为空时的字符，也是提示性字符//$framein不排除结构性栏目
	global $ca_vmode,$cotypes;
	$vmode = $coid ? @$cotypes[$coid]['vmode'] : $ca_vmode;
	if(!$vmode){
		if($coid) $str = "<select style=\"vertical-align: middle;\" name=\"$varname\">".umakeoption(($addstr ? array('0' => array('title' => $addstr)) : array()) + uccidsarr($coid,$chid,$framein,0,$ism),$value)."</select>";
		else $str = "<select style=\"vertical-align: middle;\" name=\"$varname\">".umakeoption(($addstr ? array('0' => array('title' => $addstr)) : array()) + ucaidsarr($chid,$framein,0,$ism),$value)."</select>";
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
function trcns_m($trname,$varname,$value = '',$sid = 0,$coid = 0,$chid = 0,$addstr='',$framein=0){
	trbasic($trname,$varname,cnselect_m($varname,$value,$sid,$coid,$chid,$addstr,$framein),'');
}
function cnselect_m($varname,$value = '',$sid = 0,$coid = 0,$chid = 0,$addstr='',$framein=0){//$addstr为空时的字符，也是提示性字符//$framein不排除结构性栏目
	$str = "<input type=\"hidden\" name=\"$varname\" value=\"$value\"><input onclick=\"cataarea('mcatainfo$coid','$varname',$sid,$coid,$chid,0,1);return false\" class=\"uploadbtn\" type=\"button\" value=\"".($addstr ? $addstr : lang('p_choose'))."\" />&nbsp; <span id=\"mcatainfo$coid\"></span>";
	return $str;
}
function mu_cnselect($varname,$value = 0,$ucoid = 0,$addstr=''){
	global $ucotypes;
	if(empty($ucotypes[$ucoid])) return '';
	$ucoclasses = read_cache('ucoclasses',$ucoid);
	$uccidsarr = array();
	foreach($ucoclasses as $k => $v) $uccidsarr[$k] = $v['title'];
	if(empty($ucotypes[$ucoid]['vmode'])) $str = "<select style=\"vertical-align: middle;\" name=\"$varname\">".makeoption(($addstr ? array('0' => $addstr) : array()) + $uccidsarr,$value)."</select>";
	else $str = makeradio($varname,($addstr ? array('0' => $addstr) : array()) + $uccidsarr,$value);
	return $str;
}

function a_guide($str){
	@include M_ROOT.'./dynamic/aguides/'.$str.'.php';
	echo "<!--$str-->";
	if(!empty($aguide)){
		echo "<div class=\"blank12\"></div><div class=\"tiShiTitle\">".lang('guide')."</div><table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"txtleft lineheight20 tiShi\">\n".
			"<tr><td>$aguide</td></tr></table>\n";
	}
}
function amessage($key='', $url = '') {
	global $amsgs,$amsgforwordtime,$inajax,$infloat,$handlekey;
	$msnum = $amsgforwordtime ? $amsgforwordtime : 1250;
	$str = @$amsgs[$key] ? $amsgs[$key] : $key;
	if(($num = func_num_args())>2){
		$ars = func_get_args();
		array_splice($ars, 1, 1);
		$ars[0] = &$str;
		$str = call_user_func_array('sprintf',$ars);
	}
	if($url) {
		if($infloat){
			if(preg_match('/^javascript:/',$url)){
				$str .= "<script type=\"text/javascript\" reload=\"1\">var t = $msnum;".substr($url,11)."</script>";
			}else{
				$str .= "<br /><br /><br /><a href=\"$url\" onclick=\"return floatwin('update_$handlekey', this);\">".lang('clickhere')."</a><script type=\"text/javascript\" reload=\"1\">setDelay(\"floatwin('update_$handlekey', '$url');\",$msnum);</script>";
			}
		}elseif(!(strpos($url,'history') === false)){
			$str .= "<br /><br /><br /><a href=\"javascript:$url\">".lang('clickhere')."</a><script>setTimeout('$url',$msnum);</script>";
		}else $str .= "<br /><br /><br /><a href=\"$url\">".lang('clickhere')."</a><script>setTimeout(\"redirect('$url');\",$msnum);</script>";
	}
	$inajax || print("<br /><br /><br /><br /><br /><br />");
	echo "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\">\n".
		"<table width=\"500\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#FFFFFF\" class=\"tabmain\">\n".
		"<tr><td><div class=\"conlist1 bdbot fB\">".lang('prompt_msg')."</div></td></tr>\n".
		"<tr height=\"150\"><td class=\"txtcenter lineheight200\" align=\"center\">$str</td></tr></table>\n".
		"</td></tr></table>\n";
	$inajax || print("<br /><br /><br /><br /><br />\n");
	afooter();
	mexit();
}
function afooter(){
	global $copyright,$cms_power,$inajax,$infloat,$no_afooter;
	if($inajax){
		$s = ob_get_contents(); ob_end_clean();
		$s = preg_replace("/([\x01-\x08\x0b-\x0c\x0e-\x1f])+/", ' ', $s);
		$s = str_replace(array(chr(0), ']]>'), array(' ', ']]&gt;'), $s);
		echo $s.']]></root>';
		mexit();
	}
	if(empty($no_afooter)){
		if(!$infloat){
?>
</div>
<div class="blank9"></div>
<div class="copyFoot">
<?php }?>
</div>
<div class="blank9"></div>
</body>
</html>
<?
	}
}

function aheader() {
	global $mcharset,$inajax,$infloat,$ajaxtarget,$handlekey;
	if($inajax){
		ob_start();
		header("Expires: -1");header("Pragma: no-cache");
		header("Cache-Control: no-store, private, post-check=0, pre-check=0, max-age=0", FALSE);
		header("Content-type: application/xml; charset=$mcharset");
		echo '<?xml version="1.0" encoding="'.$mcharset.'"?><root><![CDATA[';
		return;
	}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?=$mcharset?>">
<link href="./images/admina/contentsAdmin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">var IXDIR = 'images/admina/', charset = '<?=$mcharset?>',allowfloatwin = '<?=$GLOBALS['aallowfloatwin']?>',floatwidth='<?=$GLOBALS['afloatwinwidth']?>',floatheight='<?=$GLOBALS['afloatwinheight']?>'</script>
<script type="text/javascript" src="include/js/langs.js"></script>
<script type="text/javascript" src="include/js/common.js"></script>
<script type="text/javascript" src="include/js/admina.js"></script>
<script type="text/javascript" src="include/js/floatwin.js"></script>
<script type="text/javascript" src="include/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="include/js/calendar.js"></script>
<script type="text/javascript" src="include/js/tree.js"></script>
</head>
<body style="overflow-x:hidden;">
<div id="append_parent"></div>

<?
	print($infloat ? '<div class="floatBox">' : '<div class="blank9"></div><div class="mainBox">');
}
?>