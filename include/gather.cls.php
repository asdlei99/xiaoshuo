<?php
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
set_time_limit(0);
include_once M_ROOT."./include/http.cls.php";
include_once M_ROOT."./include/linkparse.cls.php";
include_once M_ROOT.'/include/charset.fun.php';
include_once M_ROOT."./include/arc_static.fun.php";
class cls_gather{
	var $gsid = 0;
	var $gmission = array();
	var $fields = array();
	var $oconfigs = array();
	var $urlarr = array();
	var $mpcontent = '';
	var $mplinks = array();
	function __construct(){
		$this->cls_gather();
	}
	function cls_gather(){
	}
	function init(){
		$this->gsid = 0;
		$this->gmission = array();
		$this->fields = array();
		$this->oconfigs = array();
		$this->urlarr = array();
		$this->mpcontent = '';
		$this->mplinks = array();
	}
	function set_mission($gsid){
		global $gmissions,$gmodels,$sid;
		if(!isset($gmissions[$gsid])) return false;
		$this->gsid = $gsid;
		$this->gmission = read_cache('gmission',$gsid,'',$sid);//���ֶ���Ϣ�����������Ϣ�ļ���Ϣ
		unset($this->gmission['fsettings'],$this->gmission['dvalues']);
		return true;
	}
	function gather_fields(){
		global $gmodels,$sid;
		$gmid = $this->gmission['gmid'];
		$gmodel = read_cache('gmodel',$gmid,'',$sid);
		$gfields = $gmodel['gfields'];
		$chid = $gmodel['chid'];
		$fields = read_cache('fields',$chid);
		$gmission = read_cache('gmission',$this->gsid,'',$sid);
		$fsettings = $gmission['fsettings'];
		foreach($fields as $k => $v){
			if($v['available'] && isset($gfields[$k]) && isset($fsettings[$k])){
				$this->fields[$k] = $v + $fsettings[$k];
				$this->fields[$k]['islink'] = $gfields[$k];
				$this->fields[$k]['rpid'] = empty($this->fields[$k]['rpid']) ? 0 : $this->fields[$k]['rpid'];
				$this->fields[$k]['jumpfile'] = empty($this->fields[$k]['jumpfile']) ? '' : $this->fields[$k]['jumpfile'];
			}
		}
		unset($fields,$gmodel,$gfields,$gmission,$fsettings);
	}
	function output_configs(){
		$gmission = read_cache('gmission',$this->gsid);
		$this->oconfigs = $gmission['dvalues'];
		unset($gmission);
	}
	function fetch_surls(){
		$surls = array();
		$this->gmission['uurls'] && $surls = array_filter(explode("\n",$this->gmission['uurls']));
		if($this->gmission['uregular'] && strpos($this->gmission['uregular'],'(*)')>1){
			for($i = $this->gmission['ufromnum'];$i <= $this->gmission['utonum'];$i++){
				$surls[] = str_replace("(*)",$i,$this->gmission['uregular']);
			}
		}
		$this->gmission['udesc'] && krsort($surls);
		return $surls;
	}
	function fetch_addurl($surl,$pattern,$reflink){
		if(empty($surl) || empty($pattern)) return '';
		$html = $this->onepage($surl);
		$addurl = $this->fetch_detail($pattern,$html);
		$addurl = fillurl($addurl,$reflink);
		unset($html);
		return $addurl;
	}
	function fetch_gurls($surl,$istest=0){//
		global $db,$tblprefix,$c_upload,$sid,$timestamp,$progress;
		$rets = array();//���Եķ�������
		if(empty($surl) || !($html = $this->onepage($surl))) return $rets;//Դ��ַ�����ڻ��޷���ȡ��ҳ��
		$this->gmission['uregion'] && $html = $this->fetch_detail($this->gmission['uregion'],$html);//ȡ����ʼ��Ч��Χ
		$urlregions = explode($this->gmission['uspilit'],$html);//����url����
		if($this->gmission['udesc']) krsort($urlregions);//�ɼ�˳��
		unset($html);
		if(!$istest){//���ݲɼ�ʱ��Ҫ����ַ�б�ҳ�вɼ�������Ԥѡ�ɼ�
			$ufields = array();
			empty($this->fields) && $this->gather_fields();//���������еĲɼ��ֶ�
			foreach($this->fields as $k => $v){
				if($v['frompage'] == 1) $ufields[] = $k;
			}
		}
		$linkcount = 0;
		foreach($urlregions as $urlregion){//����ÿ��url��������
			if($istest && count($rets) >= 10) break;//ֻ����10����ַ
			$c_upload->init();
			$this->clean_blank($urlregion);
			if(!$gurl = $this->fetch_detail($this->gmission['uurltag'],$urlregion)) continue;//�޷���ȡ����ҳ��url
			$gurl = fillurl($gurl,$surl);
			if($this->gmission['uinclude'] && !eregi($this->gmission['uinclude'],$gurl)) continue;//��Ҫ�������ַ�
			if($this->gmission['uforbid'] && eregi($this->gmission['uforbid'],$gurl)) continue;//��ֹ�������ַ�

			$refresh = false;
			if(!$istest && $row = $db->fetch_one("SELECT guid,abover FROM {$tblprefix}gurls WHERE gurl='".addslashes($gurl)."'")){//������Ѵ��ڵ���ַ
				if(!$this->gmission['sonid'] || $row['abover']) continue;//���������ϼ�����ᣬ���Թ�����ַ
				$refresh = true;
				$guid = $row['guid'];
			}
			$utitle = $this->fetch_detail($this->gmission['utitletag'],$urlregion);
			$utitle = !$utitle ? lang('titleunknown') : strip_tags($utitle);
			$gurl1 = $this->fetch_addurl($gurl,$this->gmission['uurltag1'],$gurl);
			$gurl2 = $this->fetch_addurl($gurl1,$this->gmission['uurltag2'],$gurl1);
			$linkcount++;
			if(!$istest){//�ǲ���״̬����Ҫ�ɼ��б��е�����
				if(!$refresh){
					$contents = array();
					foreach($ufields as $v) $contents[$v] = $this->common_field($v,$urlregion,$gurl);
					$db->query("INSERT INTO {$tblprefix}gurls SET
					sid='$sid',
					gurl='$gurl',
					gurl1='$gurl1',
					gurl2='$gurl2',
					utitle='$utitle',
					contents='".addslashes(serialize($contents))."',
					ufids='".implode(',',$c_upload->ufids)."',
					adddate='$timestamp',
					gsid='".$this->gsid."'");
					$guid = $db->insert_id();
					$progress && $progress->linkcount($linkcount);
				}
				if($this->gmission['sonid'] && $guid) $this->fetch_son_gurls($this->gmission['sonid'],$guid,$gurl,$gurl1,$gurl2,0);//�ɼ��ϼ��е���ַ�б�
			}else{//����״̬
				$rets[$gurl]['utitle'] = $utitle;
				$rets[$gurl]['gurl'] = $gurl;
				$rets[$gurl]['gurl1'] = $gurl1;
				$rets[$gurl]['gurl2'] = $gurl2;
#				$this->gmission['sonid'] && $rets = $rets + $this->fetch_son_gurls($this->gmission['sonid'],0,$gurl,$gurl1,$gurl2,1);
			}
		}
		unset($ufields,$urlregions,$urlregion,$contents);
		if($istest) return $rets;
	}
	function fetch_son_gurls($gsid=0,$guid=0,$url0='',$url1='',$url2='',$istest=0){//�ɼ�����Ժϼ��ڵ���ַ�б�
		global $db,$tblprefix,$sid,$c_upload,$timestamp,$progress;
		$rets = array();
		if(!$gsid) return $rets;
		$ng = new cls_gather;
		$ng->set_mission($gsid);
		$gmission = &$ng->gmission;
		$surl = ${'url'.$gmission['ufrompage']};//�ɼ���ַ�б��Դurl
		if(!$gmission['pid'] || !$surl || !($html = $ng->onepage($surl))) return $rets;//����������������ַԴurl�����ڻ�Դurlҳ��ɲ�������
		$html = $ng->fetch_detail($ng->gmission['uregion'],$html);//��ʼֵ��Χ
		$urlregions = explode($ng->gmission['uspilit'],$html);//�ָ���ǲ��
		if($ng->gmission['udesc']) krsort($urlregions);//�ɼ�˳��
		unset($html);
		$ufields = array();
		empty($ng->fields) && $ng->gather_fields();
		foreach($ng->fields as $k => $v) $v['frompage'] == 1 && $ufields[] = $k;
		$linkcount = 0;
		foreach($urlregions as $urlregion){//ÿ��url����
			$c_upload->init();
			$ng->clean_blank($urlregion);
			if(!$gurl = $ng->fetch_detail($ng->gmission['uurltag'],$urlregion)) continue;//urlģӡ
			$gurl = fillurl($gurl,$surl);//��ȫurl
			if($ng->gmission['uinclude'] && !eregi($ng->gmission['uinclude'],$gurl)) continue;
			if($ng->gmission['uforbid'] && eregi($ng->gmission['uforbid'],$gurl)) continue;

			if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}gurls WHERE gurl='".addslashes($gurl)."'")) continue;//������Ѵ��ڵ���ַ
			$utitle = $ng->fetch_detail($ng->gmission['utitletag'],$urlregion);//����
			$utitle = !$utitle ? lang('titleunknown') : strip_tags($utitle);
			$gurl1 = $ng->fetch_addurl($gurl,$ng->gmission['uurltag1'],$surl);//׷��ҳ1
			$gurl2 = $ng->fetch_addurl($gurl1,$ng->gmission['uurltag2'],$surl);//׷��ҳ2
			$linkcount++;
			$contents = array();
			if(!$istest){
				foreach($ufields as $v) $contents[$v] = $ng->common_field($v,$urlregion,$gurl);//��Ҫ���б�ҳ�вɼ������ݣ��ڲɼ���ַ��ͬʱ�ɼ�����
			}
			if($istest){//�ϼ���Ҫ�������������ַ�г�����
				$rets[$gurl]['utitle'] = $utitle;
				$rets[$gurl]['gurl'] = $gurl;
				$rets[$gurl]['gurl1'] = $gurl1;
				$rets[$gurl]['gurl2'] = $gurl2;
				$rets[$gurl]['son'] = 1;
			}else{//����ַ�����ݴ������ݿ���
				$db->query("INSERT INTO {$tblprefix}gurls SET
				sid='$sid',
				pid='$guid',
				gurl='$gurl',
				gurl1='$gurl1',
				gurl2='$gurl2',
				utitle='$utitle',
				contents='".addslashes(serialize($contents))."',
				ufids='".implode(',',$c_upload->ufids)."',
				adddate='$timestamp',
				gsid='".$ng->gsid."'");
			}
		}
		$progress && $progress->linkcount($linkcount);
		unset($ng,$urlregions,$urlregion,$ufields,$contents);
		return $rets;
	}
	function gather_sonid($pid=0,$gsid=0){//�ɼ��ϼ��е�δ�ɼ���Ŀ
		global $db,$tblprefix,$timestamp,$sid;
		if(!$pid || !$gsid) return;
		$ng = new cls_gather;
		$ng->set_mission($gsid);
		$ng->gather_fields();//���з����ɼ�����
		if(empty($ng->fields)) return;
		$query = $db->query("SELECT guid FROM {$tblprefix}gurls WHERE gsid='$gsid' AND gatherdate='0' AND pid='$pid' ORDER BY guid ASC");
		while($row = $db->fetch_array($query)){
			$ng->gather_guid($row['guid'],0);
		}
		unset($ng);
	}
	function gather_guid($guid=0,$istest=0,$item=0){//ֻ�ɼ�δ������
		global $db,$tblprefix,$c_upload,$timestamp,$progress;
		if((!$guid || !($item = $db->fetch_one("SELECT * FROM {$tblprefix}gurls WHERE guid='$guid'"))) && !$item) return false;
		if(empty($item['gatherdate'])){//δ������
			$contents = empty($item['contents']) ? array() : unserialize($item['contents']);
			unset($item['contents']);
			if(empty($this->fields)) $this->gather_fields();
			if(empty($this->fields)) return false;
			$fields0 = $fields2 = $fields3 = array();
			foreach($this->fields as $k => $v){
				if($v['frompage'] == '0'){
					$fields0[] = $k;
				}elseif($v['frompage'] == '2' && $item['gurl1']){
					$fields2[] = $k;
				}elseif($v['frompage'] == '3' && $item['gurl2']){
					$fields3[] = $k;
				}
			}
			$c_upload->init();
			if(!empty($fields0)){
				$html = $this->onepage($item['gurl']);
				foreach($fields0 as $k) $contents[$k] = $this->one_content($k,$html,$item['gurl']);
			}
			if(!empty($fields2)){
				$html = $this->onepage($item['gurl1']);
				foreach($fields2 as $k) $contents[$k] = $this->one_content($k,$html,$item['gurl1']);
			}
			if(!empty($fields3)){
				$html = $this->onepage($item['gurl2']);
				foreach($fields3 as $k) $contents[$k] = $this->one_content($k,$html,$item['gurl2']);
			}
			if(!$istest){
				$item['ufids'] .= ($item['ufids'] && $c_upload->ufids ? ',' : '').implode(',',$c_upload->ufids);
				$db->query("UPDATE {$tblprefix}gurls SET 
							contents = '".addslashes(serialize($contents))."',
							ufids = '$item[ufids]',
							gatherdate = '$timestamp'
							WHERE guid='$guid'");
			}
			$progress && $progress->content(1);
		}
		if(!$istest && $this->gmission['sonid'] && !$item['abover']) $this->gather_sonid($guid,$this->gmission['sonid']);//�ǲ���ʱ,�ɼ��ϼ��е���ַ����
		return $istest ? $contents : true;
	}
	function output_sonid($pid=0,$gsid=0){//���ϼ��е�δ�ɼ���Ŀ���
		global $db,$tblprefix,$timestamp,$sid;
		if(!$pid || !$gsid) return;
		$ng = new cls_gather;
		$ng->set_mission($gsid);
		$ng->output_configs();//�ȷ����Ƿ��������������
		if(empty($ng->oconfigs)) return;
		$query = $db->query("SELECT guid FROM {$tblprefix}gurls WHERE gsid='$gsid' AND outputdate='0' AND gatherdate<>'0' AND pid='$pid' ORDER BY guid ASC");
		while($row = $db->fetch_array($query)){
			$ng->output_guid($row['guid']);
		}
		unset($ng);
	}
	function output_guid($guid=0){//��ֹ�ظ����,δ���ϼ���Ҫ������ڵ�����
		global $db,$tblprefix,$gmodels,$curuser,$timestamp,$cotypes,$c_upload,$sid,$progress;
		if(!$guid || !($item = $db->fetch_one("SELECT * FROM {$tblprefix}gurls WHERE guid='$guid' AND gatherdate<>'0'"))) return false;
		if(!$item['outputdate']){
			$archivenew = empty($item['contents']) ? array() : unserialize($item['contents']);
			unset($item['contents']);
			if(empty($this->fields)) $this->gather_fields();
			if(empty($this->oconfigs)) $this->output_configs();
			if(empty($this->fields) || empty($this->oconfigs)) return false;
			if(!empty($this->oconfigs['musts'])){
				$mustsarr = explode(',',$this->oconfigs['musts']);
				foreach($mustsarr as $k){
					if(empty($archivenew[$k])) return false;//ȱ�ٱ����ֶ����ݣ������ֹ
				}
			}
			$c_upload->init();
			$aid = $item['aid'];
			$gmid = $this->gmission['gmid'];
			$chid = $gmodels[$gmid]['chid'];
			$channel = read_cache('channel',$chid);
			$fields = read_cache('fields',$chid);
			$sqlmain = "sid='$item[sid]',chid='$chid',mid='".$curuser->info['mid']."',mname='".$curuser->info['mname']."',createdate='$timestamp',refreshdate='$timestamp'";
			$sqlsub = $sqlcustom = '';
			empty($this->oconfigs['caid']) || $sqlmain .= ",caid='".$this->oconfigs['caid']."'";
			foreach($cotypes as $k => $v){
				$var = "ccid$k";
				empty($this->oconfigs[$var]) || $sqlmain .= ",$var='".$this->oconfigs[$var]."'";
			}
	
			if($fields['abstract']['available'] && !empty($this->oconfigs['autoabstract'])){
				if(!empty($channel['autoabstract']) && !empty($archivenew[$channel['autoabstract']])){
					$sqlmain .= ($sqlmain ? ',' : '')."abstract='".addslashes(autoabstract($archivenew[$channel['autoabstract']]))."'";
				}
			}
			if($fields['thumb']['available'] && !empty($this->oconfigs['autothumb'])){
				if(!empty($channel['autothumb']) && !empty($archivenew[$channel['autothumb']])){
					$field = read_cache('field',$chid,'thumb');
					$sqlmain .= ($sqlmain ? ',' : '')."thumb='".$c_upload->thumb_pick($archivenew[$channel['autothumb']],$fields[$channel['autothumb']]['datatype'],$field['rpid'])."'";
					unset($field);
				}
			}
			if($channel['autosize'] && !empty($archivenew[$channel['autosize']])){
				include_once M_ROOT.'/include/fields.fun.php';
				$archivenew['atmsize'] = atm_size($archivenew[$channel['autosize']],$fields[$channel['autosize']]['datatype'],$channel['autosizemode']);
				$sqlmain .= ",atmsize='".$archivenew['atmsize']."'";
			}
			if($channel['autobyte'] && isset($archivenew[$channel['autobyte']])){
				$archivenew['bytenum'] = atm_byte(stripslashes($archivenew[$channel['autobyte']]),$fields[$channel['autobyte']]['datatype']);
				$sqlmain .= ",bytenum='".$archivenew['bytenum']."'";
			}


			foreach($fields as $k => $v){
				if($v['available'] && isset($archivenew[$k])){
					if($v['datatype'] == 'htmltext'){
						html_atm2tag(addslashes($archivenew[$k]));
						$archivenew[$k] = stripslashes($archivenew[$k]);
					}
					if(!empty($v['istxt'])){
						if($aid){
							if(empty($oldval))$oldval = $db->fetch_one("SELECT * FROM {$tblprefix}archives_$chid WHERE aid=$aid");
							saveastxt($archivenew[$k], $oldval[$k]);
							continue;
						}else{
							$archivenew[$k] = saveastxt($archivenew[$k]);
						}
					}
					${'sql'.$v['tbl']} .= (${'sql'.$v['tbl']} ? ',' : '').$k."='".addslashes($archivenew[$k])."'";
				}
			}
			unset($fields,$archivenew,$mustarr);
			if($aid){
				$sqlcustom && $db->query("UPDATE {$tblprefix}archives_$chid SET ".$sqlcustom);
			}else{
				$db->query("INSERT INTO {$tblprefix}archives SET $sqlmain");
				if(!$aid = $db->insert_id()){
					return false;
				}else{
					$db->query("INSERT INTO {$tblprefix}archives_rec SET aid='$aid'");
	
					$sqlsub = "aid='$aid',needstatic='$timestamp'".($sqlsub ? ',' : '').$sqlsub;
					$sqlsub .= ",needstatic1='$timestamp'";
					$sqlsub .= ",needstatic2='$timestamp'";
					$plus_mode = 'needstatic_1';@include M_ROOT."./include/arcplus.inc.php";
					$db->query("INSERT INTO {$tblprefix}archives_sub SET ".$sqlsub);
	
					$sqlcustom = "aid='$aid'".($sqlcustom ? ',' : '').$sqlcustom;
					$db->query("INSERT INTO {$tblprefix}archives_$chid SET ".$sqlcustom);
					$curuser->basedeal('archive',1,1,1);
				}
				$c_notice = new cls_notice;//֪ͨ�ĵ����¼�¼
				$aedit = new cls_arcedit;
				$aedit->set_aid($aid);
				$aedit->set_arcurl();
				if($channel['autocheck']) $aedit->arc_check(1,0);
				$aedit->updatedb();
	
				//�鼭����,���ĵ����ݿ��޹�
				if(!empty($item['pid'])){
					$pid = $db->result_one("SELECT aid FROM {$tblprefix}gurls WHERE guid='$item[pid]'");
					$pid && $aedit->set_album($pid);
				}
				if($channel['autostatic']) arc_static($aid);
				$c_notice->deal();//֪ͨ�ĵ����¼�¼
				$ufids = $c_upload->ufids + explode(',',$item['ufids']);
				empty($ufids) || $db->query("UPDATE {$tblprefix}userfiles SET aid=$aid WHERE ufid ".multi_str($ufids));
			}
			$db->query("UPDATE {$tblprefix}gurls SET aid='$aid',outputdate='$timestamp',contents='',ufids='' WHERE guid='$item[guid]'");
			$progress && $progress->output(1);
		}
		if($this->gmission['sonid'] && !$item['abover']) $this->output_sonid($guid,$this->gmission['sonid']);//���ϼ��е��������
		unset($aedit,$c_notice,$arc,$fields,$field,$item,$archivenew,$channel,$sqlmain,$sqlsub,$sqlcustom);
		return true;
	}
	function one_content($fname,&$html,$reflink){
		$content = '';
		if($fname != $this->gmission['mpfield']){
			$content = $this->common_field($fname,$html,$reflink);
		}else{
			$this->mpfield($fname,$html,$reflink);
			$content = $this->mpcontent;
		}
		$this->redeal_content($fname,$content);
		return $content;
	}
	function redeal_content($fname,&$content){//�Բ�ͬ���͵��ֶ���һ���ٴ�������
		if($content == '') return;
		empty($this->fields) && $this->gather_fields();
		if(!$field = $this->fields[$fname]) return;
		if(in_array($field['datatype'],array('htmltext','text','select','mselect'))){
			$content = trim($content);
		}elseif(in_array($field['datatype'],array('int','date'))){
			$content = intval($content);
		}elseif($field['datatype'] == 'float'){
			$content = floatval($content);
		}elseif($field['datatype'] == 'multitext'){
			$content = mnl2br(trim($content));
		}
	}
	function mpfield($fname,&$html,$reflink,$step=0){
		if(!$html) return '';
		empty($this->fields) && $this->gather_fields();
		if(!$field = $this->fields[$fname]) return;
		if(!$step){
			$this->mpcontent = '';
			$this->mplinks = array();
		}
		if($mparea = $this->fetch_detail($this->gmission['mptag'],$html)){
			$mplinks = array_unique(array_merge(array($reflink),$this->searchlinks($mparea,$reflink)));
		}else $mplinks = array($reflink);
		if(!$this->gmission['mpmode']){//������ҳ����//ͬ����Ҫ����$step
			foreach($mplinks as $mplink){
				$step ++;
				if($this->gmission['mpinclude'] && !eregi($this->gmission['mpinclude'],$mplink)) continue;
				if($this->gmission['mpforbid'] && eregi($this->gmission['mpforbid'],$mplink)) continue;
				if(in_array($mplink,$this->mplinks)) continue;//�ظ���ҳ��
				if(!$mphtml = $this->onepage($mplink)) continue;
				if(!in_array($field['datatype'],array('images','files','flashs','medias'))){
					$this->mpcontent .= ($this->mpcontent ? '[##]' : '').$this->common_field($fname,$mphtml,$reflink);
				}else{
					$contentarr = ($this->mpcontent && is_array(unserialize($this->mpcontent))) ? unserialize($this->mpcontent) : array();
					$contentarr = array_merge($contentarr,unserialize($this->common_field($fname,$mphtml,$reflink)));
					$this->mpcontent = serialize($contentarr);
					unset($contentarr);
				}
				$this->mplinks[] = $mplink;
			}
		}else{
			if($step > 20) return;
			$continue = 0;
			foreach($mplinks as $mplink){
				if($this->gmission['mpinclude'] && !eregi($this->gmission['mpinclude'],$mplink)) continue;
				if($this->gmission['mpforbid'] && eregi($this->gmission['mpforbid'],$mplink)) continue;
				if(in_array($mplink,$this->mplinks)) continue;
				if(!$mphtml = $this->onepage($mplink)) continue;
				if(!in_array($field['datatype'],array('images','files','flashs','medias'))){
					$this->mpcontent .= ($this->mpcontent ? '[##]' : '').$this->common_field($fname,$mphtml,$reflink);
				}else{
					$contentarr = ($this->mpcontent && is_array(unserialize($this->mpcontent))) ? unserialize($this->mpcontent) : array();
					$contentarr = array_merge($contentarr,unserialize($this->common_field($fname,$mphtml,$reflink)));
					$this->mpcontent = serialize($contentarr);
					unset($contentarr);
				}
				$continue = 1;
				$this->mplinks[] = $mplink;
				$nexturl = $mplink;
				$step ++;
			}
			if($continue){
				if(!$mphtml = $this->onepage($nexturl)) return;
				$this->mpfield($fname,$mphtml,$nexturl,$step);
			}
		}
		unset($mphtml,$mplinks);
	}
	function common_field($fname,&$html,$reflink){//��ǰ���񣬵�ǰurl�����
		if($html == '') return '';
		empty($this->fields) && $this->gather_fields();
		if((!$field = $this->fields[$fname]) || empty($field['ftag'])) return '';
		$linkparse = new linkparse;
		if(!in_array($field['datatype'],array('images','files','flashs','medias'))){
			$content = $this->fetch_detail($field['ftag'],$html);
			$this->c_replace($field['fromreplace'],$field['toreplace'],$content);		
			$this->clearhtml($field['clearhtml'],$content);
			$linkparse->setsource($content,$reflink,$field['rpid'],$field['jumpfile']);
			if(!$field['islink']){
				$linkparse->handlelinks();
				$content = $linkparse->html;
			}else{
				$content = $linkparse->handlelink($content);
				if(in_array(mextension($content),array('jpg','gif','png','jpeg','bmp'))){
					$imageinfo = @getimagesize(view_url($content));
					!empty($imageinfo) && ($content .= '#'.$imageinfo[0].'#'.$imageinfo[1]);
				}
			}
		}else{
			$content = $this->fetch_detail($field['ftag'],$html);
			$fregions = explode($field['splittag'],$content);
			$furls = array();
			$linkparse->setsource('',$reflink,$field['rpid'],$field['jumpfile']);
			foreach($fregions as $fregion){
				$urlarr = array();
				$this->clean_blank($fregion);
				if(!$furl = $this->fetch_detail($field['remotetag'],$fregion)) continue;
				$furl = $linkparse->handlelink($furl);
				$urlarr['remote'] = $furl;
				if($field['datatype'] == 'images'){
					$imageinfo = @getimagesize(view_url($furl));
					!empty($imageinfo[0]) && ($urlarr['width'] = $imageinfo[0]);
					!empty($imageinfo[1]) && ($urlarr['height'] = $imageinfo[1]);
				}
				$urlarr['title'] = $this->fetch_detail($field['titletag'],$fregion);
				$furls[] = $urlarr;
			}
			$content = serialize($furls);
		}
		!empty($field['func']) && $this->func_deal($field['func'],$content);
		unset($linkparse,$urlarr,$furls);
		return $content;
	}
	function func_deal($funcstr,&$content){
		if(empty($funcstr) || empty($content) || !in_str('(*)',$funcstr)) return;
		$funcname = substr($funcstr,0,strpos($funcstr,'('));
		if(empty($funcname) || !function_exists($funcname)) return;
		$funcstr = str_replace('(*)',$content,$funcstr);
//		$str = str_replace( '\"','"', $str);
		if(!@eval("\$result = $funcstr;")) return;
		$content = $result;
		unset($result);
	}

	function onepage($url){
		global $mcharset,$progress;
		$m_http = new http;
		if($this->gmission['timeout']) $m_http->timeout = $this->gmission['timeout'];
		if($this->gmission['mcookies']) $m_http->setCookies($this->gmission['mcookies']);
		$html = $m_http->fetchtext($url);
		unset($m_http);
		$html = convert_encoding($this->gmission['mcharset'],$mcharset,$html);
		$this->clean_blank($html);
		$progress && $progress->pagecount(1);
		return $html;
	}
	function c_replace(&$fromreplace,&$toreplace,&$content){
		if(!$fromreplace || !$content) return;
		$fromarr = explode("(|)",$fromreplace);
		$toarr = explode("(|)",$toreplace);
		foreach($fromarr as $k => $fromtag){
			$totag = isset($toarr[$k]) ? $toarr[$k] : '';
			$tags = explode('(*)',$fromtag);
			if(count($tags) > 1 && ($tags[0] || $tags[1])){
				$stag = $this->regencode($tags[0]);
				$etag = $this->regencode($tags[1]);
				$content=preg_replace("/".$stag."(.*?)".$etag."/is",$totag,$content);
			}else $content = str_replace($fromtag,$totag,$content);
		}
	}//*
	function fetch_detail($tagstr,&$html){
		if(!$tagstr) return '';#static $debug = 0;$debug++;if($debug > 1)exit;
		$this->clean_blank($tagstr);
		$pos = strpos($tagstr, '(*)');
		if(!$pos || $pos + 3 == strlen($pos)) return '';//echo "\n/" . $this->regencode($tagstr) . "/is\n";exit;\n$html
		if(!preg_match('/' . $this->regencode($tagstr) . '/is', $html, $matches)) return '';
		$fetchstr = &$matches[1];
		$this->clean_blank($fetchstr);
		unset($html,$tagstr,$matches);
		return $fetchstr;
	}/*/
	function fetch_detail($tagstr,&$html){
		if(!$tagstr) return '';
		$tags = explode('(*)',$tagstr);
		if(count($tags) <= 1) return '';
		$stag = $tags[0];
		$etag = $tags[1];
		$this->clean_blank($stag);
		$this->clean_blank($etag);
		if(empty($stag) || empty($etag)) return '';
		$stag = $this->regencode($stag);
		$etag = $this->regencode($etag);
		$regex = "/$stag(.*?)$etag/is";echo "\n$html\n$regex\n";
		if(!preg_match($regex,$html,$matches)) return '';
		$fetchstr = $matches[1];
		$this->clean_blank($fetchstr);
		unset($html,$tagstr,$tags,$etag,$stag,$regex,$matches);
		return $fetchstr;
	}//*/
	function searchlinks($html,$reflink){
		$links = array();
		$aregions = array();
		
		$regex = "/<a(.+?)href[ ]*=[ |'|\"]*(.+?)[ |'|\"]+/is";
		if(preg_match_all($regex,$html,$matches)){
			$aregions = array_unique($matches[2]);
			foreach($aregions as $aregion){
				$aregion = fillurl($aregion,$reflink);
				$links[] = $aregion;
			}
		}
		return $links;
	}
	function clean_blank(&$str){
		$str=preg_replace("/([\r\n|\r|\n]*)/is","",$str);
		$str=preg_replace("/>([\s]*)</is","><",$str);
		$str=preg_replace("/^([ ]*)/is","",$str);
		$str=preg_replace("/([ ]*)$/is","",$str);
	}
	function regencode($str){
		$search  = array("\\",'"',".","[", "]","(", ")","?","+","*","^","{","}","$","|","/","\(\?\)","\(\*\)");
		$replace = array("\\\\",'\"',"\.","\[","\]","\(","\)","\?","\+","\*","\^","\{","\}","\$","\|","\/",".*?","(.*?)");
		return str_replace($search,$replace,$str);
	}
	function clearhtml(&$serial,&$str){
		if(!$serial || !$str) return;
		$ids = array_filter(explode(',',$serial));
		$search = array(
					  "/<a[^>]*?>(.*?)<\/a>/is",
					  "/<br[^>]*?>/i",
					  "/<table[^>]*?>([\s\S]*?)<\/table>/i",
					  "/<tr[^>]*?>([\s\S]*?)<\/tr>/i",
					  "/<td[^>]*?>([\s\S]*?)<\/td>/i",
					  "/<p[^>]*?>([\s\S]*?)<\/p>/i",
					  "/<font[^>]*?>([\s\S]*?)<\/font>/i",
					  "/<div[^>]*?>([\s\S]*?)<\/div>/i",
					  "/<span[^>]*?>([\s\S]*?)<\/span>/i",
					  "/<tbody[^>]*?>([\s\S]*?)<\/tbody>/i",
					  "/<([\/]?)b>/i",								  
					  "/<img[^>]*?>/i",
					  "/[&nbsp;]{2,}/i",
					  "/<script[^>]*?>([\w\W]*?)<\/script>/i",
					  );
		$replace = array(
					   "\\1",
					   "",
					   "\\1",
					   "\\1",
					   "\\1",
					   "\\1",
					   "\\1",
					   "\\1",
					   "\\1",
					   "\\1",
					   "",								   
					   "",
					   "&nbsp;",
					   "\\1",
					   );
		foreach($ids as $id) $str = preg_replace($search[$id-1],$replace[$id-1],$str);
	}
}
function fillurl($surl,$refhref,$basehref=''){//$refhref���Բ��յ���ȫ��ַ
	$surl = trim($surl);
	$refhref = trim($refhref);
	$basehref = trim($basehref);
	if($surl == '') return '';

	if($basehref){
		$preurl = strtolower(substr($surl,0,6));
		if(in_array($preurl,array('http:/','ftp://','mms://','rtsp:/','thunde','emule:','ed2k:/'))){
			return  $surl;
		}else{
			return $basehref.'/'.$surl;
		}
	}

	$urlparses = @parse_url($refhref);
	$homeurl = $urlparses['host'];
	$baseurlpath = $homeurl.$urlparses['path'];
	$baseurlpath = preg_replace("/\/([^\/]*)\.(.*)$/","/",$baseurlpath);
	$baseurlpath = preg_replace("/\/$/","",$baseurlpath);

	$i = $pathstep = 0;
	$dstr = $pstr = $okurl = '';
	$surl = (strpos($surl,"#") > 0) ? substr($surl,0,strpos($surl,"#")) : $surl;
	if($surl[0]=="/"){//����http�ľ�����ַ
		$okurl = "http://".$homeurl.$surl;
	}elseif($surl[0] == "."){//�����ַ
		if(strlen($surl) <= 1){
			return "";
		}elseif($surl[1] == "/"){
			$okurl = "http://".$baseurlpath."/".substr($surl,2,strlen($surl)-2);
		}else{
			$urls = explode("/",$surl);
			foreach($urls as $u){
				if($u == ".."){
					$pathstep++;
				}elseif($i < count($urls) - 1){
					$dstr .= $urls[$i]."/";
				}else{
					$dstr .= $urls[$i];
				}
				$i++;
			}
			$urls = explode("/",$baseurlpath);
			if(count($urls) <= $pathstep){
				return "http://".$baseurlpath.'/'.$dstr;
			}else{
				$pstr = "http://";
				for($i = 0;$i < count($urls)-$pathstep;$i++){
					$pstr .= $urls[$i]."/";
				}
				$okurl = $pstr.$dstr;
			}
		}
	}else{
		$preurl = strtolower(substr($surl,0,6));
		if(strlen($surl)<7){
			$okurl = "http://".$baseurlpath."/".$surl;
		}elseif(in_array($preurl,array('http:/','ftp://','mms://','rtsp:/','thunde','emule:','ed2k:/'))){
			$okurl = $surl;
		}else $okurl = "http://".$baseurlpath."/".$surl;
	}

	$preurl = strtolower(substr($okurl,0,6));
	if(in_array($preurl,array('ftp://','mms://','rtsp:/','thunde','emule:','ed2k:/'))){
		return $okurl;
	}else{
		$okurl = eregi_replace("^(http://)","",$okurl);
		$okurl = eregi_replace("/{1,}","/",$okurl);
		return "http://".$okurl;
	}
}

?>
