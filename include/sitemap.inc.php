<?php
!defined('M_COM') && exit('No Permission');
load_cache('catalogs,cotypes,cnodes,channels');
if($sitemap['ename'] == 'google'){
	$idsarr = array();
	$sqlstr = "WHERE checked=1 AND salecp=''";
	if(!empty($sitemap['setting']['indays'])){
		$sqlstr .= " AND createdate>".($timestamp - 86400 * $sitemap['setting']['indays']);
	}
	if(!empty($sitemap['setting']['chsource'])){
		$sqlstr .= " AND chid ".multi_str($sitemap['setting']['chids']);
	}
	if(empty($sitemap['setting']['casource'])){
		$idsarr['caid'] = array_keys($catalogs);
	}else{
		$idsarr['caid'] = $sitemap['setting']['caids'];
		$sqlstr .= " AND caid ".multi_str($sitemap['setting']['caids']);
	}
	foreach($cotypes as $coid => $cotype){
		if(empty($sitemap['setting']['cosource'.$coid])){
			if($cotype['sortable']){
				$coclasses = read_cache('coclasses',$coid);
				$idsarr['ccid'.$coid] = array_keys($coclasses);
				unset($coclasses);
			}
		}else{
			$cotype['sortable'] && $idsarr['ccid'.$coid] = $sitemap['setting']['ccids'.$coid];
			if(empty($cotype['self_reg'])){
				$sqlstr .= " AND ccid$coid ".multi_str($sitemap['setting']['ccids'.$coid]);
			}else{
				$tempstr = self_sqlstr($coid,$sitemap['setting']['ccids'.$coid],'');
				$tempstr && $sqlstr .= ' AND '.$tempstr;
				unset($tempstr);
			} 
		}
	}
	$cnodes1 = array();
	$cnode_keys = array_keys($cnodes);
	foreach($idsarr as $k =>$ids){
		if(empty($cnodes1)){
			foreach($ids as $id){
				in_array($k.'='.$id,$cnode_keys) && $cnodes1[] = $k.'='.$id;
			}
		}else{
			foreach($cnodes1 as $k1){
				foreach($ids as $id){
					in_array($k1.'&'.$k.'='.$id,$cnode_keys) && $cnodes1[] = $k1.'&'.$k.'='.$id;
				}
			}
		}
	}
	unset($cnode_keys);
	
	$datastr = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n".
				"<urlset xmlns=\"http://www.google.com/schemas/sitemap/0.84\">\n";
	$datastr .= "  <url>\n".
				"    <loc>".htmlspecialchars($cms_abs)."</loc>\n".
				"    <lastmod>".date('Y-m-d')."</lastmod>\n".
				"    <changefreq>daily</changefreq>\n".
				"    <priority>1.0</priority>\n".
				"  </url>\n";
	foreach($cnodes1 as $cnstr){
		$cnode = cnodearr($cnstr);
		view_cnurl($cnstr,$cnode);
		$datastr .= "  <url>\n".
					"    <loc>".htmlspecialchars(view_url($cnode['indexurl']))."</loc>\n".
					"    <lastmod>".date('Y-m-d')."</lastmod>\n".
					"    <changefreq>daily</changefreq>\n".
					"    <priority>0.8</priority>\n".
					"  </url>\n";
	}
	$query = $db->query("SELECT aid,sid,caid,createdate,createdate,clicks FROM {$tblprefix}archives $sqlstr ORDER BY aid DESC LIMIT 0,10000");
	while($archive = $db->fetch_array($query)){
		$priority = $archive['clicks'] > 1000 ? '0.5' : '0.3';
		$datastr .= "  <url>\n".
					"    <loc>".htmlspecialchars(view_arcurl($archive))."</loc>\n".
					"    <lastmod>".date('Y-m-d',$archive['createdate'])."</lastmod>\n".
					"    <changefreq>yearly</changefreq>\n".
					"    <priority>".($archive['clicks'] > 1000 ? '0.5' : '0.3')."</priority>\n".
					"  </url>\n";
	}
	$datastr .= "</urlset>";
}elseif($sitemap['ename'] == 'baidu'){
	include_once M_ROOT."./include/arcedit.cls.php";
	$sqlstr = "WHERE checked=1 AND salecp=''";
	if(!empty($sitemap['setting']['indays'])){
		$sqlstr .= " AND createdate>".($timestamp - 86400 * $sitemap['setting']['indays']);
	}
	if(empty($sitemap['setting']['chsource'])){
		$sqlstr .= " AND chid ".multi_str($chids);
	}else{
		$sqlstr .= " AND chid ".multi_str($sitemap['setting']['chids']);
	}
	if(!empty($sitemap['setting']['casource'])){
		$sqlstr .= " AND caid ".multi_str($sitemap['setting']['caids']);
	}
	foreach($cotypes as $coid => $cotype){
		if(!empty($sitemap['setting']['cosource'.$coid])){
			if(empty($cotype['self_reg'])){
				$sqlstr .= " AND ccid$coid ".multi_str($sitemap['setting']['ccids'.$coid]);
			}else{
				$tempstr = self_sqlstr($coid,$sitemap['setting']['ccids'.$coid],'');
				$tempstr && $sqlstr .= ' AND '.$tempstr;
				unset($tempstr);
			} 
		}
	}
	$datastr = "<?xml version=\"1.0\" encoding=\"$mcharset\"?>\n".
				"<document>\n".
				"  <webSite>".htmlspecialchars($cms_abs)."</webSite>\n".
				"  <webMaster>$adminemail</webMaster>\n".
				"  <updatePeri>".($sitemap['setting']['life'] * 60)."</updatePeri>\n";

	$query = $db->query("SELECT aid FROM {$tblprefix}archives $sqlstr ORDER BY aid DESC LIMIT 0,100");
	$aedit = new cls_arcedit;
	while($row = $db->fetch_array($query)){
		$aid = $row['aid'];
		$aedit->init();
		$aedit->set_aid($aid);
		$aedit->detail_data(0);
		$datastr .= "  <item>\n".
					"    <title>".htmlspecialchars($aedit->archive['subject'])."</title>\n".
					"    <link>".htmlspecialchars(view_arcurl($aedit->archive))."</link>\n".
					"    <text>".htmlspecialchars($aedit->archive[$aedit->channel['baidu']])."</text>\n".
					"    <image>".htmlspecialchars(view_atmurl($aedit->archive['thumb']))."</image>\n".
					"    <keywords>".htmlspecialchars($aedit->archive['keywords'])."</keywords>\n".
					"    <category>".$catalogs[$aedit->archive['caid']]['title']."</category>\n".
					"    <author>".htmlspecialchars($aedit->archive['author'])."</author>\n".
					"    <source>".htmlspecialchars($aedit->archive['source'])."</source>\n".
					"    <pubDate>".date('Y-m-d H:i:s',$aedit->archive['createdate'])."</pubDate>\n".
					"  </item>\n";
	}
	$datastr .= "</document>";
}

?>