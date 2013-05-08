<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
backallow('normal') || amessage('no_apermission');
load_cache('cotypes,channels,grouptypes,vcps,currencys,permissions,acatalogs');
load_cache('catalogs,cnodes,mtpls',$sid);
cache_merge($channels,'channels',$sid);
include_once M_ROOT."./include/upload.cls.php";
include_once M_ROOT."./include/arcedit.cls.php";
include_once M_ROOT."./include/fields.fun.php";
include_once M_ROOT."./include/commu.fun.php";
include_once M_ROOT."./include/fields.cls.php";
include_once M_ROOT."./include/notice.cls.php";
if($action == 'archiveadd'){//添加任何内容首选必须要指定栏目
	$chid = empty($chid) ? 0 : max(0,intval($chid));
	if(!($channel = read_cache('channel',$chid))) amessage('choosearctype');
	if(empty($channel['uaadd'])){
		//分析模型定义及权限
		!$curuser->checkforbid('issue') && amessage('userisforbid');
		if(!$curuser->pmbypmids('aadd',$channel['apmid'])) amessage('noissuepermission','',$channel['cname']);
		if($channel['allowance'] && $curuser->info['arcallowance']){
			$adds = $db->result_one("SELECT COUNT(*) FROM {$tblprefix}archives WHERE mid='$memberid' AND chid='$chid'");
			if($adds >= $curuser->info['arcallowance']) amessage('arcallowance');
		}
		foreach(array('acoids','aitems','additems','coidscp','cpkeeps') as $var) $$var = $channel[$var] ? explode(',',$channel[$var]) : array();
	
		$forward = empty($forward) ? M_REFERER : $forward;
		$forwardstr = '&forward='.rawurlencode($forward);
		$fields = read_cache('fields',$chid);
	
		if(!submitcheck('barchiveadd')){
			//预定栏目或类系在页面中不能变更,但仍然需要分析权限，如果该类目不存在，则表示没有选择
			$pre_cns = array();
			$pre_cns['caid'] = empty($caid) ? 0 : max(0,intval($caid));
			foreach($cotypes as $k => $v) if(!$v['self_reg'] && !in_array($k,$acoids) && !in_array($k,$additems)) $pre_cns['ccid'.$k] = empty(${'ccid'.$k}) ? 0 : max(0,intval(${'ccid'.$k}));
			//如果指定在某个合辑内添加，需要分析继承类目
			$pid = empty($pid) ? 0 : max(0,intval($pid));
			if($pid && $p_album = $db->fetch_one("SELECT * FROM {$tblprefix}archives WHERE aid=$pid")){//指定合辑内添加文档的信息提示
				if(($p_channel = read_cache('channel',$p_album['chid'])) && $p_channel['isalbum']){//合辑功能是否取消
					$incoids = explode(',',$p_channel['incoids']);
					if(in_array('caid',$incoids))  $pre_cns['caid'] = $p_album['caid'];
					foreach($cotypes as $k => $v) if(!$v['self_reg'] && !in_array($k,$acoids) && !in_array($k,$additems) && !in_array($k,$incoids) && $p_album['ccid'.$k]) $pre_cns['ccid'.$k] = $p_album['ccid'.$k];
				}else $pid = 0;
			}else $pid = 0;
			foreach($pre_cns as $k => $v) if(!$v) unset($pre_cns[$k]);
			if(!$curuser->allow_arcadd($chid,$pre_cns)) amessage('noissuepermission','',lang('cn_pointed'));
	
			$submitstr = '';
			$a_field = new cls_field;
			tabheader($channel['cname'].'&nbsp; -&nbsp; '.lang('add_archive'),'archiveadd',"?entry=archive&action=archiveadd&chid=$chid$param_suffix$forwardstr",2,1,1,1);
	
			if($pid){//指定合辑内添加文档的信息提示
				trhidden('archiveadd[pid]',$pid);
				trbasic(lang('belong_album'),'',$p_channel['cname']."&nbsp; -&nbsp; <a href=\"".view_arcurl($p_album)."\" target=\"_blank\">".mhtmlspecialchars($p_album['subject'])."</a>",'');
				$volids = volidsarr($pid);
				$volids && trbasic(lang('set_volid'),'archiveadd[volid]',makeoption(array('0' => lang('nosetting')) + $volids),'select');
			}
	
			//栏目定义
			if(empty($pre_cns['caid'])){
				trcns('*'.lang('be_catalog'),'archiveadd[caid]',0,$sid,0,$chid,0,lang('p_choose'));
			}else{
				trbasic('*'.lang('be_catalog'),'',@$acatalogs[$pre_cns['caid']]['title'],'');
				trhidden('archiveadd[caid]',$pre_cns['caid']);
			}
			$submitstr .= makesubmitstr('archiveadd[caid]',1,0,0,0,'common');
	
			//类别定义
			foreach($cotypes as $k => $v){
				if(!$v['self_reg'] && !in_array($k,$acoids) && !in_array("ccid$k",$additems)){
					if(empty($pre_cns['ccid'.$k])){
						trcns(($v['notblank'] ? '*' : '').$v['cname'],"archiveadd[ccid$k]",0,$sid,$k,$chid,0,lang('p_choose'));
					}else{
						$coclasses = read_cache('coclasses',$k);
						trbasic(($v['notblank'] ? '*' : '').$v['cname'],'',@$coclasses[$pre_cns['ccid'.$k]]['title'],'');
						trhidden("archiveadd[ccid$k]",$pre_cns['ccid'.$k]);
					}
					$submitstr .= makesubmitstr("archiveadd[ccid$k]", $v['notblank'],0,0,0,'common');
				}
			}
			
			if(!in_array('copy',$aitems) && !in_array('copy',$additems)){
				in_array('caid',$coidscp) && trcns_m(lang('addcpinca'),'archiveadd[cpcaids]','',$sid,0,$chid,lang('p_choose'));
				foreach($cotypes as $k => $v){
					if(!$v['self_reg'] && in_array($k,$coidscp)) trcns_m(lang('addcpincc',$v['cname']),"archiveadd[cpccids$k]",'',$sid,$k,$chid,lang('p_choose'));
				}			
			}
			tabfooter();
	
			tabheader($channel['cname'].'&nbsp; -&nbsp; '.lang('content_set'));
			$subject_table = 'archives';
			foreach($fields as $k => $field){
				if($field['available'] && !$field['isfunc'] && !in_array($k,$additems)){
					$a_field->init();
					$a_field->field = read_cache('field',$chid,$k);
					if($curuser->pmbypmids('field',$a_field->field['pmid'])){//字段附加权限设置
						$a_field->isadd = 1;
						$a_field->trfield('archiveadd');
						$submitstr .= $a_field->submitstr;
					}
				}
			}
			unset($a_field);
			tabfooter();
	
			tabheader($channel['cname'].'&nbsp; -&nbsp; '.lang('more_set'));
			if($channel['validperiod']){//添加时不管哪种模式都可以添加有效期
				$agstr = $channel['mindays'] ? lang('mini').$channel['mindays'].lang('day') : '';
				$agstr .= ($agstr ? ',' : '').($channel['maxdays'] ? lang('max').$channel['maxdays'].lang('day') : '');
				trbasic(lang('set_valid_day'),'archiveadd[validperiod]','','text',$agstr);
				$submitstr .= makesubmitstr('archiveadd[validperiod]',$channel['mindays'] ? 1 : 0,0,$channel['mindays'],$channel['maxdays'],'int');
			}
			if(!in_array('ppids',$aitems) && !in_array('ppids',$additems)) tralbums(lang('addinpriv'),'archiveadd[ppids]',$chid,0);
			if(!in_array('opids',$aitems) && !in_array('opids',$additems)) tralbums(lang('addinopen'),'archiveadd[opids]',$chid,1);
			if(!in_array('rpmid',$aitems) && !in_array('rpmid',$additems)) trbasic(lang('read_pmid'),'archiveadd[rpmid]',makeoption(array('-1' => lang('fromcata')) + pmidsarr('aread'),-1),'select');
			if(!in_array('dpmid',$aitems) && !in_array('dpmid',$additems)) trbasic(lang('down_pmid'),'archiveadd[dpmid]',makeoption(array('-1' => lang('fromcata')) + pmidsarr('down'),-1),'select');
			if(!in_array('salecp',$aitems) && !in_array('salecp',$additems)) trbasic(lang('arc_price'),'archiveadd[salecp]',makeoption(array('' => lang('freesale')) + $vcps['sale']),'select');
			if(!in_array('fsalecp',$aitems) && !in_array('fsalecp',$additems)) trbasic(lang('annex_price'),'archiveadd[fsalecp]',makeoption(array('' => lang('freesale')) + $vcps['fsale']),'select');
			if(!in_array('arctpl',$aitems) && !in_array('arctpl',$additems)) trbasic(lang('archive_content_template'),'archiveadd[arctpl]',makeoption(array('' => lang('noset')) + mtplsarr('archive')),'select');
			if(!in_array('arctpl',$aitems) && !in_array('arctpl',$additems)){
				trbasic(lang('archive_plus_page').'1'.lang('template'),'archiveadd[arctpl1]',makeoption(array('' => lang('noset')) + mtplsarr('archive')),'select');
				trbasic(lang('archive_plus_page').'2'.lang('template'),'archiveadd[arctpl2]',makeoption(array('' => lang('noset')) + mtplsarr('archive')),'select');
				$plus_mode = 'a_archive_1';@include M_ROOT."./include/arcplus.inc.php";
			}
			tabfooter('barchiveadd',lang('add'));
			check_submit_func($submitstr);
			a_guide('archiveadd');
		}else{
			if(empty($archiveadd['caid']) || empty($catalogs[$archiveadd['caid']])) amessage('choosecatalog',axaction(2,M_REFERER));
			if(!array_intersect(array(-1,$archiveadd['caid']),$a_caids)) amessage('fbd_caids',axaction(2,M_REFERER));//没有管理权限，则不能在管理后台的该栏目中添加内容
			$sqlmain = "sid='$sid',
			chid='$chid',
			caid='$archiveadd[caid]',
			mid='$memberid',
			mname='".$curuser->info['mname']."',
			refreshdate='$timestamp',
			createdate='$timestamp'";
	
			$pre_cns = array();
			$pre_cns['caid'] = $archiveadd['caid'];
			//分析分类的定义及权限
			foreach($cotypes as $k => $v){
				if(!$v['self_reg'] && !in_array($k,$acoids) && !in_array("ccid$k",$additems)){
					$archiveadd["ccid$k"] = empty($archiveadd["ccid$k"]) ? 0 : $archiveadd["ccid$k"];
					if($v['notblank'] && !$archiveadd["ccid$k"]) amessage('choosecoclass',axaction(2,M_REFERER),$v['cname']);//必选类系
					$sqlmain .= ",ccid$k = ".$archiveadd["ccid$k"];
					if($archiveadd["ccid$k"]) $pre_cns['ccid'.$k] = $archiveadd["ccid$k"];
				}
			}
			if(!$curuser->allow_arcadd($chid,$pre_cns)) amessage('noissuepermission',axaction(2,M_REFERER),lang('cn_pointed'));//分析类目组合的发表权限
	
			//有效值设置
			$archiveadd['validperiod'] = empty($archiveadd['validperiod']) ? 0 : max(0,intval($archiveadd['validperiod']));
			$channel['mindays'] && $archiveadd['validperiod'] = max($archiveadd['validperiod'],$channel['mindays']);
			$channel['maxdays'] && $archiveadd['validperiod'] = min($archiveadd['validperiod'],$channel['maxdays']);
			if($archiveadd['validperiod']) $sqlmain .= ",enddate='".($timestamp + $archiveadd['validperiod'] * 24 * 3600)."'";
	
			//权限方案与出售
			if(!in_array('rpmid',$aitems) && !in_array('rpmid',$additems)) $sqlmain .= ",rpmid='".$archiveadd['rpmid']."'";
			if(!in_array('dpmid',$aitems) && !in_array('dpmid',$additems)) $sqlmain .= ",dpmid='".$archiveadd['dpmid']."'";
			if(!in_array('salecp',$aitems) && !in_array('salecp',$additems)) $sqlmain .= ",salecp='".$archiveadd['salecp']."'";
			if(!in_array('fsalecp',$aitems) && !in_array('fsalecp',$additems)) $sqlmain .= ",fsalecp='".$archiveadd['fsalecp']."'";
	
			$c_upload = new cls_upload;	
			$fields = fields_order($fields);
			$a_field = new cls_field;
			foreach($fields as $k => $field){
				if($field['available'] && !$field['isfunc'] && !in_array($k,$additems)){
					$a_field->init();
					$a_field->field = read_cache('field',$chid,$k);
					if($curuser->pmbypmids('field',$a_field->field['pmid'])){//字段附加权限设置
						$a_field->deal('archiveadd');
						if(!empty($a_field->error)){
							$c_upload->rollback();
							amessage($a_field->error,axaction(2,M_REFERER));
						}
						$archiveadd[$k] = $a_field->newvalue;
					}
				}
			}
			unset($a_field);
			$oldarr = array();
			$cu_ret = cu_fields_deal($channel['cuid'],'archiveadd',$oldarr);
			$cu_ret && amessage($cu_ret,axaction(2,M_REFERER));
	
			if(isset($archiveadd['keywords'])) $archiveadd['keywords'] = keywords($archiveadd['keywords']);
			$fields['author']['available'] && $archiveadd['author'] = empty($archiveadd['author']) ? $curuser->info['mname'] : $archiveadd['author'];
			if($fields['abstract']['available'] && $channel['autoabstract'] && empty($archiveadd['abstract']) && !empty($archiveadd[$channel['autoabstract']])){
				$archiveadd['abstract'] = autoabstract($archiveadd[$channel['autoabstract']]);
			}
			if($fields['thumb']['available'] && $channel['autothumb'] && empty($archiveadd['thumb']) && !empty($archiveadd[$channel['autothumb']])){
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
			foreach($fields as $k => $field){
				if($field['available'] && !$field['isfunc'] && !in_array($k,$additems)){
					$field = read_cache('field',$chid,$k);
					if($curuser->pmbypmids('field',$field['pmid'])){
						if(!empty($field['istxt'])) $archiveadd[$k] = saveastxt(stripslashes($archiveadd[$k]));
						${'sql'.$field['tbl']} .= (${'sql'.$field['tbl']} ? ',' : '').$k."='".$archiveadd[$k]."'";
					}
				}
			}
			cu_sqls_deal($channel['cuid'],$archiveadd,$sqlmain,$sqlsub,$sqlcustom);//将字段之外的交互资料写入
			
			$db->query("INSERT INTO {$tblprefix}archives SET ".$sqlmain);
			if(!$aid = $db->insert_id()){
				$c_upload->closure(1);
				amessage('addarcfailed',axaction(2,M_REFERER));
			}else{
				$c_upload->closure(1, $aid);
				$db->query("INSERT INTO {$tblprefix}archives_rec SET aid='$aid'");
				$sqlsub = "aid='$aid',needstatic='$timestamp'".($sqlsub ? ',' : '').$sqlsub;
	
				$sqlsub .= ",needstatic1='$timestamp'";
				$sqlsub .= ",needstatic2='$timestamp'";
				$plus_mode = 'needstatic_1';@include M_ROOT."./include/arcplus.inc.php";
	
				if(!in_array('arctpl',$aitems)  && !in_array('arctpl',$additems)) $sqlsub .= ",arctpl='".$archiveadd['arctpl']."'";
				if(!in_array('arctpl',$aitems) && !in_array('arctpl',$additems)){
					$sqlsub .= ",arctpl1='".$archiveadd['arctpl1']."'";
					$sqlsub .= ",arctpl2='".$archiveadd['arctpl2']."'";
					$plus_mode = 'a_archive_2';@include M_ROOT."./include/arcplus.inc.php";
				}
				$db->query("INSERT INTO {$tblprefix}archives_sub SET ".$sqlsub);
				$sqlcustom = "aid='$aid'".($sqlcustom ? ',' : '').$sqlcustom;
				$db->query("INSERT INTO {$tblprefix}archives_$chid SET ".$sqlcustom);
				$curuser->basedeal('archive',1);
	
				$c_notice = new cls_notice;//通知文档更新记录
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
				foreach($pids as $k) $aedit->set_album($k);//归辑设置,与文档数据库无关
				if(!empty($archiveadd['volid']) && !empty($archiveadd['pid'])) $db->query("UPDATE {$tblprefix}albums SET volid='$archiveadd[volid]' WHERE aid=$aid AND pid='$archiveadd[pid]'",'SILENT');
	
				//处理在类目中的复制及更新
				if(!in_array('copy',$aitems) && !in_array('copy',$additems) && $coidscp){
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
				$c_notice->deal();//通知文档更新记录
			}
			$c_upload->saveuptotal(1);
			adminlog(lang('add_archive'));
			amessage('arcaddfinish',axaction(10,$forward));
		}
	
	}else include(M_ROOT.$channel['uaadd']);
}elseif($action == 'archivedetail' && $aid){
	$chid = $db->result_one("SELECT chid FROM {$tblprefix}archives WHERE aid='$aid'");
	if(!($channel = read_cache('channel',$chid))) amessage('choosearctype');
	if(empty($channel['uadetail'])){
		//分析页面设置
		$niuid = empty($niuid) ? 0 : max(0,intval($niuid));
		if($niuid && $u_url = read_cache('inurl',$niuid)){
			$u_tplname = $u_url['tplname'];
			$u_onlyview = empty($u_url['onlyview']) ? 0 : 1;
			$u_mtitle = $u_url['mtitle'];
			$u_guide = $u_url['guide'];
			$vars = array('lists',);
			foreach($vars as $var) if(!empty($u_url['setting'][$var])) ${'u_'.$var} = explode(',',$u_url['setting'][$var]);
		}
		if(empty($u_tplname) || !empty($u_onlyview)){
			$forward = empty($forward) ? M_REFERER : $forward;
			$forwardstr = '&forward='.rawurlencode($forward);
			$aedit = new cls_arcedit;
			$aedit->set_aid($aid);
			$aedit->detail_data();
		
			$chid = $aedit->archive['chid'];
			$channel = &$aedit->channel;
			if(!array_intersect(array(-1,$aedit->archive['caid']),$a_caids)) amessage('fbd_caids');//管理后台对该栏目的限制
		
			$fields = read_cache('fields',$chid);
			foreach(array('acoids','aitems','coidscp','cpkeeps') as $var) $$var = $channel[$var] ? explode(',',$channel[$var]) : array();
			if(!submitcheck('barchivedetail')) {
				if(empty($u_tplname)){
					$submitstr = '';
					$a_field = new cls_field;
		
					tabheader($channel['cname'].'&nbsp; -&nbsp; '.lang('arcedit'),'archivedetail',"?entry=archive&action=archivedetail&aid=$aid$param_suffix$forwardstr",2,1,1,1);
					
					if(empty($u_lists) || in_array('caid',$u_lists)){
						trcns(lang('be_catalog'),'archivenew[caid]',$aedit->archive['caid'],$aedit->archive['sid'],0,$chid,0,lang('p_choose'));
						$submitstr .= makesubmitstr('archivenew[caid]',1,0,0,0,'common');
					}
					//TODO 手动后台添加VIP选项
					$u_lists[] = 'ccid3';
					foreach($cotypes as $k => $v) {
						if(empty($u_lists) || in_array("ccid$k",$u_lists)){
							if(!$v['self_reg'] && !in_array($k,$acoids)){
								trcns($v['cname'],"archivenew[ccid$k]",$aedit->archive["ccid$k"],$aedit->archive['sid'],$k,$chid,0,lang('p_choose'));
								$submitstr .= makesubmitstr("archivenew[ccid$k]", $v['notblank'],0,0,0,'common');
							}
						}
					}
			
					$subject_table = 'archives';
					if (!empty($u_lists)) {
						foreach ($u_lists as $k => $l) {
							if ($l == 'source' || $l == 'keywords' || $l == 'abstract') unset($u_lists[$k]);
						}
					}
					foreach($fields as $k => $field){
						if(empty($u_lists) || in_array($k,$u_lists)){
							if($field['available'] && !$field['isfunc']){
								$a_field->init();
								$a_field->field = read_cache('field',$chid,$k);
								if($curuser->pmbypmids('field',$a_field->field['pmid'])){//字段附加权限设置
									$a_field->oldvalue = isset($aedit->archive[$k]) ? $aedit->archive[$k] : '';
									$a_field->trfield('archivenew');
									$submitstr .= $a_field->submitstr;
								}
							}
						}
					}
			
					if(empty($u_lists) || in_array('rpmid',$u_lists)){
						if(!in_array('rpmid',$aitems)) trbasic(lang('read_pmid'),'archivenew[rpmid]',makeoption(array('-1' => lang('fromcata')) + pmidsarr('aread'),$aedit->archive['rpmid']),'select');
					}
					if(empty($u_lists) || in_array('dpmid',$u_lists)){
						if(!in_array('dpmid',$aitems)) trbasic(lang('down_pmid'),'archivenew[dpmid]',makeoption(array('-1' => lang('fromcata')) + pmidsarr('down'),$aedit->archive['dpmid']),'select');
					}
					if(empty($u_lists) || in_array('salecp',$u_lists)){
						if(!in_array('salecp',$aitems)) trbasic(lang('arc_price'),'archivenew[salecp]',makeoption(array('' => lang('freesale')) + $vcps['sale'],$aedit->archive['salecp']),'select');
					}
					if(empty($u_lists) || in_array('fsalecp',$u_lists)){
						if(!in_array('fsalecp',$aitems)) trbasic(lang('annex_price'),'archivenew[fsalecp]',makeoption(array('' => lang('freesale')) + $vcps['fsale'],$aedit->archive['fsalecp']),'select');
					}
					if(empty($u_lists) || in_array('arctpl',$u_lists)){
						if(!in_array('arctpl',$aitems)) trbasic(lang('archive_content_template'),'archivenew[arctpl]',makeoption(array('' => lang('noset')) + mtplsarr('archive'),$aedit->archive['arctpl']),'select');
						if(!in_array('arctpl',$aitems)){
							trbasic(lang('archive_plus_page').'1'.lang('template'),'archivenew[arctpl1]',makeoption(array('' => lang('noset')) + mtplsarr('archive'),empty($aedit->archive['arctpl1']) ? '' : $aedit->archive['arctpl1']),'select');
							trbasic(lang('archive_plus_page').'2'.lang('template'),'archivenew[arctpl2]',makeoption(array('' => lang('noset')) + mtplsarr('archive'),empty($aedit->archive['arctpl2']) ? '' : $aedit->archive['arctpl2']),'select');
							$plus_mode = 'a_archive_3';@include M_ROOT."./include/arcplus.inc.php";
						}
					}
					if(empty($u_lists) || in_array('cpupdate',$u_lists)){
						if(!in_array('copy',$aitems)){
							$cpupdatearr = array(0 => lang('noupdate'),1 => lang('cpupdate1'),2 => lang('cpupdate2'),);
							trbasic(lang('cpupdate'),'',makeradio('archivenew[cpupdate]',$cpupdatearr,0),'');
						}
					}
					tabfooter('barchivedetail');
					check_submit_func($submitstr);
					a_guide('archivedetail');
				}else include(M_ROOT.$u_tplname);
			}else{
				if(isset($archivenew['caid'])){
					$aedit->arc_caid($archivenew['caid']);
				}
				foreach($cotypes as $k => $v){
					if(isset($archivenew["ccid$k"])){
						if(!$v['self_reg'] && !in_array($k,$acoids)){
							$archivenew["ccid$k"] = empty($archivenew["ccid$k"]) ? 0 : $archivenew["ccid$k"];
							$aedit->arc_ccid($archivenew["ccid$k"],$k);
						}
					}
				}
				//TODO 自动将内容中的值赋值给摘要
				$archivenew['abstract'] = html2text($archivenew['content']);
				
				if(isset($archivenew['rpmid'])){
					if(!in_array('rpmid',$aitems)) $aedit->updatefield('rpmid',$archivenew['rpmid'],'main');
				}
				if(isset($archivenew['dpmid'])){
					if(!in_array('dpmid',$aitems)) $aedit->updatefield('dpmid',$archivenew['dpmid'],'main');
				}
				if(isset($archivenew['salecp'])){
					if(!in_array('salecp',$aitems)) $aedit->updatefield('salecp',$archivenew['salecp'],'main');
				}
				if(isset($archivenew['fsalecp'])){
					if(!in_array('fsalecp',$aitems)) $aedit->updatefield('fsalecp',$archivenew['fsalecp'],'main');
				}
				$aedit->sale_define();
		
				if(isset($archivenew['arctpl'])){
					if(!in_array('arctpl',$aitems)) $aedit->updatefield('arctpl',$archivenew['arctpl'],'sub');
				}
				if(!in_array('arctpl',$aitems)){
					if(isset($archivenew['arctpl1'])) $aedit->updatefield('arctpl1',$archivenew['arctpl1'],'sub');
					if(isset($archivenew['arctpl2'])) $aedit->updatefield('arctpl2',$archivenew['arctpl2'],'sub');
					$plus_mode = 'a_archive_4';@include M_ROOT."./include/arcplus.inc.php";
				}
		
				$c_upload = new cls_upload;	
				$fields = fields_order($fields);
				$a_field = new cls_field;
				foreach($fields as $k => $field){
					if(isset($archivenew[$k])){
						if($field['available'] && !$field['isfunc']){
							$a_field->init();
							$a_field->field = read_cache('field',$chid,$k);
							if($curuser->pmbypmids('field',$a_field->field['pmid'])){//字段附加权限设置
								$a_field->oldvalue = isset($aedit->archive[$k]) ? $aedit->archive[$k] : '';
								$a_field->deal('archivenew');
								if(!empty($a_field->error)){
									$c_upload->rollback();
									amessage($a_field->error,axaction(2,M_REFERER));
								}
								$archivenew[$k] = $a_field->newvalue;
							}
						}
					}
				}
				unset($a_field);
				$cu_ret = cu_fields_deal($channel['cuid'],'archivenew',$aedit->archive);
				!empty($cu_ret) && amessage($cu_ret,axaction(2,M_REFERER));
				$aedit->edit_cudata($archivenew,1);
		
				if(isset($archivenew['keywords'])) $archivenew['keywords'] = keywords($archivenew['keywords'],$aedit->archive['keywords']);
				if($fields['abstract']['available'] && $channel['autoabstract'] && empty($archivenew['abstract']) && isset($archivenew[$channel['autoabstract']])){
					$archivenew['abstract'] = autoabstract($archivenew[$channel['autoabstract']]);
				}
				if($fields['thumb']['available'] && $channel['autothumb'] && empty($archivenew['thumb']) && isset($archivenew[$channel['autothumb']])){
					$field = read_cache('field',$chid,'thumb');
					$archivenew['thumb'] = $c_upload->thumb_pick(stripslashes($archivenew[$channel['autothumb']]),$fields[$channel['autothumb']]['datatype'],$field['rpid']);
				}
				if($channel['autosize'] && isset($archivenew[$channel['autosize']]) && $archivenew[$channel['autosize']] != addslashes($aedit->archive[$channel['autosize']])){
					$archivenew['atmsize'] = atm_size(stripslashes($archivenew[$channel['autosize']]),$fields[$channel['autosize']]['datatype'],$channel['autosizemode']);
					$aedit->updatefield('atmsize',$archivenew['atmsize'],'main');
				}
				if($channel['autobyte'] && isset($archivenew[$channel['autobyte']])){
					$archivenew['bytenum'] = atm_byte(stripslashes($archivenew[$channel['autobyte']]),$fields[$channel['autobyte']]['datatype']);
					$aedit->updatefield('bytenum',$archivenew['bytenum'],'main');
				}
				foreach($fields as $k => $field){
					if(isset($archivenew[$k])){
						if($field['available'] && !$field['isfunc']){
							$field = read_cache('field',$chid,$k);
							if($curuser->pmbypmids('field',$field['pmid'])){
								if(!empty($field['istxt'])) $archivenew[$k] = saveastxt(stripslashes($archivenew[$k]),$aedit->namepres[$k]);
								$aedit->updatefield($k,$archivenew[$k],$field['tbl']);
							}
						}
					}
				}
				$c_upload->closure(1, $aid);
		
				$channel['autocheck'] && $aedit->arc_check('1');
				$c_notice = new cls_notice;
				$aedit->updatedb();
				$c_notice->deal();
		
				if(!empty($archivenew['cpupdate'])) $aedit->updatecopy($archivenew['cpupdate']);
				
				if($channel['autostatic']){
					include_once M_ROOT."./include/arc_static.fun.php";
					arc_static($aid);
					unset($arc);
				}
				$c_upload->saveuptotal();
				adminlog(lang('modify_archive'));
				amessage('arceditfinish',axaction(10,$forward));
			}
		}else include(M_ROOT.$u_tplname);
	} else {
		include(M_ROOT.$channel['uadetail']);
	}
}elseif($action == 'viewinfos' && $aid){//文档详细信息
	$aedit = new cls_arcedit;
	$aedit->set_aid($aid);
	$aedit->detail_data();
	$chid = $aedit->archive['chid'];
	tabheader(lang('based_msg'));
	trbasic(lang('archive_title'),'',$aedit->archive['subject'],'');
	trbasic(lang('member_cname'),'',$aedit->archive['mname'],'');
	trbasic(lang('add_time'),'',date("Y-m-d H:i:s",$aedit->archive['createdate']),'');
	trbasic(lang('update_time'),'',date("Y-m-d H:i:s",$aedit->archive['updatedate']),'');
	trbasic(lang('readd_time'),'',date("Y-m-d H:i:s",$aedit->archive['refreshdate']),'');
	trbasic(lang('end1_time'),'',$aedit->archive['enddate'] ? date("Y-m-d H:i:s",$aedit->archive['enddate']) : '-','');
	trbasic(lang('check_state'),'',($aedit->archive['checked'] ? lang('check') : lang('uncheck')).'&nbsp;&nbsp;/&nbsp;&nbsp;'.($aedit->archive['editor'] ? $aedit->archive['editor'] : '-'),'');
	trbasic(lang('clicks').'&nbsp;/&nbsp;'.lang('comments'),'',$aedit->archive['clicks'].'&nbsp;&nbsp;/&nbsp;&nbsp;'.$aedit->archive['comments'],'');
	tabfooter();
	tabheader(lang('othermessage'));
	trbasic(lang('channel'),'',$aedit->archive['chid'] ? $channels[$aedit->archive['chid']]['cname'] : '-','');
//trbasic(lang('browse archive deductvalue'),'',empty($aedit->archive['tax_price']) ? '-' : $aedit->archive['tax_price'],'');
	//trbasic(lang('arc_price'),'',empty($aedit->archive['sale_price']) ? '-' : $aedit->archive['sale_price'],'');
	//trbasic(lang('attachment deductvalue').'/'.lang('piece'),'',empty($aedit->archive['f_tax_price']) ? '-' : $aedit->archive['f_tax_price'],'');
	//trbasic(lang('attachment saleprice').'/'.lang('piece'),'',empty($aedit->archive['f_sale_price']) ? '-' : $aedit->archive['f_sale_price'],'');
	tabfooter();
	if(!isset($inajax))echo "<input class=\"button\" type=\"submit\" name=\"\" value=\"".lang('goback')."\" onclick=\"history.go(-1);\">";
}
?>
