<?php
!defined('M_COM') && exit('No Permission');
load_cache('fcatalogs,fchannels,currencys,');
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/fields.cls.php";
include_once M_ROOT."./include/upload.cls.php";
include_once M_ROOT."./include/farcedit.cls.php";
if(empty($caid)){
	$nmuid = empty($nmuid) ? 0 : $nmuid;
	$u_checked = $u_valid = -1;
	if($nmuid && $u_url = read_cache('murl',$nmuid)){
		$u_tplname = $u_url['tplname'];
		$u_onlyview = empty($u_url['onlyview']) ? 0 : 1;
		$u_mtitle = $u_url['mtitle'];
		$u_guide = $u_url['guide'];
		$vars = array('caids');
		foreach($vars as $var) if(!empty($u_url['setting'][$var])) ${'u_'.$var} = explode(',',$u_url['setting'][$var]);
	}
	if(!empty($u_caids)) foreach($fcatalogs as $k => $v) if(!in_array($k,$u_caids)) unset($fcatalogs[$k]); 
	if(empty($u_tplname)){
		$num = 4;
		$i = 0;
		mtabheader(empty($u_mtitle) ? lang('addfreeinfo') : $u_mtitle,'','',$num);
		foreach($fcatalogs as $caid => $fcatalog){
			$fcatalog = read_cache('fcatalog',$caid);
			if($curuser->pmbypmids('fadd',$fcatalog['apmid'])){
				if(!($i % $num)) echo "<tr align=\"center\">";
				echo "<td class=\"item\" width=\"".(intval(100 / $num))."%\"><a href=\"?action=farchiveadd&caid=$caid\" onclick=\"return floatwin('open_farchiveadd',this)\">$fcatalog[title]</a></td>\n";
				$i ++;
				if(!($i % $num)) echo "</tr>\n";
			}
		}
		if($i % $num){
			while($i % $num){
				echo "<td class=\"item\" width=\"".(intval(100 / $num))."%\"></td>\n";
				$i ++;
			}
			echo "</tr>\n";
		}
		mtabfooter();
		m_guide(@$u_guide);
	}else include(M_ROOT.$u_tplname);

}else{
	$caid = max(0,intval($caid));
	if(!$caid || !($fcatalog = read_cache('fcatalog',$caid))) mcmessage('choosemessagecoclass');
	if(empty($fcatalog['ucadd'])){
		!$curuser->checkforbid('issue') && mcmessage('userisforbid');
		!$curuser->pmbypmids('fadd',$fcatalog['apmid']) && mcmessage('nococlassaddpermi');
		$chid = $fcatalog['chid'];
		$fields = read_cache('ffields',$chid);
		$forward = empty($forward) ? M_REFERER : $forward;
		$forwardstr = '&forward='.urlencode($forward);
		if(!submitcheck('bfarchiveadd')){
			$a_field = new cls_field;
			mtabheader(lang('add').$fcatalog['title'],'farchiveadd',"?action=farchiveadd&caid=$caid$forwardstr",2,1,1,1);
			$submitstr = '';
			$subject_table = 'farchives';
			foreach($fields as $k => $field){
				if(!$field['isadmin'] && !$field['isfunc']){
					$a_field->init(1);
					$a_field->field = read_cache('ffield',$chid,$k);
					$a_field->isadd = 1;
					$a_field->trfield('farchiveadd');
					$submitstr .= $a_field->submitstr;
				}
			}
			unset($a_field);
			if(empty($fcatalog['nodurat'])){
				foreach(array('startdate','enddate') as $var){
					mtrbasic(lang($var),"farchiveadd[$var]",'','calendar');
					$submitstr .= makesubmitstr("farchiveadd[$var]",0,0,0,0,'date');
				}
			}
			$submitstr .= mtr_regcode('farchive');//ÏÔÊ¾ÑéÖ¤Âë
			mtabfooter('bfarchiveadd');
			check_submit_func($submitstr);
		}else{
			if(!regcode_pass('farchive',empty($regcode) ? '' : trim($regcode))) mcmessage('safecodeerr',axaction(2,M_REFERER));
			$c_upload = new cls_upload;	
			$fields = fields_order($fields);
			$a_field = new cls_field;
			$sqlcommon = "caid='$caid',chid='$chid',mid='".$curuser->info['mid']."',mname='".$curuser->info['mname']."',createdate='$timestamp',updatedate='$timestamp'";
			$sqlcustom = "";
			foreach($fields as $k => $field){
				if(!$field['isadmin'] && !$field['isfunc']){
					$a_field->init(1);
					$a_field->field = read_cache('ffield',$chid,$k);
					$a_field->deal('farchiveadd');
					if(!empty($a_field->error)){
						$c_upload->rollback();
						mcmessage($a_field->error,axaction(2,M_REFERER));
					}
					$farchiveadd[$k] = $a_field->newvalue;
					if($field['issystem']){
						$sqlcommon .= ",$k='".$farchiveadd[$k]."'";
					}else $sqlcustom .= ($sqlcustom ? ',' : '')."$k='".$farchiveadd[$k]."'";
				}
			}
			unset($a_field);
			if(empty($fcatalog['nodurat'])){
				foreach(array('startdate','enddate') as $var){
					$farchiveadd[$var] = trim($farchiveadd[$var]);
					$farchiveadd[$var] = !isdate($farchiveadd[$var]) ? 0 : strtotime($farchiveadd[$var]);
					$sqlcommon .= ",$var='".max(0,intval($farchiveadd[$var]))."'";
				}
			}
			$db->query("INSERT INTO {$tblprefix}farchives SET ".$sqlcommon);
			if(!($aid = $db->insert_id())){
				$c_upload->closure(1);
				mcmessage('msgsaveerr',axaction(2,M_REFERER));
			}else{
				$c_upload->closure(1, $aid, 'farchives');
				$sqlcustom = "aid=$aid".($sqlcustom ? ','.$sqlcustom : '');
				$db->query("INSERT INTO {$tblprefix}farchives_$chid SET ".$sqlcustom);
				$aedit = new cls_farcedit;
				$aedit->set_aid($aid);
				$fcatalog['autocheck'] && $aedit->arc_check(1,0);
				$aedit->updatedb();
				unset($aedit);
			}
			$c_upload->saveuptotal(1);
			mcmessage('freeinfoaddfinish',axaction(10,$forward));
		
		}
	}else include(M_ROOT.$fcatalog['ucadd']);
}
?>
