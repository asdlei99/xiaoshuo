<?
include_once M_ROOT.'./include/notice.cls.php';
include_once M_ROOT.'./include/archive.fun.php';
include_once M_ROOT."./include/arc_static.fun.php";

load_cache('cotypes');
class cls_arcedit{
	var $aid = 0;
	var $archive = array();
	var $basiced = 0;
	var $detailed = 0;
	var $auser = '';
	var $channel = array();
	var $fields = array();
	var $namepres = array();//�ݴ�txt�ֶε��ļ���
	var $updatearr = array();
	var $ocnstr = '';
	
	function __construct(){
		$this->cls_arcedit();
	}
	function cls_arcedit(){
	}
	function init(){
		$this->aid = 0;
		$this->archive = array();
		$this->auser = '';
		$this->basiced = 0;
		$this->detailed = 0;
		$this->channel = array();
		$this->fields = array();
		$this->namepres = array();
		$this->updatearr = array();
		$this->ocnstr = '';
	}
	function set_aid($aid){
		$this->aid = max(0,intval($aid));
	}
	function readcopy($acid){//ֻ�ǽ��������ѱ���������滻��ǰ�ı�������
		global $db,$tblprefix;
		if(empty($acid)) return;
		if(!($datas = $db->result_one("SELECT datas FROM {$tblprefix}acopys WHERE acid='$acid'"))) return;
		$datas = empty($datas) ? array() : unserialize($datas);
		foreach($datas as $k => $v) $this->archive[$k] = $v;
		$this->basiced = $this->detailed = 1;
		unset($datas);
	}
	function cnstr(){//�õ���Ŀ�ִ��������ھ�̬֪ͨϵͳ��
		global $cotypes,$cmsinfos;
		include_once M_ROOT."./include/cparse.fun.php";
		$arr = array();
		$arr['caid'] = $this->archive['caid'];
		foreach($cotypes as $k => $cotype){
			$this->archive["ccid$k"] && $arr['ccid'.$k] = $this->archive["ccid$k"];
		}
		$cnstr = cnstr($arr);
		unset($arr);
		return $cnstr;
	}
	function basic_data($auser=1){
		global $db,$tblprefix,$catalogs,$channels,$enablestatic;
		if(empty($this->aid) || $this->basiced) return;
		if(!$this->archive = $db->fetch_one("SELECT a.*,s.*,r.* FROM {$tblprefix}archives a LEFT JOIN {$tblprefix}archives_sub s ON s.aid=a.aid LEFT JOIN {$tblprefix}archives_rec r ON r.aid=a.aid WHERE a.aid=".$this->aid)){
			$this->init();
			return;
		}
		$this->channel = read_cache('channel',$this->archive['chid']);
		$this->fields = read_cache('fields',$this->archive['chid']);
		$this->fetch_txt(0);
		$enablestatic && $this->ocnstr = $this->cnstr();
		if($auser){
			$this->auser = new cls_userinfo;
			$this->auser->activeuser($this->archive['mid']);
		}
		$this->basiced = 1;
	}
	function detail_data($auser=1){
		global $db,$tblprefix;
		if(empty($this->aid) || $this->detailed) return;
		$this->basic_data($auser);
		$customtable = 'archives_'.$this->archive['chid'];
		if($archive = $db->fetch_one("SELECT * FROM {$tblprefix}$customtable WHERE aid='".$this->aid."'")){
			$this->archive = array_merge($archive,$this->archive);
		}
		unset($archive);
		$this->fetch_txt(1);
		$this->detailed = 1;
	}
	function set_cpid($id){
		$this->updatefield('cpid',$id ? $id : $this->aid,'main');
	}
	function set_arcurl(){
		global $subsites,$catalogs,$arccustomurl;
		$this->basic_data();
		$catalog = read_cache('catalog',$this->archive['caid'],$this->archive['sid']);
		$arcurl = empty($catalog['customurl']) ? (empty($arccustomurl) ? '{$y}{$m}/{$aid}/{$addno}_{$page}.html' : $arccustomurl) : $catalog['customurl'];
		$source = array('chid' => $this->archive['chid'],'aid' => $this->archive['aid'],'page' => 1,'y' => date('Y',$this->archive['createdate']),'m' => date('m',$this->archive['createdate']),'d' => date('d',$this->archive['createdate']),'h' => date('H',$this->archive['createdate']),'i' => date('i',$this->archive['createdate']),'s' => date('s',$this->archive['createdate']),);
		$arcurl = m_parseurl($arcurl,$source);
		
		$addnos = array('','1','2');
		$plus_mode = 'set_arcurl';@include M_ROOT."./include/arcplus.inc.php";
		$basedir = arc_basedir($this->archive);
		foreach($addnos as $k){
			$arcfile = $basedir.m_parseurl($arcurl,array('addno' => $k,));
			mmkdir($arcfile,0,1);
			arc_blank($this->aid,$k,$arcfile);
		}
		unset($source,$arcurl,$basedir,$arcfile);
	}
	function fetch_txt($detail = 0){
		foreach($this->fields as $k => $v){
			if(!empty($v['istxt']) && isset($this->archive[$k]) && ((!$detail && $v['tbl'] == 'main') || ($detail && $v['tbl'] == 'custom'))){
				$this->namepres[$k] = $this->archive[$k];
				$this->archive[$k] = readfromtxt($this->archive[$k]);
			}
		}
	}
	function addcopy($coid=0,$ccid=0){//���Ƶ�ĳ����Ŀ��ĳ�������У������ķ�����δ�����?�Ǳ��ֻ��Ƿ���//��ϵ����Ҫһ�����������������Ƿ���Ҫ�������ԡ�
		global $cotypes,$timestamp,$db,$tblprefix,$c_notice,$arc;
		if(!$ccid) return false;
		$this->detail_data();
		$archivenew = &$this->archive;
		if($archivenew[$coid ? "ccid$coid" : 'caid'] == $ccid) return false;
		$chid = $archivenew['chid'];
		foreach(array('coidscp','cpkeeps') as $var) $$var = $this->channel[$var] ? explode(',',$this->channel[$var]) : array();
		if(!in_array($coid ? $coid : 'caid',$coidscp)) return false;

		$pre_cns = array('caid' => $coid ? $this->archive['caid'] : $ccid);//���Ƶ�������ϵʱ��ԭ��ĿҪ����
		foreach($cotypes as $k => $v){//����Ҫ���ֵ���ϵ��
			if(!$v['self_reg'] && in_array($k,$cpkeeps)){
				if($coid != $k){
					$archivenew["ccid$k"] && $pre_cns["ccid$k"] = $archivenew["ccid$k"];
				}else $pre_cns["ccid$k"] = $ccid;
			}
		}
		if(!$this->auser->allow_arcadd($archivenew['chid'],$pre_cns)) return false;
		$sqlmain = $sqlsub = $sqlcustom = '';
		foreach($pre_cns as $k => $v) $sqlmain .= ($sqlmain ? ',' : '')."$k='$v'";
		$keeps = array('sid','chid','mid','mname','rpmid','dpmid','salecp','fsalecp','atmsize','enddate',);
		foreach($keeps as $k) $sqlmain .= ($sqlmain ? ',' : '')."$k='".addslashes($archivenew[$k])."'";
		$sqlmain .= ($sqlmain ? ',' : '')."refreshdate='$timestamp',createdate='$timestamp'";

		$fields = read_cache('fields',$chid);
		foreach($fields as $k => $field){
			if($field['available'] && !$field['isfunc']){
				if(!empty($field['istxt'])){
					$txtname = saveastxt($archivenew[$k]);
					${'sql'.$field['tbl']} .= (${'sql'.$field['tbl']} ? ',' : '').$k."='".addslashes($txtname)."'";
				}else ${'sql'.$field['tbl']} .= (${'sql'.$field['tbl']} ? ',' : '').$k."='".addslashes($archivenew[$k])."'";
			}
		}

		cu_sqls_deal($this->channel['cuid'],$archivenew,$sqlmain,$sqlsub,$sqlcustom);//���ֶ�֮��Ľ�������д��
		$db->query("INSERT INTO {$tblprefix}archives SET ".$sqlmain);
		if(!$aid = $db->insert_id()){
			return false;
		}else{
			$db->query("INSERT INTO {$tblprefix}archives_rec SET aid='$aid'");
			$sqlsub = "aid='$aid',needstatic='$timestamp'".($sqlsub ? ',' : '').$sqlsub;
			$sqlsub .= ",needstatic1='$timestamp'";
			$sqlsub .= ",needstatic2='$timestamp'";
			$plus_mode = 'needstatic_1';@include M_ROOT."./include/arcplus.inc.php";
			$sqlsub .= ",arctpl='".$archivenew['arctpl']."'";
			$sqlsub .= ",arctpl1='".$archivenew['arctpl1']."'";
			$sqlsub .= ",arctpl2='".$archivenew['arctpl2']."'";
			$plus_mode = 'addcopy';@include M_ROOT."./include/arcplus.inc.php";
			$db->query("INSERT INTO {$tblprefix}archives_sub SET ".$sqlsub);
			$sqlcustom = "aid='$aid'".($sqlcustom ? ',' : '').$sqlcustom;
			$db->query("INSERT INTO {$tblprefix}archives_$chid SET ".$sqlcustom);
			$this->auser->basedeal('archive',1);

			$c_notice = new cls_notice;//֪ͨ�ĵ����¼�¼
			$aedit = new cls_arcedit;
			$aedit->set_aid($aid);
			$aedit->set_arcurl();
			$aedit->set_cpid(empty($archivenew['cpid']) ? $this->aid : $archivenew['cpid']);
			if($this->channel['autocheck']) $aedit->arc_check(1,0);
			$aedit->updatedb();
			unset($aedit);
			$c_notice->deal();//֪ͨ�ĵ����¼�¼

			if($this->channel['autostatic']){
				arc_static($aid);
				unset($arc);
			}
		}
		return true;
	}
	function updatecopy($mode=0){//�������ĵ�ʱ��ͬʱ���������ĸ�����
		global $cotypes,$timestamp,$db,$tblprefix,$c_notice,$arc;
		if(!$mode) return false;
		$cpids = array();
		$naid = $this->aid;
		$query = $db->query("SELECT aid FROM {$tblprefix}archives WHERE aid != '$naid' AND cpid='".$this->archive['cpid']."'");
		while($row = $db->fetch_array($query)) $cpids[] = $row['aid'];
		if(!$cpids) return false;

		$this->init();
		$this->set_aid($naid);
		$this->detail_data();
		$archivenew = &$this->archive;
		$archivenew = maddslashes($archivenew);
		$chid = $archivenew['chid'];
		$fields = read_cache('fields',$chid);

		$aedit = new cls_arcedit;
		foreach($cpids as $aid){
			$aedit->set_aid($aid);
			$aedit->detail_data();

			$aedit->updatefield('rpmid',$archivenew['rpmid'],'main');
			$aedit->updatefield('dpmid',$archivenew['dpmid'],'main');
			$aedit->updatefield('salecp',$archivenew['salecp'],'main');
			$aedit->updatefield('fsalecp',$archivenew['fsalecp'],'main');
			$aedit->sale_define();
			$aedit->updatefield('arctpl',$archivenew['arctpl'],'sub');
			$aedit->updatefield('arctpl1',$archivenew['arctpl1'],'sub');
			$aedit->updatefield('arctpl2',$archivenew['arctpl2'],'sub');
			$plus_mode = 'updatecopy';@include M_ROOT."./include/arcplus.inc.php";
	
			foreach($fields as $k => $field){
				if($field['available'] && !$field['isfunc'] && (!in_array($k,array('subject','keywords','thumb','abstract',)) || $mode == 1)){
					if(!empty($field['istxt'])){
						$txtname = saveastxt(stripslashes($archivenew[$k]),$aedit->namepres[$k]);
						$aedit->updatefield($k,$txtname,$field['tbl']);
					}else $aedit->updatefield($k,$archivenew[$k],$field['tbl']);
				}
			}
			$this->channel['autocheck'] && $aedit->arc_check('1');
			$c_notice = new cls_notice;
			$aedit->updatedb();
			$c_notice->deal();
			if($this->channel['autostatic']){
				arc_static($aid);
				unset($arc);
			}
			$aedit->init();
		}
		return true;
	}
	function edit_cudata(&$newarr,$updateuser=0){//�Ƿ���»�Ա���ݿ�
		//���Ǹ��������ĵ����ݿ�ĺ�������Ҫ�������������¶�������
		//�����ĵ��޸�ʱ�Թ�֤���޸Ļ��Ϲ�֤��¼
		global $commus,$db,$tblprefix,$timestamp,$enableship,$enablestock,$useredits;
		if(!$this->channel['cuid'] || !($commu = read_cache('commu',$this->channel['cuid']))) return;
		if($commu['cclass'] == 'answer'){
			if(!$this->archive['checked']){
				if(isset($newarr['currency'])) $this->updatefield('currency',$newarr['currency'],'main');//$u_lists֮��
			}else{
				if(isset($newarr['currency']) && (empty($useredits) || in_array('currency',$useredits))){
					if(($newarr['currency'] > $this->archive['currency']) && $this->auser->crids_enough(array($this->archive['crid'] => $newarr['currency'] - $this->archive['currency']))){
						$this->auser->updatecrids(array($this->archive['crid'] => $this->archive['currency'] - $newarr['currency']),$updateuser,lang('answer_reward'));
						$this->updatefield('currency',$newarr['currency'],'main');
						$this->updatefield('spare',$this->archive['spare'] + ($newarr['currency'] - $this->archive['currency']),'sub');
					}
				}
			}
			if(isset($newarr['question']) && (!$this->archive['checked'] || empty($useredits) || in_array('question',$useredits))){
				$this->updatefield('question',$newarr['question'],'custom');
			}
		}elseif($commu['cclass'] == 'purchase'){
			if(isset($newarr['price']) && (!$this->archive['checked'] || empty($useredits) || in_array('price',$useredits))){
				$this->updatefield('price',$newarr['price'],'main');
			}
			if(isset($newarr['storage']) && (!$this->archive['checked'] || empty($useredits) || in_array('storage',$useredits))){
				$enablestock && $this->updatefield('storage',$newarr['storage'],'sub');
			}
		}
	}
	function new_cudata($updateuser=0){//�Ƿ���»�Ա���ݿ�//Ӧ����˵�ʱ��Ϊ׼
		global $commus,$db,$tblprefix,$timestamp;
		if(!$this->channel['cuid'] || !($commu = read_cache('commu',$this->channel['cuid']))) return true;
		if($commu['cclass'] == 'answer'){
			if(!$this->auser->crids_enough(array($this->archive['crid'] => $this->archive['currency']))) return false;
			//closed,crid,currency,finishdate������
			$commu['setting']['vdays'] = empty($commu['setting']['vdays']) ? 0 : $commu['setting']['vdays'];
			$this->updatefield('finishdate',$timestamp + $commu['setting']['vdays'] * 24 *3600,'main');
			$this->updatefield('spare',$this->archive['currency'],'sub');
			$this->auser->updatecrids(array($this->archive['crid'] => -$this->archive['currency']),$updateuser,lang('answer_reward'));
		}
		return true;
	}
	function autokeyword($updatedb=0){
		$this->detail_data();
		$fields = read_cache('fields',$this->archive['chid']);
		if($fields['keywords']['available'] && $this->channel['autokeyword'] && empty($this->archive['keywords']) && !empty($this->archive[$this->channel['autokeyword']])){
			$keywords = autokeyword($this->archive[$this->channel['autokeyword']]);
			$this->updatefield('keywords',keywords(addslashes($keywords)),'main');
		}
		unset($fields,$keywords);
		$updatedb && $this->updatedb();
	}
	function autoabstract($updatedb=0){
		$this->detail_data();
		$fields = read_cache('fields',$this->archive['chid']);
		if($fields['abstract']['available'] && $this->channel['autoabstract'] && empty($this->archive['abstract']) && !empty($this->archive[$this->channel['autoabstract']])){
			$this->updatefield('abstract',addslashes(autoabstract($this->archive[$this->channel['autoabstract']])),'main');
		}
		unset($fields);
		$updatedb && $this->updatedb();
	}
	function autosize($updatedb=0){
		$this->detail_data();
		if($this->channel['autosize'] && isset($this->archive[$this->channel['autosize']])){
			$fields = read_cache('fields',$this->archive['chid']);
			$this->updatefield('atmsize',addslashes(atm_size($this->archive[$this->channel['autosize']],$fields[$this->channel['autosize']]['datatype'],$this->channel['autosizemode'])),'main');
		}
		unset($fields);
		$updatedb && $this->updatedb();
	}
	function autothumb($updatedb=0){
		global $c_upload;
		$this->detail_data();
		$fields = read_cache('fields',$this->archive['chid']);
		if($fields['thumb']['available'] && $this->channel['autothumb'] && empty($this->archive['thumb']) && !empty($this->archive[$this->channel['autothumb']])){
			$field = read_cache('field',$this->archive['chid'],'thumb');
			$thumb = $c_upload->thumb_pick($this->archive[$this->channel['autothumb']],$fields[$this->channel['autothumb']]['datatype'],$field['rpid']);
			$this->updatefield('thumb',addslashes($thumb),'main');
		}
		unset($fields,$field);
		$updatedb && $this->updatedb();
	}
	function clear_cudata($updateuser=0){//�����ڽ���Ĳ�����//��ʵҲ����ɾ���Ĳ�����
		global $commus,$db,$tblprefix,$timestamp;
		if(!$this->channel['cuid'] || !($commu = read_cache('commu',$this->channel['cuid']))) return;
		if($commu['cclass'] == 'answer'){
			$this->auser->updatecrids(array($this->archive['crid'] => $this->archive['spare']),$updateuser,lang('answer_reward'));
			$this->updatefield('spare',0,'sub');
		}
	}
	function arc_check($check=1,$updatedb=0){//$checkִ����˻����Ĳ���
		global $cotypes,$curuser,$vcps,$timestamp;
		if(empty($this->aid)) return;
		$this->basic_data();
		if($check){
			if($this->archive['checked']) return;
			$catalog = read_cache('catalog',$this->archive['caid'],'',$this->archive['sid']);
			if(!$this->new_cudata(0)) return;
			$this->auser->basedeal('check',1);
			$crids = array();
			if(@!empty($vcps['award'][$catalog['awardcp']])){
				$cparr = explode('_',$catalog['awardcp']);
				$crids[$cparr[0]] = $cparr[1];
			}
			foreach($cotypes as $coid => $cotype){
				if(!empty($this->archive["ccid$coid"]) && $cotype['awardcp']){
					$coclass = read_cache('coclass',$coid,$this->archive["ccid$coid"]);
					if(@!empty($vcps['award'][$coclass['awardcp']])){
						$cparr = explode('_',$coclass['awardcp']);
						$crids[$cparr[0]] = isset($crids[$cparr[0]]) ? $crids[$cparr[0]] + $cparr[1] : $cparr[1];
					}
				}
			}
			unset($coclass,$catalog);
			if($crids){
				if(!$this->auser->crids_enough($crids)) return;
				$this->auser->updatecrids($crids,0,lang('awardcurrency'));			
			}
			$this->updatefield('overupdate',0,'sub');
			$this->updatefield('needupdate',0,'sub');
		}else{
			if(!$this->archive['checked']) return;
			$this->auser->basedeal('check',0);
			$this->clear_cudata(0);
		}
		$this->auser->updatedb();
		$this->updatefield('checked',$check,'main');
		$this->updatefield('editorid',$curuser->info['mid'],'sub');
		$this->updatefield('editor',$curuser->info['mname'],'sub');
		$this->sale_define();
		$updatedb && $this->updatedb();
	}
	function sale_define($updatedb=0){//ֻҪ�ĵ�����һ�����в��ܳ��۵��������ĵ����������
		global $cotypes,$vcps;
		if(!$this->archive['checked']) return;
		$clearsale = !empty($this->archive['salecp']) && !isset($vcps['sale'][$this->archive['salecp']]);
		$clearfsale = !empty($this->archive['fsalecp']) && !isset($vcps['fsale'][$this->archive['fsalecp']]);
		$catalog = read_cache('catalog',$this->archive['caid'],'',$this->archive['sid']);
		(!$clearsale && !empty($this->archive['salecp']) && !$catalog['allowsale']) && $clearsale = 1;
		(!$clearfsale && !empty($this->archive['fsalecp']) && !$catalog['allowfsale']) && $clearfsale = 1;
		foreach($cotypes as $coid => $cotype){
			if($this->archive["ccid$coid"]){
				$coclass = read_cache('coclass',$coid,$this->archive["ccid$coid"]);
				(!$clearsale && !empty($this->archive['salecp']) && $cotype['sale'] && !$coclass['allowsale']) && $clearsale = 1;
				(!$clearfsale && !empty($this->archive['fsalecp']) && $cotype['fsale'] && !$coclass['allowfsale']) && $clearfsale = 1;
			}
		}
		unset($catalog,$coclass);
		$clearsale && $this->updatefield('salecp','','main');
		$clearfsale && $this->updatefield('fsalecp','','main');
		$updatedb && $this->updatedb();
	}
	function arc_caid($caid=0,$updatedb=0){//�޸���Ŀ
		global $catalogs,$vcps;
		if(!$caid) return;
		$this->basic_data();
		if($caid == $this->archive['caid']) return;
		if(!($catalog = read_cache('catalog',$caid,'',$this->archive['sid']))) return;
		if(!$this->auser->pmbypmids('aadd',$catalog['apmid'])) return;//����Ա�ڸ���Ŀ�еķ���Ȩ��
		if(!in_array($this->archive['chid'],explode(',',$catalog['chids']))) return;
		if($this->archive['checked']){//ֻ��������ĵ���ȥ��������
			$crids = array();
			if(!empty($catalog['awardcp']) && !empty($vcps['award'][$catalog['awardcp']])){
				$cparr = explode('_',$catalog['awardcp']);
				$crids[$cparr[0]] = $cparr[1];
			}
			if($crids){
				if(!$this->auser->crids_enough($crids)) return;
				$this->auser->updatecrids($crids,1,lang('awardcurrency'));
			}
		}
		$this->updatefield('caid',$caid,'main');
		$this->sale_define();//У����ǰ�ĵ���������
		unset($catalog);
		$this->set_arcurl();
		$updatedb && $this->updatedb();
	}
	function arc_ccid($ccid,$coid,$updatedb=0){//�޸ķ����ȡ������Ĳ���
		global $cotypes,$timestamp,$vcps;
		if($ccid){
			if(!($coclass = read_cache('coclass',$coid,$ccid))) return;
			$this->basic_data();
			if($ccid == $this->archive["ccid$coid"]) return;
			if(!$this->auser->pmbypmids('aadd',$coclass['apmid'])) return;
			if(!in_array($this->archive['chid'],explode(',',$coclass['chids']))) return;//��Ծ��������ж�
			if($this->archive['checked'] && $cotypes[$coid]['awardcp']){//ֻ��������ĵ���ȥ��������
				$crids = array();
				if(!empty($coclass['awardcp']) && !empty($vcps['award'][$coclass['awardcp']])){
					$cparr = explode('_',$coclass['awardcp']);
					$crids[$cparr[0]] = $cparr[1];
				}
				if($crids){
					if(!$this->auser->crids_enough($crids)) return;
					$this->auser->updatecrids($crids,1,lang('awardcurrency'));			
				}
			}
			unset($coclass);
		}
		$this->updatefield("ccid$coid",$ccid,'main');
		$this->sale_define();//У����ǰ�ĵ���������
		$updatedb && $this->updatedb();
	}
	function arc_delete($isuser=0){
		global $db,$tblprefix,$enablestatic,$c_notice,$cotypes;
		if(empty($this->aid)) return;
		$this->basic_data();
		if($isuser && $this->archive['checked']) return; 
		if($enablestatic && $this->archive['checked']){//��̬֪ͨ
			$c_notice->index = 1;
			$c_notice->sindex = 1;
			$c_notice->cnstrs[$this->ocnstr] = 1;
			$c_notice->saids[$this->aid] = 1;
			$c_notice->saids2aids();//��ɾ��֮ǰ�����������ϼ��ϼ�id����ȡ��������Ϊ��ɾ�������¼��
		}

		//ɾ����Ӧ��txt�洢�ı�
		$this->detail_data();
		foreach($this->namepres as $k) txtunlink($k);

		$wherestr = "WHERE aid='".$this->aid."'";
		foreach(array('comments','favorites','subscribes','answers','arecents','purchases','offers','replys',) as $var){//????????????????
			$db->query("DELETE FROM {$tblprefix}$var $wherestr", 'UNBUFFERED');
		}
		$db->query("DELETE FROM {$tblprefix}albums WHERE aid='".$this->aid."' OR pid='".$this->aid."'", 'UNBUFFERED');//�ϼ���ϵȫ��ɾ��

		//ɾ����������ɵľ�̬�ļ�
		$addnos = array('','1','2');
		$plus_mode = 'set_arcurl';@include M_ROOT."./include/arcplus.inc.php";
		$basedir = arc_basedir($this->archive);
		$arcurl = urlformat($this->archive);
		foreach($addnos as $k){
			m_unlink($basedir.m_parseurl($arcurl,array('addno' => $k)));
		}
		unset($addnos,$arcurl,$basedir);

		$customtable = 'archives_'.$this->archive['chid'];
		$db->query("DELETE FROM {$tblprefix}$customtable $wherestr", 'UNBUFFERED');
		$db->query("DELETE FROM {$tblprefix}archives_sub $wherestr", 'UNBUFFERED');
		$db->query("DELETE FROM {$tblprefix}archives_rec $wherestr", 'UNBUFFERED');
		$db->query("DELETE FROM {$tblprefix}archives $wherestr", 'UNBUFFERED');
		
		//����ͳ��
		$this->auser->basedeal('archive',0);
		$this->archive['checked'] && $this->auser->basedeal('check',0);

		$uploadsize = 0;
		$query = $db->query("SELECT * FROM {$tblprefix}userfiles WHERE tid='1' AND aid='".$this->aid."'");
		while($item = $db->fetch_array($query)){
			$ufile = local_file($item['url']);
			@unlink($ufile);
			clear_dir($ufile.'_s',true);
			$uploadsize += ceil($item['size'] / 1024);
		}
		$this->auser->updateuptotal($uploadsize,'reduce',1);
		$db->query("DELETE FROM {$tblprefix}userfiles $wherestr", 'UNBUFFERED');
		$this->init();
	}
	function arc_nums($dname,$add=1,$updatedb=0){
		$this->basic_data();
		if(in_array($dname,array('orders','ordersum','comments','answers','adopts','favorites','praises','debases','scores','downs','plays','offers','replys','reports'))){
			$this->updatefield($dname,max(0,$this->archive[$dname] + $add),in_array($dname,array('reports')) ? 'sub' : 'main');
			updaterecent($this->aid,$dname,$add);
		}
		$updatedb && $this->updatedb();
	}
	function newoffer(){//ֻ���Դ��ڻ�Ա���Ļ�ǰ̨�����ش�����ʾ
		global $timestamp,$db,$tblprefix,$curuser;
		$this->basic_data(0);
		if(!$curuser->info['mid']) return 'nousernoofferpermis';
		if(!$this->aid || !$this->archive['checked']) return 'chooseproduct';
		if($cid = $db->result_one("SELECT cid FROM {$tblprefix}offers WHERE mid='".$curuser->info['mid']."' AND aid='".$this->aid."'")) return 'offerexist';
		if(!$this->channel['offer'] || !($commu = read_cache('commu',$this->channel['offer']))) return 'nooffercommu';
		if($commu['allowance'] && @$curuser->info['cuallowance'] <= @$curuser->info['cuaddmonth']) return 'owancecommuamooverlim';
		if(!$curuser->pmbypmids('cuadd',$commu['setting']['apmid'])) return 'noofferpms';
		
		$db->query("INSERT INTO {$tblprefix}offers SET
			aid='".$this->aid."',
			cuid='$commu[cuid]',
			mid='".$curuser->info['mid']."',
			mname='".$curuser->info['mname']."',
			checked='".(empty($commu['setting']['autocheck']) ? 0 : 1)."',
			createdate='$timestamp',
			enddate='".(empty($commu['setting']['vdays']) ? 0 : $timestamp + 86400 * $commu['setting']['vdays'])."',
			refreshdate='$timestamp',
			updatedate='$timestamp'
			");
		if($commu['allowance']) $curuser->updatefield('cuaddmonth',$curuser->info['cuaddmonth'] + 1,'main');//�޶��ĵ�ͳ��
		$curuser->basedeal('offer',1,1,1);
		$this->arc_nums('offers',1,1);
		return '';
	}
	function inalbumsqlstr($pre='',$inits=array()){//��ѡ��ǰ�ϼ�������ص���������//�ų���ǰ��ģ��
		if(!$this->channel['isalbum'] || !$this->channel['inchids']) return '';
		$inchids = array_diff(explode(',',$this->channel['inchids']),array($this->archive['chid']));
		$inits && $inchids = array_intersect($inchids,$inits);
		if(!$inchids) return '';
		$sqlstr = "WHERE {$pre}aid!=".$this->aid." AND {$pre}chid ".multi_str($inchids);//�ų�����
		$this->channel['oneuser'] && $sqlstr .= " AND {$pre}mid='".$this->archive['mid']."'";
		return $sqlstr;
	}
	function set_chidstr($pre='',$inits=array()){//ȡ���������ĺϼ�����id�Ĳ�ѯ�ִ�//���ܹ��뵽ͬ���ģ����
		global $channels;
		$chids = $uchids = array();//�����и��˺ϼ��ĺϼ��������顣
		$chidstr = $uchidstr = '';
		foreach($channels as $k => $v){
			$v = read_cache('channel',$k);
			if(!$v['isalbum'] || ($k == $this->archive['chid']) || $v['onlyload'] || !in_array($this->archive['chid'],explode(',',$v['inchids']))) continue;//���������鼭��ֻ�Ǽ����Ժϼ������ܹ���
			if(!$inits || in_array($k,$inits)) ${$v['oneuser'] ? 'uchids' : 'chids'}[] = $k;
		}
		$chids && $chidstr = "{$pre}chid ".multi_str($chids);
		$uchids && $uchidstr = "({$pre}chid ".multi_str($uchids)." AND mid='".$this->archive['mid']."')";
		$sqlstr = $chidstr && $uchidstr ? "($chidstr OR $uchidstr)" : $chidstr.$uchidstr;
		unset($chids,$uchids,$chidstr,$uchidstr,$v);
		if(!$sqlstr) return '';
		$sqlstr .= " AND {$pre}aid!=".$this->aid;//�ų�����
		return $sqlstr;
	
	}
	function set_album($aid=0,$load=0){//����ǰ�ļ����뵽$aid�ĺϼ���//$load��ʾ�鼭��ʽ��1Ϊ��������
		global $db,$tblprefix,$enablestatic,$c_notice;
		if(empty($aid)) return false;
		$this->basic_data(0);
		if($aid == $this->archive['aid']) return false;
		if(!($row = $db->fetch_one("SELECT aid,chid,mid,sid FROM {$tblprefix}archives WHERE aid=$aid"))) return false;//$aid������
		if($this->archive['chid'] == $row['chid']) return false;//���ܹ��뵽��ͬ��ģ����
		if(!($channel = read_cache('channel',$row['chid'])) && !$channel['isalbum']) return false;//$aid���Ǻϼ�
		if($channel['oneuser'] && ($row['mid'] != $this->archive['mid'])) return false;//�������ʵĺϼ�
		if($channel['onlyload'] && !$load) return false;//�����ͺϼ���ֻ�������붯��ʱ�鼭
		if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}albums WHERE aid='".$this->archive['aid']."' AND pid='$row[aid]'")) return false;//�˺ϼ���¼�Ѵ���
		if($channel['onlyone'] && $db->result_one("SELECT COUNT(*) FROM {$tblprefix}albums WHERE aid='".$this->archive['aid']."' AND pchid='$row[chid]'")) return false;//�Ѿ����뵽����ͬ���ͺϼ���
		if($channel['maxnums']){//$aid�еļ��������������
			$counts = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}albums WHERE pid='".$row['aid']."'");
			if($counts > $channel['maxnums']) return false;
		}
		if(!in_array($this->archive['chid'],explode(',',$channel['inchids']))) return false;
		$sqlstr = "aid='".$this->archive['aid']."',pid='$aid',chid='".$this->archive['chid']."',pchid='$row[chid]'";//�ϼ���¼�Ļ�����Ϣ
		$channel['inautocheck'] && $sqlstr .= ",checked=1";
		$db->query("INSERT INTO {$tblprefix}albums SET $sqlstr");
		unset($row);
		if($enablestatic && $this->archive['checked']){
			$c_notice->saids[$this->aid] = 1;//׷���ļ����ϼ��ϼ�
			$c_notice->aids[$this->aid] = 1;//�鼭��������ĵ��п��ܸı�
		}
		return true;
	}	
	function readd($backarea=0,$updatedb=0){//$backarea��ʾ�Ƿ��ڹ����̨����//���޶��Ƿ��й�?????
		global $timestamp;
		$this->basic_data();
		if(!$this->aid || !$this->archive['checked']) return false;
		if(!$this->channel['readd']) return false;
		if(!$backarea && $this->channel['readd'] == 1) return false;
		if($this->channel['reinterval'] && $timestamp - $this->archive['refreshdate'] < $this->channel['reinterval'] * 3600) return false;

		//�Ƿ���Ȩ�޽����ط���,û�����Ȩ����û���ط�Ȩ��
		if(!$this->auser->checkforbid('issue')) return false;//������
		if(!($catalog = read_cache('catalog',$this->archive['caid'],'',$this->archive['sid'])) || !$this->auser->pmbypmids('aadd',$catalog['apmid'])) return false;//������Ŀ���÷���
		if(!$this->auser->pmbypmids('aadd',$this->channel['apmid'])) return false;//û��ģ�ͷ���Ȩ��
		if($this->channel['allowance'] && @$this->auser->info['arcallowance']){
			$adds = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}archives WHERE mid='".$this->archive['mid']."' AND chid='".$this->archive['chid']."'");
			if($adds >= $this->auser->info['arcallowance']) return false;
		}
		$this->updatefield('refreshdate',$timestamp,'main');
		$updatedb && $this->updatedb();
	}
	function reset_validperiod($days=0,$updatedb=0){//
		global $timestamp;
		$this->basic_data();
		if(!$this->aid || !$this->archive['checked']) return false;

		if(!$this->channel['validperiod']) return false;
		if(($this->channel['validperiod'] == 1) && ($this->archive['enddate'] > $timestamp)) return false;//���ں�������Ч��ģʽ

		//�Ƿ���Ȩ�޽���������Ч��,û�����Ȩ����û��������Ч��Ȩ��
		if(!$this->auser->checkforbid('issue')) return false;//������
		if(!($catalog = read_cache('catalog',$this->archive['caid'],'',$this->archive['sid'])) || !$this->auser->pmbypmids('aadd',$catalog['apmid'])) return false;//������Ŀ���÷���
		if(!$this->auser->pmbypmids('aadd',$this->channel['apmid'])) return false;//û��ģ�ͷ���Ȩ��
		
		//��η�����Ա��Ȩ������????????????????????/
		$days = max(0,intval($days));
		if($this->channel['mindays']) $days = max($days,$this->channel['mindays']);
		if($this->channel['maxdays']) $days = min($days,$this->channel['maxdays']);
		$this->updatefield('enddate',$timestamp + $days * 24 * 3600,'main');
		$updatedb && $this->updatedb();
	}
	function updatefield($fieldname,$newvalue,$mode='main'){
		if(in_array($mode,array('main','sub'))){
			$this->basic_data();
		}elseif($mode == 'custom'){
			$this->detail_data();
		}
		if($this->archive[$fieldname] != stripslashes($newvalue)){
			$this->archive[$fieldname] = stripslashes($newvalue);
			$this->updatearr[$mode][$fieldname] = $newvalue;
		}
	}
	function updatedb(){
		global $db,$tblprefix,$enablestatic,$c_notice,$timestamp;
		if(empty($this->aid)) return;
		
		//��������������ֶε�ֵ�ı仯
		foreach($this->fields as $k => $v){//һ���и��£����¼��㺯���ֶΡ�
			if($v['available'] && $v['isfunc']){
				$this->detail_data();//����ʹ�������ֶε�ֵ�����㺯��ֵ��
				$v = read_cache('field',$this->archive['chid'],$k);
				if(empty($v['istxt'])){
					$this->updatefield($k,field_func($v['func'],$this->archive,$arr2=''),$v['tbl']);
				}else saveastxt(stripslashes(field_func($v['func'],$this->archive,$arr2='')),$aedit->namepres[$k]);
			}
		}

		$check = $cn = $main = $custom = false;
		foreach(array('main','sub','custom') as $upmode){
			if(!empty($this->updatearr[$upmode])){//ֻҪ������ڣ��������������޸�
				$this->updatearr['main']['updatedate'] = $timestamp;
				$sqlstr = '';
				foreach($this->updatearr[$upmode] as $k => $v){
					$sqlstr .= ($sqlstr ? "," : "").$k."='".$v."'";
					if(preg_match("/^ccid(\d+)/i",$k) || $k == 'caid') $cn = true;
					if($k == 'checked') $check = true;
				}
				if(!empty($sqlstr)){
					$tablename = $upmode == 'main' ? 'archives' : ($upmode == 'sub' ? 'archives_sub' : 'archives_'.$this->channel['chid']);
					$db->query("UPDATE {$tblprefix}$tablename SET $sqlstr WHERE aid={$this->aid}");
				}
				$upmode == 'main' && $main = true;
				$upmode == 'custom' && $custom = true;
			}
		}
		if($enablestatic){
			global $c_notice;
			if(!$c_notice) $c_notice = new cls_notice;
			if($check || ($this->archive['checked'] && $main)){//���״̬�ı���������ݸı�
				$c_notice->index = 1;
				$c_notice->sindex = 1;
				$c_notice->cnstrs[$this->cnstr()] = 1;
				$c_notice->saids[$this->aid] = 1;
				$c_notice->aids[$this->aid] = 1;
			}
			if($this->archive['checked'] && $cn) $c_notice->cnstrs[$this->ocnstr] = 1;//�޸ķ��࣬ԭ�ڵ�ҳ����Ҫ�޸�
			if($this->archive['checked'] && $custom) $c_notice->aids[$this->aid] = 1;//ģ�ͱ�ı�
		}
		$this->updatearr = array();
	}
}
?>
