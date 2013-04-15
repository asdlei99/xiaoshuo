<?php
$ichid = 5;//指定图集模型
$ichannel = read_cache('channel',$ichid);
if($channel['isalbum'] && $ichannel && strpos(",$channel[inchids],", ",$ichid,") !== false){//允许把$ichid归入主档
	if(!submitcheck('barchiveadd') && !submitcheck('barchivedetail')){
		if($action == 'archivedetail' && $aid && $query = $db->query("SELECT * FROM {$tblprefix}albums b LEFT JOIN {$tblprefix}archives a ON a.aid=b.aid WHERE a.chid=$ichid AND b.pid=$aid")){//列出已有的~~
			if($db->num_rows($query)){
				echo '
		<tr><td colspan="2" style="padding:0px;border:none"><div class="conlist1">产品辑内图集修改</div></td></tr>';
				while($row = $db->fetch_array($query)){
					echo '
				<tr>
					<td width="25%" class="txt txtright borderright"><input class="checkbox" type="checkbox" name="imagesdel[]" value="' . $row['aid'] . '" id="imagesdel[' . $row['aid'] . ']" /><label for="imagesdel[' . $row['aid'] . ']">删除</label></td>
					<td class="txt txtleft">
						<a href="archive.php?aid=' . $row['aid'] . '" target="_blank">' . $row['subject'] . '</a>&nbsp;
						<a href="?entry=archive&action=archivedetail&aid=' . $row['aid'] . '" onclick="return floatwin(\'open_archive_images\',this)">修改</a>
					</td>
				</tr>';
				}
			}
		}
#		trspecial($trname,$varname,'','text');
#		trspecial($trname,$varname,'','images');
		echo '
		<tr><td colspan="2" style="padding:0px;border:none"><div class="conlist1">产品辑内图集添加&nbsp; -&nbsp; <a href="javascript:" onclick="add_album_images_table()">添加</a></div></td></tr>
		<tr>
			<td colspan="2" style="padding:0px;border:none"><table id="IN_ALBUM_IMAGES_TABLE" width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="25%" class="txt txtright fB borderright">*标题</td>
					<td class="txt txtleft">
						<input type="text" size="20" id="imagesadd[][subject]" name="imagesadd[][subject]" value="" />
					</td>
				</tr>
				<tr>
					<td width="25%" class="txt txtright fB borderright">*产品图片</td>
					<td class="txt txtleft">
						<textarea id="imagesadd[][images]" name="imagesadd[][images]" wrap="off" style="width:450px;height:200px;"></textarea>&nbsp;
						<input type="button" class="uploadbtn" style="vertical-align: top;" id="imagesadd[][images]select" value="附件编辑" onclick="uploadwin(\'images\',\'imagesadd[][images]\',\'\',\'\',0);" />
					</td>
				</tr>
			</table>
			<script type="text/javascript">
			function add_album_images_table(flag){
				var table, tbody, i;
				if(!add_album_images_table._$_data_$_){
					table = $id("IN_ALBUM_IMAGES_TABLE");
					if(!table.tBodies)return flag ? "" : alert("您的浏览器太旧了，要使用本功能请用更新的浏览器！");
					add_album_images_table._$_data_$_ = tbody = table.tBodies[0];
					tbody.pNode = table;
					table.removeChild(tbody);
				}else{
					tbody = add_album_images_table._$_data_$_;
					table = tbody.pNode;
				}
				tbody = tbody.cloneNode(true);
				tds = tbody.getElementsByTagName("TD");
				for(i = 0; i < tds.length; i++)
					tds[i].innerHTML = tds[i].innerHTML.replace(/\[\]/g, "[" + table.tBodies.length + "]");
				table.appendChild(tbody);
			}
			add_album_images_table(1);
			</script>
			</td>
		</tr>';
	}elseif($aid && !empty($imagesadd) && is_array($imagesadd)){//保存新添加内容
		$iedit = new cls_arcedit;
		if(!empty($imagesdel) && is_array($imagesdel) && $query = $db->query("SELECT a.aid FROM {$tblprefix}albums b LEFT JOIN {$tblprefix}archives a ON a.aid=b.aid WHERE a.chid=$ichid AND b.pid=$aid AND b.aid " . multi_str($imagesdel))){
			while($row = $db->fetch_array($query)){
				$iedit->set_aid($row['aid']);
				$iedit->arc_delete();
			}
		}
		$icaid = empty($archiveadd['caid']) ? $archivenew['caid'] : $archiveadd['caid'];
		$sqlmain = "sid='$sid',chid='$ichid',caid='$icaid',mid='$memberid',mname='{$curuser->info['mname']}',refreshdate='$timestamp',createdate='$timestamp'";
		$sqlsub = ",needstatic='$timestamp',needstatic1='$timestamp',needstatic2='$timestamp'";
		$archives = 0;
		$ifield = new cls_field;
		foreach($imagesadd as $v){
			$ifield->init();
			$ifield->field = read_cache('field',$ichid,'images');
			$ifield->deal('v');
			$v['images'] = $ifield->newvalue;
			if(empty($v['subject']) || empty($v['images']))continue;
			$db->query("INSERT INTO {$tblprefix}archives SET $sqlmain,subject='$v[subject]'");
			if($iid = $db->insert_id()){
				$db->query("INSERT INTO {$tblprefix}archives_rec SET aid='$iid'");
				$db->query("INSERT INTO {$tblprefix}archives_sub SET aid='$iid'$sqlsub");
				$db->query("INSERT INTO {$tblprefix}archives_$ichid SET aid='$iid',images='$v[images]'");
				$iedit->init();
				$iedit->set_aid($iid);
				$iedit->set_arcurl();
				$iedit->set_cpid($iid);
				$iedit->set_album($aid);
				$ichannel['autocheck'] && $iedit->arc_check(1);
				$iedit->updatedb();
				if($ichannel['autostatic']){
					include_once(M_ROOT.'include/arc_static.fun.php');
					arc_static($iid);
					unset($arc);
				}
			}
			$archives++;
		}
		$archives && $curuser->basedeal('archive', $archives);
		unset($iedit,$ifield);
	}
}
?>