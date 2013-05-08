<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
load_cache('channels,fchannels,mchannels,matypes');
aheader();
$bclasses = array(
	'common' => lang('common message'),
	'archive' => lang('archive related'),
	'cnode' => lang('catas related'),
	'freeinfo' => lang('freeinfo related'),
	'commu' => lang('commu message'),
	'member' => lang('member related'),
	'mcommu' => lang('membercommu'),
	'marchive' => lang('marchive'),
	'other' => lang('other'),
	);
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
if(empty($bclass)){
	tabheader("系统内置原始标识管理");
	foreach($bclasses as $k => $v){
		trbasic($v,'',">><a href=\"?entry=btagnames&bclass=$k\">管理</a>",'');
	}
	tabfooter();
}else{
	empty($bclasses[$bclass]) && amessage('请指定标识类别');
	$sclasses = array();
	if($bclass == 'archive'){
		foreach($channels as $chid => $channel){
			$sclasses[$chid] = $channel['cname'];
		}
	}elseif($bclass == 'cnode'){
		$sclasses = array(
			'catalog' => lang('catalog'),
			'coclass' => lang('coclass'),
		);
	}elseif($bclass == 'freeinfo'){
		foreach($fchannels as $chid => $channel){
			$sclasses[$chid] = $channel['cname'];
		}
	}elseif($bclass == 'member'){
		foreach($mchannels as $chid => $channel){
			$sclasses[$chid] = $channel['cname'];
		}
	}elseif($bclass == 'commu'){
		$sclasses = array(
			'comment' => lang('comment'),
			'purchase' => lang('purchase'),
			'answer' => lang('answer'),
			'reply' => lang('reply'),
			'offer' => lang('offer'),
		);
	}elseif($bclass == 'mcommu'){
		$sclasses = array(
			'comment' => lang('comment'),
			'reply' => lang('reply'),
			'flink' => lang('flink'),
		);
	}elseif($bclass == 'other'){
		$sclasses = array(
			'mp' => lang('pt'),
			'attachment' => lang('attachment'),
			'vote' => lang('vote'),
		);
	}
	
	if(!submitcheck('bbtagnamesedit') && !submitcheck('bbtagnamesadd')){
		tabheader("添加$bclasses[$bclass]标识名称",'btagnamesadd',"?entry=btagnames&bclass=$bclass");
		trbasic(lang('tag cname'),'btagnameadd[cname]');
		trbasic('英文名称','btagnameadd[ename]');
		trbasic('字段类型','btagnameadd[datatype]',makeoption($datatypearr),'select');
		in_array($bclass,array('commu','mcommu','other')) && trbasic('标识类别','btagnameadd[sclass]',makeoption($sclasses),'select');
		tabfooter('bbtagnamesadd',lang('add'));
	
		tabheader("$bclasses[$bclass]标识",'btagnamesedit',"?entry=btagnames&bclass=$bclass",'6');
		trcategory(array('<input class="checkbox" type="checkbox" name="chkall" onclick="checkall(this.form)">'.lang('del'),lang('tag cname'),'英文名称',lang('type'),'字段类型',lang('order')));
		$query = $db->query("SELECT * FROM {$tblprefix}btagnames WHERE bclass='$bclass' ORDER BY sclass,vieworder,bnid");
		while($btagname = $db->fetch_array($query)){
			$sclassstr = in_array($bclass,array('commu','mcommu','other')) ? "<select style=\"vertical-align: middle;\" name=\"btagnamesnew[$btagname[bnid]][sclass]\">".makeoption($sclasses,$btagname['sclass'])."</select>" : "-";
			$datatypestr = "<select style=\"vertical-align: middle;\" name=\"btagnamesnew[$btagname[bnid]][datatype]\">".makeoption($datatypearr,$btagname['datatype'])."</select>";
			echo "<tr align=\"center\">".
				"<td class=\"item1\" width=\"50\"><input class=\"checkbox\" type=\"checkbox\" name=\"delete[$btagname[bnid]]\" value=\"$btagname[bnid]\"></td>\n".
				"<td class=\"item2\"><input type=\"text\" size=\"30\" maxlength=\"30\" name=\"btagnamesnew[$btagname[bnid]][cname]\" value=\"$btagname[cname]\"></td>\n".
				"<td class=\"item1\"><input type=\"text\" size=\"30\" maxlength=\"30\" name=\"btagnamesnew[$btagname[bnid]][ename]\" value=\"$btagname[ename]\"></td>\n".
				"<td class=\"item2\" width=\"100\">$sclassstr</td>\n".
				"<td class=\"item1\" width=\"100\">$datatypestr</td>\n".
				"<td class=\"item2\" width=\"100\"><input type=\"text\" size=\"5\" maxlength=\"5\" name=\"btagnamesnew[$btagname[bnid]][vieworder]\" value=\"$btagname[vieworder]\"></td>\n".
				"</tr>\n";
		}
		tabfooter('bbtagnamesedit',lang('modify'));
	}
	elseif(submitcheck('bbtagnamesadd')){
		if(!$btagnameadd['cname'] || !$btagnameadd['ename']) {
			amessage(lang('data missing'),"?entry=btagnames&bclass=$bclass");
		}
		if(preg_match("/[^a-z_A-Z0-9]+/",$btagnameadd['ename'])){
			amessage('请输入合法的标识id!',"?entry=btagnames&bclass=$bclass");
		}
		$btagnameadd['sclass'] = empty($btagnameadd['sclass']) ? '' : $btagnameadd['sclass'];
		$db->query("INSERT INTO {$tblprefix}btagnames SET 
					cname='$btagnameadd[cname]',
					ename='$btagnameadd[ename]',
					datatype='$btagnameadd[datatype]',
					bclass='$bclass',
					sclass='$btagnameadd[sclass]'
					");
		updatethiscache();
		amessage('标识添加成功!',"?entry=btagnames&bclass=$bclass");
	
	}
	elseif(submitcheck('bbtagnamesedit')){
		if(isset($delete)){
			foreach($delete as $bnid){
				$db->query("DELETE FROM {$tblprefix}btagnames WHERE bnid=$bnid");
				unset($btagnamesnew[$bnid]);
			}
		}
		foreach($btagnamesnew as $bnid => $btagnamenew){
			$btagnamenew['sclass'] = empty($btagnamenew['sclass']) ? '' : $btagnamenew['sclass'];
			$db->query("UPDATE {$tblprefix}btagnames SET 
						cname='$btagnamenew[cname]',
						ename='$btagnamenew[ename]',
						datatype='$btagnamenew[datatype]',
						vieworder='$btagnamenew[vieworder]',
						sclass='$btagnamenew[sclass]'
						WHERE bnid='$bnid'");
		}
		updatethiscache();
		amessage('标识修改成功!',"?entry=btagnames&bclass=$bclass");
	}

}
function updatethiscache(){
	global $db,$tblprefix;
	$items = array();
	$query = $db->query("SELECT * FROM {$tblprefix}btagnames ORDER BY bclass,sclass,vieworder,bnid");
	while($item = $db->fetch_array($query)){
		$items[$item['bnid']] = array('ename' => $item['ename'],'cname' => $item['cname'],'bclass' => $item['bclass'],'sclass' => $item['sclass'],'datatype' => $item['datatype'],);
	}
	$cacstr = var_export($items,TRUE);
	if(@$fp = fopen(M_ROOT.'./include/syscache/btagnames.cac.php','wb')){
		fwrite($fp,"<?php\n\$btagnames = $cacstr ;\n?>");
		fclose($fp);
	}
}
?>
