<?
include_once dirname(__FILE__).'/include/general.inc.php';
include_once M_ROOT."./include/common.fun.php";
include_once M_ROOT."./include/cheader.inc.php";
include_once M_ROOT.'./include/arcedit.cls.php';
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/fields.cls.php";
include_once M_ROOT."./include/commu.fun.php";
include_once M_ROOT."./include/upload.cls.php";
include_once M_ROOT."./include/notice.cls.php";
load_cache('currencys,permissions,acatalogs');

!$curuser->checkforbid('issue') && message('userisforbid');
//����ģ�Ͷ��弰Ȩ��
$chid = empty($chid) ? 0 : max(0,intval($chid));
if(!($channel = read_cache('channel',$chid))) message('choosearctype');
if(empty($channel['ucadd'])){
	if(!$curuser->pmbypmids('aadd',$channel['apmid'])) message('noissuepermission');
	if($channel['allowance'] && @$curuser->info['arcallowance']){
		$adds = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}archives WHERE mid='$memberid' AND chid='$chid'");
		if($adds >= $curuser->info['arcallowance']) message('arcallowance');
	}
	foreach(array('ccoids','citems','additems','coidscp','cpkeeps') as $var) $$var = $channel[$var] ? explode(',',$channel[$var]) : array();
	$forward = empty($forward) ? M_REFERER : $forward;
	$forwardstr = '&forward='.rawurlencode($forward);
	$fields = read_cache('fields',$chid);
	
	if(!submitcheck('barchiveadd')){
		if(!($tplname = @$channel['addtpl'])){
			_header();
			$nsid = isset($nsid) ? max(-1,intval($nsid)) : -1;
			$pre_cns = array();
			$pre_cns['caid'] = empty($caid) ? 0 : max(0,intval($caid));
			foreach($cotypes as $k => $v) if(!$v['self_reg'] && !in_array($k,$ccoids) && !in_array($k,$additems)) $pre_cns['ccid'.$k] = empty(${'ccid'.$k}) ? 0 : max(0,intval(${'ccid'.$k}));
			//���ָ����ĳ���ϼ�����ӣ���Ҫ�����̳���Ŀ
			$pid = empty($pid) ? 0 : max(0,intval($pid));
			if($pid && $p_album = $db->fetch_one("SELECT * FROM {$tblprefix}archives WHERE aid=$pid")){//ָ���ϼ�������ĵ�����Ϣ��ʾ
				if($p_channel = read_cache('channel',$p_album['chid'])){
					$incoids = explode(',',$p_channel['incoids']);
					if(in_array('caid',$incoids))  $pre_cns['caid'] = $p_album['caid'];
					foreach($cotypes as $k => $v) if(!$v['self_reg']  && !in_array($k,$ccoids) && !in_array($k,$additems) && !in_array($k,$incoids) && $p_album['ccid'.$k]) $pre_cns['ccid'.$k] = $p_album['ccid'.$k];
				}else $pid = 0;
			}else $pid = 0;
	
	
			foreach($pre_cns as $k => $v) if(!$v) unset($pre_cns[$k]);
			if(!$curuser->allow_arcadd($chid,$pre_cns)) mcmessage('noissuepermission','',lang('cn_pointed'));
			
			if(!empty($pre_cns['caid'])) $nsid = $acatalogs[$pre_cns['caid']]['sid'];
			if($pid) $nsid = $p_album['sid'];
			if($nsid == -1) $catalogs = &$acatalogs;
			else load_cache('catalogs',$nsid);
	
			$submitstr = '';
			mtabheader($channel['cname'].'&nbsp; -&nbsp; '.lang('add_archive'),'archiveadd',"?chid=$chid$forwardstr",2,1,1,1);
	
			if($pid){//ָ���ϼ�������ĵ�����Ϣ��ʾ
				trhidden('archiveadd[pid]',$pid);
				mtrbasic(lang('belong_album'),'',$p_channel['cname']."&nbsp; -&nbsp; <a href=\"".view_arcurl($p_album)."\" target=\"_blank\">".mhtmlspecialchars($p_album['subject'])."</a>",'');
				$volids = volidsarr($pid);
				$volids && mtrbasic(lang('set_volid'),'archiveadd[volid]',makeoption(array('0' => lang('nosetting')) + $volids),'select');
			}
	
			//��Ŀ����
			if(empty($pre_cns['caid'])){
				mtrcns('*'.lang('be_catalog'),'archiveadd[caid]',0,$nsid,0,$chid,0,lang('p_choose'));
			}else{
				mtrbasic('*'.lang('be_catalog'),'',@$acatalogs[$pre_cns['caid']]['title'],'');
				trhidden('archiveadd[caid]',$pre_cns['caid']);
			}
			$submitstr .= makesubmitstr('archiveadd[caid]',1,0,0,0,'common');
	
			//�����
			foreach($cotypes as $k => $v){
				//TODO �ж�����С˵�ǲ���VIPС˵
				if (empty($p_album['ccid3'])) continue;
				
				if(!$v['self_reg'] && !in_array($k,$ccoids) && !in_array("ccid$k",$additems)){
					if(empty($pre_cns['ccid'.$k])){
						mtrcns(($v['notblank'] ? '*' : '').$v['cname'],"archiveadd[ccid$k]",0,$nsid,$k,$chid,0,lang('p_choose'));
					}else{
						//TODO �����VIP���ã���Ȼ����ѡ���Ƿ���VIP�½�
						if ($k == 3) {
							mtrcns(($v['notblank'] ? '*' : '').$v['cname'],"archiveadd[ccid$k]",0,$nsid,$k,$chid,0,lang('p_choose'));
						} else {
							$coclasses = read_cache('coclasses',$k);
							mtrbasic(($v['notblank'] ? '*' : '').$v['cname'],'',@$coclasses[$pre_cns['ccid'.$k]]['title'],'');
							trhidden("archiveadd[ccid$k]",$pre_cns['ccid'.$k]);
						}
					}
					$submitstr .= makesubmitstr("archiveadd[ccid$k]",$v['notblank'],0,0,0,'common');
				}
			}
			
			if(!in_array('copy',$citems) && !in_array('copy',$additems)){
				in_array('caid',$coidscp) && mtrcns_m(lang('addcpinca'),'archiveadd[cpcaids]','',$nsid,0,$chid,lang('p_choose'));
				foreach($cotypes as $k => $v){
					if(!$v['self_reg'] && in_array($k,$coidscp)) mtrcns_m(lang('addcpincc',$v['cname']),"archiveadd[cpccids$k]",'',$nsid,$k,$chid,lang('p_choose'));
				}			
			}
	
			$a_field = new cls_field;
			$subject_table = 'archives';
			foreach($fields as $k => $field){
				if($field['available'] && !$field['isadmin'] && !$field['isfunc'] && !in_array($k,$additems)){
					$a_field->init(1);
					$a_field->field = read_cache('field',$chid,$k);
					if($curuser->pmbypmids('field',$a_field->field['pmid'])){//�ֶθ���Ȩ������
						$a_field->isadd = 1;
						$a_field->trfield('archiveadd');
						$submitstr .= $a_field->submitstr;
					}
				}
			}
			unset($a_field);
			if($channel['validperiod']){
				$agstr = $channel['mindays'] ? lang('mini').$channel['mindays'].lang('day') : '';
				$agstr .= ($agstr ? ',' : '').($channel['maxdays'] ? lang('max').$channel['maxdays'].lang('day') : '');
				mtrbasic(lang('set_valid_day'),'archiveadd[validperiod]','','text',$agstr);
				$submitstr .= makesubmitstr('archiveadd[validperiod]',$channel['mindays'] ? 1 : 0,0,$channel['mindays'],$channel['maxdays'],'int');
			}
			if(!in_array('ppids',$citems) && !in_array('ppids',$additems)) mtralbums(lang('addinpriv'),'archiveadd[ppids]',$chid,0);
			if(!in_array('opids',$citems) && !in_array('opids',$additems)) mtralbums(lang('addinopen'),'archiveadd[opids]',$chid,1);
			if(!in_array('salecp',$citems) && !in_array('salecp',$additems)) mtrbasic(lang('arc_price'),'archiveadd[salecp]',makeoption(array('' => lang('freesale')) + $vcps['sale']),'select');
			if(!in_array('fsalecp',$citems) && !in_array('fsalecp',$additems)) mtrbasic(lang('annex_price'),'archiveadd[fsalecp]',makeoption(array('' => lang('freesale')) + $vcps['fsale']),'select');
			if(!in_array('ucid',$citems) && !in_array('ucid',$additems)){//�����ĵ��ĸ��˷���
				$uclasses = loaduclasses($curuser->info['mid']);
				$ucidsarr = array(0 => lang('p_choose'));
				foreach($uclasses as $k => $v) if(!$v['cuid']) $ucidsarr[$k] = $v['title'];
				mtrbasic(lang('mycoclass'),'archiveadd[ucid]',makeoption($ucidsarr),'select');
			}
			$submitstr .= mtr_regcode('archive');
			mtabfooter('barchiveadd',lang('add'));
			check_submit_func($submitstr);
			_footer();
		}else{
			include_once M_ROOT.'./include/common.fun.php';
			parse_str($_SERVER['QUERY_STRING'],$_da);
			_aenter($_da,1);
			@extract($btags);
			extract($_da,EXTR_OVERWRITE);
			tpl_refresh($tplname);
			@include M_ROOT."template/$templatedir/pcache/$tplname.php";
			
			$_content = ob_get_contents();
			ob_clean();
			mexit($_content);
		}
	}else{
		$inajax ? aheader() : _header();
		if(!regcode_pass('archive',empty($regcode) ? '' : trim($regcode))) mcmessage('safecodeerr',axaction(2,M_REFERER));
		if(empty($archiveadd['caid']) || !($catalog = @$acatalogs[$archiveadd['caid']])) mcmessage('choosecatalog',axaction(2,M_REFERER));
		if($sid != $catalog['sid']){
			switch_cache($catalog['sid']);
			$sid = $catalog['sid'];
		}
		$sqlmain = "sid='$sid',
		caid='$archiveadd[caid]',
		chid='$chid',
		mid='$memberid',
		mname='".$curuser->info['mname']."',
		createdate='$timestamp',
		refreshdate='$timestamp'";
		
		//TODO �ֶ�ָ����ת��ַ
		$forward = '/adminm.php?action=archives&nmuid=2';
	
		$pre_cns = array();
		$pre_cns['caid'] = $archiveadd['caid'];
		//��������Ķ��弰Ȩ��
		foreach($cotypes as $k => $v){
			if(!$v['self_reg'] && !in_array($k,$ccoids) && !in_array("ccid$k",$additems)){
				$archiveadd["ccid$k"] = empty($archiveadd["ccid$k"]) ? 0 : $archiveadd["ccid$k"];
				if($v['notblank'] && !$archiveadd["ccid$k"]) mcmessage('choosecoclass',axaction(2,M_REFERER),$v['cname']);//��ѡ��ϵ
				$sqlmain .= ",ccid$k = ".$archiveadd["ccid$k"];
				if($archiveadd["ccid$k"]) $pre_cns['ccid'.$k] = $archiveadd["ccid$k"];
			}
		}
		if(!$curuser->allow_arcadd($chid,$pre_cns)) mcmessage('noissuepermission',axaction(2,M_REFERER),lang('cn_pointed'));//������Ŀ��ϵķ���Ȩ��
	
		//��Чֵ����
		$archiveadd['validperiod'] = empty($archiveadd['validperiod']) ? 0 : max(0,intval($archiveadd['validperiod']));
		$channel['mindays'] && $archiveadd['validperiod'] = max($archiveadd['validperiod'],$channel['mindays']);
		$channel['maxdays'] && $archiveadd['validperiod'] = min($archiveadd['validperiod'],$channel['maxdays']);
		if($archiveadd['validperiod']) $sqlmain .= ",enddate='".($timestamp + $archiveadd['validperiod'] * 24 * 3600)."'";
	
		//Ȩ�޷��������
		if(!in_array('salecp',$citems) && !in_array('salecp',$additems) && !empty($archiveadd['salecp'])) $sqlmain .= ",salecp='".$archiveadd['salecp']."'";
		if(!in_array('fsalecp',$citems) && !in_array('fsalecp',$additems) && !empty($archiveadd['fsalecp'])) $sqlmain .= ",fsalecp='".$archiveadd['fsalecp']."'";
		if(!in_array('ucid',$citems) && !in_array('ucid',$additems) && !empty($archiveadd['ucid'])) $sqlmain .= ",ucid='".$archiveadd['ucid']."'";
	
		$c_upload = new cls_upload;	
		$fields = fields_order($fields);
		$a_field = new cls_field;
		foreach($fields as $k => $field){
			if($field['available'] && !$field['isadmin']  && !$field['isfunc'] && !in_array($k,$additems)){
				$a_field->init(1);
				$a_field->field = read_cache('field',$chid,$k);
				if($curuser->pmbypmids('field',$a_field->field['pmid'])){
					$a_field->deal('archiveadd');
					if(!empty($a_field->error)){
						$c_upload->rollback();
						mcmessage($a_field->error,axaction(2,M_REFERER));
					}
					$archiveadd[$k] = $a_field->newvalue;
				}
			}
		}
		unset($a_field);
		
		//TODO ֱ�ӽ��������滻Ϊ����
		$curuser->detail_data();
		$archiveadd['author'] = $curuser->info['biming'];
		
		//TODO ֱ�ӽ����˼��д�뵽ժҪ
		$archiveadd['abstract'] = html2text($archiveadd['content']);
	
		$oldarr = array();
		$cu_ret = cu_fields_deal($channel['cuid'],'archiveadd',$oldarr);
		$cu_ret && mcmessage($cu_ret,axaction(2,M_REFERER));
		
		if(isset($archiveadd['keywords'])) $archiveadd['keywords'] = keywords($archiveadd['keywords']);
		$fields['author']['available'] && $archiveadd['author'] = empty($archiveadd['author']) ? $curuser->info['mname'] : $archiveadd['author'];
		if($fields['abstract']['available'] && !$fields['abstract']['isadmin'] && $channel['autoabstract'] && empty($archiveadd['abstract']) && isset($archiveadd[$channel['autoabstract']])){
			$archiveadd['abstract'] = autoabstract($archiveadd[$channel['autoabstract']]);
		}
		if($fields['thumb']['available'] && !$fields['thumb']['isadmin'] && $channel['autothumb'] && empty($archiveadd['thumb']) && isset($archiveadd[$channel['autothumb']])){
			$field = read_cache('field',$chid,'thumb');
			$archiveadd['thumb'] = $c_upload->thumb_pick(stripslashes($archiveadd[$channel['autothumb']]),$fields[$channel['autothumb']]['datatype'],$field['rpid']);
		}
		if($channel['autosize'] && !empty($archiveadd[$channel['autosize']])){
			$archiveadd['atmsize'] = atm_size(stripslashes($archiveadd[$channel['autosize']]),$fields[$channel['autosize']]['datatype'],$channel['autosizemode']);
			$sqlmain .= ",atmsize='".$archiveadd['atmsize']."'";
		}
		if($channel['autobyte'] && isset($archiveadd[$channel['autobyte']])){
			$archiveadd['bytenum'] = atm_byte(stripslashes($archiveadd[$channel['autobyte']]),$fields[$channel['autobyte']]['datatype']);
			$sqlmain .= ",bytenum='".$archiveadd['bytenum']."'";
		}
	
		$sqlsub = $sqlcustom = '';
		
		foreach ($additems as $k => $v) {
			if ($v == 'author' || $v == 'abstract') {
				unset($additems[$k]);
			}
		}
		//var_dump($additems);
		foreach($fields as $k => $field){
			if($field['available'] && !$field['isadmin'] && !$field['isfunc'] && !in_array($k,$additems)){
				@$a_field->field = read_cache('field',$chid,$k);
				if($curuser->pmbypmids('field',$a_field->field['pmid'])){//�ֶθ���Ȩ������
					if(!empty($field['istxt'])) $archiveadd[$k] = saveastxt(stripslashes($archiveadd[$k]));
					${'sql'.$field['tbl']} .= (${'sql'.$field['tbl']} ? ',' : '').$k."='".$archiveadd[$k]."'";
				}
			}
		}
		cu_sqls_deal($channel['cuid'],$archiveadd,$sqlmain,$sqlsub,$sqlcustom);//���ֶ�֮��Ľ�������д��
	
		$db->query("INSERT INTO {$tblprefix}archives SET ".$sqlmain);
		if(!$aid = $db->insert_id()){
			$c_upload->closure(1);
			mcmessage('arcsaveerr',axaction(2,M_REFERER));
		}else{
			$c_upload->closure(1, $aid);
			$db->query("INSERT INTO {$tblprefix}archives_rec SET aid='$aid'");
	
			$sqlsub = "aid='$aid',needstatic='$timestamp'".($sqlsub ? ',' : '').$sqlsub;
			$sqlsub .= ",needstatic1='$timestamp'";
			$sqlsub .= ",needstatic2='$timestamp'";
			$plus_mode = 'needstatic_1';@include M_ROOT."./include/arcplus.inc.php";
			
			$db->query("INSERT INTO {$tblprefix}archives_sub SET ".$sqlsub);
	
			$sqlcustom = "aid='$aid'".($sqlcustom ? ',' : '').$sqlcustom;
			$db->query("INSERT INTO {$tblprefix}archives_$chid SET ".$sqlcustom);
			$curuser->basedeal('archive',1);
			$c_notice = new cls_notice;//֪ͨ�ĵ����¼�¼
			$aedit = new cls_arcedit;
			$aedit->set_aid($aid);
			$aedit->set_arcurl();
			$aedit->set_cpid($aid);
			if($fields['keywords']['available'] && $channel['autokeyword'] && empty($aedit->archive['keywords'])){
				include_once M_ROOT."./include/splitword.cls.php";
				$a_split = new SplitWord();
				$aedit->autokeyword();
				unset($a_split);
			}
			if($channel['autocheck']) $aedit->arc_check(1,0);
			$aedit->updatedb();
	
			$pids = array();
			if(!empty($archiveadd['pid'])) $pids[] = max(0,intval($archiveadd['pid']));
			foreach(array('ppids','opids') as $var) if(!empty($archiveadd[$var])) $pids = array_merge($pids,explode(',',$archiveadd[$var]));
			$pids = array_filter(array_unique($pids));
			foreach($pids as $k) $aedit->set_album($k);//�鼭����,���ĵ����ݿ��޹�
			if(!empty($archiveadd['volid']) && !empty($archiveadd['pid'])) $db->query("UPDATE {$tblprefix}albums SET volid='$archiveadd[volid]' WHERE aid=$aid AND pid='$archiveadd[pid]'",'SILENT');
	
			//��������Ŀ�еĸ��Ƽ�����
			if(!in_array('copy',$citems) && !in_array('copy',$additems) && $coidscp){
				$aedit->init();
				$aedit->set_aid($aid);
				if(in_array('caid',$coidscp) && $cpcaids = explode(',',$archiveadd['cpcaids'])){
					foreach($cpcaids as $k1) $aedit->addcopy(0,$k1);
				}
				foreach($cotypes as $k => $v){
					if(!$v['self_reg'] && in_array($k,$coidscp) && ${"cpccids$k"} = explode(',',$archiveadd["cpccids$k"])){
						foreach(${"cpccids$k"} as $k1) $aedit->addcopy($k,$k1);
					}
				}
			}
			unset($aedit);
	
			if($channel['autostatic']){
				include_once M_ROOT."./include/arc_static.fun.php";
				arc_static($aid);
				unset($arc);
			}
			$c_notice->deal();//֪ͨ�ĵ����¼�¼
		}
		$c_upload->saveuptotal(1);
		mcmessage('arcaddfinish',axaction(34,$forward));
	}
}else include(M_ROOT.$channel['ucadd']);
mexit();
?>

