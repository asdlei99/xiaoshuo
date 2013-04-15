<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
backallow('subsite') || amessage('no_apermission');
$url_type = 'subsite';include 'urlsarr.inc.php';

if($action == 'subsiteadd'){
	if(!submitcheck('bsubsiteadd')){
		url_nav(lang('subsitemanager'),$urlsarr,'add');
		$submitstr = '';
		tabheader(lang('addconsub'),'subsiteadd',"?entry=subsites&action=subsiteadd",2,1,1);
		trbasic(lang('subsitecname'),'subsitenew[sitename]','','text');
		trbasic(lang('subsstadir'),'subsitenew[dirname]','','text');
		trbasic(lang('substempldir'),'subsitenew[templatedir]','','text',lang('agtemplatedir'));
		$submitstr .= makesubmitstr('subsitenew[sitename]',1,0,0,80);
		$submitstr .= makesubmitstr('subsitenew[dirname]',1,'tagtype',0,15);
		$submitstr .= makesubmitstr('subsitenew[templatedir]',1,'tagtype',0,15);
		tabfooter('bsubsiteadd');
		check_submit_func($submitstr);
		a_guide('subsiteadd');
	}else{
		$subsitenew['sitename'] = trim(strip_tags($subsitenew['sitename']));
		$subsitenew['dirname'] = trim(strip_tags($subsitenew['dirname']));
		$subsitenew['templatedir'] = trim(strip_tags($subsitenew['templatedir']));
		if(!$subsitenew['sitename'] || !$subsitenew['dirname'] || !$subsitenew['templatedir']) amessage('subdatamiss',M_REFERER);
		if(preg_match("/[^a-zA-Z_0-9]+/",$subsitenew['dirname'])) amessage('substadirill',M_REFERER);
		if(preg_match("/[^a-zA-Z_0-9]+/",$subsitenew['templatedir'])) amessage('subtemdirill',M_REFERER);
		$subsitenew['dirname'] = strtolower($subsitenew['dirname']);
		$subsitenew['templatedir'] = strtolower($subsitenew['templatedir']);
		if(!mmkdir(M_ROOT.$subsitenew['dirname'],0)) anmessage('nowcresubstadir',M_REFERER);
		if(!mmkdir(M_ROOT.'template/'.$subsitenew['templatedir'],0)) amessage('nowcresubtemdir',M_REFERER);
		$db->query("INSERT INTO {$tblprefix}subsites SET 
					sitename='$subsitenew[sitename]',
					dirname='$subsitenew[dirname]',
					templatedir='$subsitenew[templatedir]',
					ineedstatic='$timestamp'
					");
		if($nsid = $db->insert_id()){
			adminlog(lang('addsubsite'));
			updatecache('subsites');
			$subsites = reload_cache('subsites');
			include_once M_ROOT."./include/cparse.fun.php";
			cn_blank('','i',$nsid);
			amessage('subaddfin', '?entry=subsites&action=subsitesedit');
		}else amessage('subaddfai', '?entry=subsites&action=subsitesedit');
	}
}elseif($action =='subsitesedit'){
	if(!submitcheck('bsubsitesedit')){
		url_nav(lang('subsitemanager'),$urlsarr,'admin');
		tabheader(lang('subsitemanager'),'subsitesedit','?entry=subsites&action=subsitesedit','10');
		trcategory(array(lang('id'),lang('close'),lang('subsitecname'),lang('order'),lang('subsstadir'),lang('look'),lang('admin'),lang('delete'),lang('transtomsite')));
		$query = $db->query("SELECT * FROM {$tblprefix}subsites ORDER BY vieworder,sid");
		while($row = $db->fetch_array($query)){
			$nsid = $row['sid'];
			$row['siteurl']  = view_siteurl($nsid);
			echo "<tr class=\"txt\">\n".
				"<td class=\"txtC w30\">$row[sid]</td>\n".
				"<td class=\"txtC w30\"><input class=\"checkbox\" type=\"checkbox\" name=\"subsitesnew[$nsid][closed]\" value=\"1\"".(empty($row['closed']) ? '' : ' checked')."></td>\n".
				"<td class=\"txtL\"><input type=\"text\" name=\"subsitesnew[$nsid][sitename]\" value=\"".mhtmlspecialchars($row['sitename'])."\" size=\"25\"></td>\n".
				"<td class=\"txtC w60\"><input type=\"text\" name=\"subsitesnew[$nsid][vieworder]\" value=\"$row[vieworder]\" size=\"4\"></td>\n".
				"<td class=\"txtC\">$row[dirname]</td>\n".
				"<td class=\"txtC w30\"><a href=\"$row[siteurl]\" target=\"_blank\">".lang('index')."</a></td>\n".
				"<td class=\"txtC w30\"><a href=\"?sid=$nsid\" target=\"_blank\">".lang('admin')."</a></td>\n".
				"<td class=\"txtC w30\"><a href=\"?entry=subsites&action=subsitedel&nsid=$nsid\">".lang('delete')."</a></td>\n".
				"<td class=\"txtC w60\"><a href=\"?entry=subsites&action=tomsite&nsid=$nsid\">>>".lang('start')."</a></td>\n".
				"</tr>\n";
		}
		tabfooter('bsubsitesedit');
		a_guide('subsitesedit');
	}else{
		if(!empty($subsitesnew)){
			foreach($subsitesnew as $k => $v){
				$v['closed'] = empty($v['closed']) ? 0 : 1;
				$v['vieworder'] = max(0,intval($v['vieworder']));
				$v['sitename'] = trim($v['sitename']);
				!$v['sitename'] && $v['sitename'] = $subsites[$k]['sitename'];
				$db->query("UPDATE {$tblprefix}subsites SET sitename='$v[sitename]',closed='$v[closed]',vieworder='$v[vieworder]' WHERE sid='$k'");
			}
		}
		updatecache('subsites');
		adminlog(lang('subsitemanager'),lang('sublisadmope'));
		amessage('subopefin',"?entry=subsites&action=subsitesedit");
	}
}elseif($action == 'tosubsite'){
	if(!submitcheck('btosubsite')){
		url_nav(lang('subsitemanager'),$urlsarr,'tosub');
		$submitstr = '';
		tabheader(lang('newsubset'),'tosubsite',"?entry=subsites&action=tosubsite",2,1,1);
		trbasic(lang('subsitecname'),'subsitenew[sitename]','','text');
		trbasic(lang('subsstadir'),'subsitenew[dirname]','','text');
		$submitstr .= makesubmitstr('subsitenew[sitename]',1,0,0,80);
		$submitstr .= makesubmitstr('subsitenew[dirname]',1,'tagtype',0,15);
		tabfooter('btosubsite');
		check_submit_func($submitstr);
		a_guide('tosubsite');
	}else{
		$subsitenew['sitename'] = trim(strip_tags($subsitenew['sitename']));
		$subsitenew['dirname'] = trim(strip_tags($subsitenew['dirname']));
		if(!$subsitenew['sitename'] || !$subsitenew['dirname']) amessage('subdatamiss',M_REFERER);
		if(preg_match("/[^a-zA-Z_0-9]+/",$subsitenew['dirname'])) amessage('substadirill',M_REFERER);
		$subsitenew['dirname'] = strtolower($subsitenew['dirname']);
		if(!mmkdir(M_ROOT.$subsitenew['dirname'],0)) anmessage('nowcresubstadir',M_REFERER);
		$db->query("INSERT INTO {$tblprefix}subsites SET 
					sitename='$subsitenew[sitename]',
					dirname='$subsitenew[dirname]',
					templatedir='$templatedir',
					ineedstatic='$timestamp'
					");
		if($nsid = $db->insert_id()){
			updatecache('subsites');//��Ҫ�Ƚ�ģ��Ŀ¼������վ�ڴ�֮�У����ܽ���ģ���ת��
			$subsites = reload_cache('subsites');
			include_once M_ROOT."./include/cparse.fun.php";
			cn_blank('','i',$nsid);

			foreach(array('catalogs','cnconfigs','cnodes','archives','freeinfos','gmissions','gmodels','gurls') as $dbtable){
				$db->query("UPDATE {$tblprefix}$dbtable SET sid='$nsid' WHERE sid='0'");
			}
			//������վ��¼��Ҫ�����ļ�¼������
			$s_config = array();
			load_cache('channels');
			foreach($channels as $k => $v){
				$v = read_cache('channel',$k,'',$sid);
				$s_config[$k]['available'] = $v['available'];
				$s_config[$k]['arctpl'] = $v['arctpl'];
				$s_config[$k]['pretpl'] = $v['pretpl'];
				$s_config[$k]['srhtpl'] = $v['srhtpl'];
			}
			$s_config = addslashes(serialize($s_config));
			$db->query("UPDATE {$tblprefix}subsites SET channels='$s_config' WHERE sid='$nsid'");

			$s_config = array();
			load_cache('commus');
			foreach($commus as $k => $v){
				$v = read_cache('commu',$k,'',$sid);
				$s_config[$k]['available'] = $v['available'];
				$s_config[$k]['cutpl'] = $v['cutpl'];
				$s_config[$k]['addtpl'] = $v['addtpl'];
			}
			$s_config = addslashes(serialize($s_config));
			$db->query("UPDATE {$tblprefix}subsites SET commus='$s_config' WHERE sid='$nsid'");

			$sqlstr = '';
			foreach(array('cmslogo','cmstitle','cmskeyword','cmsdescription','hometpl',) as $var){
				$sqlstr .= ($sqlstr ? ',' : '')."$var='".addslashes($$var)."'";
			}
			$db->query("UPDATE {$tblprefix}subsites SET $sqlstr WHERE sid='$nsid'");

			//����ѱ�ת�ߵ�ϸ�ֻ���
			load_cache('catalogs,cnodes,gmissions,gmodels',$sid);
			foreach($catalogs as $k => $v){
				del_cache('catalog',$k,'',$sid);
			}
			foreach($cnodes as $k => $v){
				del_cnode($k,$sid);
			}
			foreach($gmissions as $k => $v){
				del_cache('gmission',$k,'',$sid);
			}
			foreach($gmodels as $k => $v){
				del_cache('gmodel',$k,'',$sid);
			}
			//ģ���е��������ת����sid����ת��
			load_cache('utags,ctags,ptags,rtags,mtpls,sptpls',$sid);
			foreach(array('utags','ctags','ptags','rtags','mtpls','sptpls',) as $var){
				cache2file($$var,$var,$var,$nsid);
			}
			foreach($utags as $k => $v){
				$ocache = read_cache('utag',$k,'',$sid);
				cache2file($ocache,cache_name('utag',$k),'utag',$nsid);
			}
			foreach($ctags as $k => $v){
				$ocache = read_cache('ctag',$k,'',$sid);
				cache2file($ocache,cache_name('ctag',$k),'ctag',$nsid);
			}
			foreach($ptags as $k => $v){
				$ocache = read_cache('ptag',$k,'',$sid);
				cache2file($ocache,cache_name('ptag',$k),'ptag',$nsid);
			}
			foreach($rtags as $k => $v){
				$ocache = read_cache('rtag',$k,'',$sid);
				cache2file($ocache,cache_name('rtag',$k),'rtag',$nsid);
			}
			
			//�����վ�ľ�̬Ŀ¼�е���������
			$cnhtmldir && clear_dir(M_ROOT.$cnhtmldir,false);
			@unlink(M_ROOT.$homedefault);

			rebuild_cache(-1);
			adminlog(lang('msitetranstsubsite'));
			amessage('msitrasubfin', '?entry=subsites&action=subsitesedit');
		}else amessage('msitrasubfai', '?entry=subsites&action=subsitesedit');

	}
}elseif($action == 'tomsite' && $nsid){
	if(empty($confirm)){
		$message = lang('poisubstatramsi')."<br><br>";
		$message .= lang('confirmclick')."[<a href=?entry=subsites&action=tomsite&nsid=$nsid&confirm=1>".lang('start')."</a>]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		$message .= lang('giveupclick')."[<a href=?entry=subsites&action=subsitesedit>".lang('goback')."</a>]";
		amessage($message);
	}
	//�����վ�Ƿ��վ��
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}archives WHERE sid='0'")){
		amessage('delmsiarcoralb','?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}catalogs WHERE sid='0'")){
		amessage('delmsicat', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}cnodes WHERE sid='0'")){
		amessage('delmsicno', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}cnconfigs WHERE sid='0'")){
		amessage('delmsicnocon', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}freeinfos WHERE sid='0'")){
		amessage('delmsiisopag', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}gurls WHERE sid='0'")){
		amessage('delmsigatrec', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}gmissions WHERE sid='0'")){
		amessage('delmsigatmiss', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}gmodels WHERE sid='0'")){
		amessage('delmsgatcha', '?entry=subsites&action=subsitesedit');
	}
	//����վ������תΪ��վ
	foreach(array('catalogs','cnconfigs','cnodes','archives','freeinfos','gmissions','gmodels','gurls') as $dbtable){
		$db->query("UPDATE {$tblprefix}$dbtable SET sid='0' WHERE sid='$nsid'");
	}
	//����վ���Ͽ��е�����תΪ��վ����
	$subsite = $subsites[$nsid];
	if(!empty($subsite['channels'])){
		foreach($subsite['channels'] as $k => $v){
			$sqlstr = '';
			foreach($v as $key => $val) $sqlstr .= ($sqlstr ? ',' : '')."$key='".addslashes($val)."'";
			$db->query("UPDATE {$tblprefix}channels SET $sqlstr WHERE chid='$k'",'SILENT');
		}
	}
	if(!empty($subsite['commus'])){
		foreach($subsite['commus'] as $k => $v){
			$sqlstr = '';
			foreach($v as $key => $val) $sqlstr .= ($sqlstr ? ',' : '')."$key='".addslashes($val)."'";
			$db->query("UPDATE {$tblprefix}commus SET $sqlstr WHERE cuid='$k'",'SILENT');
		}
	}
	$sqlstr = '';
	foreach(array('cmslogo','cmstitle','cmskeyword','cmsdescription','hometpl','templatedir') as $var){
		isset($subsite[$var]) && $db->query("UPDATE {$tblprefix}mconfigs SET value='".addslashes($subsite[$var])."' WHERE varname='$var'");
	}
	$templatedir = $subsite['templatedir'];

	//ģ���е��������ת����sid����ת��
	load_cache('utags,ctags,ptags,rtags,mtpls,sptpls',$nsid);
	foreach(array('utags','ctags','ptags','rtags','mtpls','sptpls',) as $var){
		cache2file($$var,$var,$var,0);
	}
	foreach($utags as $k => $v){
		$ocache = read_cache('utag',$k,'',$nsid);
		cache2file($ocache,cache_name('utag',$k),'utag',0);
	}
	foreach($ctags as $k => $v){
		$ocache = read_cache('ctag',$k,'',$nsid);
		cache2file($ocache,cache_name('ctag',$k),'ctag',0);
	}
	foreach($ptags as $k => $v){
		$ocache = read_cache('ptag',$k,'',$nsid);
		cache2file($ocache,cache_name('ptag',$k),'ptag',0);
	}
	foreach($rtags as $k => $v){
		$ocache = read_cache('rtag',$k,'',$nsid);
		cache2file($ocache,cache_name('rtag',$k),'rtag',0);
	}

	clear_dir(M_ROOT.$subsite['dirname'],true);//�����վĿ¼
	clear_dir(M_ROOT."dynamic/cache/$nsid/",true);//�����վ����
	@unlink(M_ROOT.$homedefault);//������ܲ����ľ�̬��ҳ

	$db->query("DELETE FROM {$tblprefix}subsites WHERE sid='$nsid'",'SILENT');
	rebuild_cache(-1);
	adminlog(lang('subsittranstmsite'));
	amessage('subtramsifin', '?entry=subsites&action=subsitesedit');
}elseif($action == 'subsitedel' && $nsid){
	if(empty($confirm)){
		$message = lang('delsubsite').'<br><br>'.lang('del_alert')."<br><br>";
		$message .= lang('confirmclick')."[<a href=?entry=subsites&action=subsitedel&nsid=".$nsid."&confirm=1>".lang('delete')."</a>]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		$message .= lang('giveupclick')."[<a href=?entry=subsites&action=subsitesedit>".lang('goback')."</a>]";
		amessage($message);
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}archives WHERE sid='$nsid'")){
		amessage('subwitarccandel', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}catalogs WHERE sid='$nsid'")){
		amessage('subwitcatcandel', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}cnodes WHERE sid='$nsid'")){
		amessage('subwitcatcnocandel', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}cnconfigs WHERE sid='$nsid'")){
		amessage('subswitcnoconcandel', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}freeinfos WHERE sid='$nsid'")){
		amessage('subitisopagdel', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}gmissions WHERE sid='$nsid'")){
		amessage('subwitgatmisdel', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}gmodels WHERE sid='$nsid'")){
		amessage('subwitgathadel', '?entry=subsites&action=subsitesedit');
	}
	if($db->result_one("SELECT COUNT(*) FROM {$tblprefix}gurls WHERE sid='$nsid'")){
		amessage('subitgatrecdel', '?entry=subsites&action=subsitesedit');
	}

	clear_dir(M_ROOT.'template/'.$subsites[$nsid]['templatedir'],true);
	clear_dir(M_ROOT.$subsites[$nsid]['dirname'],true);
	clear_dir(M_ROOT."dynamic/cache/$nsid/",true);

	$db->query("DELETE FROM {$tblprefix}subsites WHERE sid='$nsid'",'SILENT');
	updatecache('subsites');
	amessage('subdelfin',"?entry=subsites&action=subsitesedit");
}
?>
