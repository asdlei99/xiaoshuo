<?php _mpinfo(array("ename" => "header_banner","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "4","orderby" => "vieworder_asc","length" => "10",));?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?=$mcharset?>">
<meta name="keywords" content="<?=$cmskeyword?>-<?php $v=_ctag_parse(array("ename" => "list_tit","tclass" => "cnmod",));if(!empty($v)){_aenter($v);?>
<?=$v['title']?><?php _aquit();} unset($v);?>
" />
<meta name="Description" content="<?=$cmsdescription?>-<?php $v=_ctag_parse(array("ename" => "list_tit","tclass" => "cnmod",));if(!empty($v)){_aenter($v);?>
<?=$v['title']?><?php _aquit();} unset($v);?>
" />
<TITLE><?=$cmstitle?> - <?=$cmsname?> - <?=$hostname?>-<?php $v=_ctag_parse(array("ename" => "list_tit","tclass" => "cnmod",));if(!empty($v)){_aenter($v);?>
<?=$v['title']?><?php _aquit();} unset($v);?>
</TITLE>
<link rel="stylesheet" type="text/css" href="<?=$tplurl?>css/common.css" />
<link rel="stylesheet" type="text/css" href="<?=$tplurl?>css/style.css" />
<link rel="stylesheet" type="text/css" href="<?=$tplurl?>css/17_header.css" />
<link rel="stylesheet" type="text/css" href="<?=$tplurl?>css/index.css" />
<script type="text/javascript">var cmsUrl = "<?=$cms_abs?>";</script>
<script src="<?=$tplurl?>js/common.js" type="text/javascript" language="javascript"></script>
<script src="<?=$tplurl?>js/ajax.js" type="text/javascript" language="javascript"></script>
<script src="<?=$tplurl?>js/commu.js" type="text/javascript" language="javascript"></script>
<script src="<?=$tplurl?>js/jquery-1.7.1.min.js" type="text/javascript" language="javascript"></script>
<style type="text/css">
.search .but {float: left;margin: 5px 0 0 0;border: 0;width: 51px;height: 24px;line-height: 24px;font-size: 14px;color: #fff;background-position: 0 -19px;cursor: pointer;}
.headBanner {
	float : left;
}
</style>
</head>
<body>
<!-- ���� begin -->
<div id="top" style="margin-top:0px;">
<div class="left orangea"><script language="javascript"  src="<?=$cms_abs?>login.php?mode=js&sid=<?=$sid?>"></script></div>
<div class="right">��<a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('<?=$cms_abs?>');" style="cursor:hand">��Ϊ��ҳ</a>����<a href="#" onClick="javascript:window.external.AddFavorite('<?=$cms_abs?>','<?=$cmsname?>');">�ղر�վ</a>��</div>
</div>
<!-- ���� begin -->
<div id="head">
<div class="left"><a href="<?=$cms_abs?>" ><img src="<?=$cms_abs?><?=$cmslogo?>" /></a></div>
<div class="right" style="width:730px;">
<div class="r2" style="padding-right:5px;float:left;margin:5px 0;">
	<div class="headBanner">
		<?php $_header_banner=_ptag_parse(array("ename" => "header_banner","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "4","orderby" => "vieworder_asc","length" => "10",));foreach($_header_banner as $v){_aenter($v);?>
	    <a target="_blank" href="<?=$v['advurl']?>"><img src="<?=$v['advimg']?>" title="<?=$v['subject']?>" width="515px" height="66px" /></a><?php _aquit();} unset($_header_banner,$v);?>

	</div>
	<div class="repeat_bg1 headNews" style="float:right; margin-left:10px;"> 
        <ul> 
         	<?php $_header_textad3=_ptag_parse(array("ename" => "header_textad3","tclass" => "farchives","disabled" => "0","limits" => "3","casource" => "38","orderby" => "vieworder_asc","validperiod" => "1","length" => "10",));foreach($_header_textad3 as $v){_aenter($v);?>
	                    <li><a href="<?=$v['advurl']?>" <? if($v['sn_row']==1 || $v['sn_row']==3) { ?>style="color:#FF0000"<? } ?> target="_blank" title="<?=$v['alttext']?>"><?=$v['subject']?></a></li> <?php _aquit();} unset($_header_textad3,$v);?>
                                  
        </ul> 
    </div>
</div>
</div>
</div>
<!-- ���� begin -->
<script type="text/javascript">
function showmenu(id){
	for(var i=1; i<=6; i++){
		$('menu_'+i).style.display='none';
	}
	$('menu_'+id).style.display='block';
}
function request(paras){ 
	var url = location.href;  
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
	var paraObj = {}  
	for (i=0; j=paraString[i]; i++){  
		paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
	}  
	var returnValue = paraObj[paras.toLowerCase()];  
	if(typeof(returnValue)=="undefined"){  
		return "";  
	}else{  
		return returnValue; 
	}
}
$(function(){
	var caid = request("caid");
	var ccid7 = request("ccid7");
	var ccid3 = request("ccid3");
	var ind;
	if(caid==1 || caid==2 || caid==4 || caid==5 || caid==6 || caid==7 || caid==17){
		ind=0;
	}
	if(caid==14 || caid==3 || caid==15 || caid==16 || caid==18 || caid==19  || caid==20) {
		ind=1;
	}
	if(caid==23) ind = 3;

	if (caid == 22) ind = 0;
	if (ccid7 == 38) ind = 0;
	
	if (ind == undefined) ind = 0;
	
	$('.tagdhnew_01 ul li').eq(ind).addClass('selected').siblings().removeClass('selected');
	$('.tagdhnew_02 .center > div').eq(ind).show().siblings().hide();
	if(ind==3 || ind==5 || ind==4) $('.tagdhnew_02').css({'height':'0','overflow':'hidden'});
	if (ind==0) {
		$('.tagdhnew_02').addClass('tagdhnew_03');
		$('.tagdhnew_01').addClass('tagdhnew_04');
		$('.tagdhnew_02').removeClass('tagdhnew_02');
		$('.tagdhnew_01').removeClass('tagdhnew_01');
	}
});
</script>
<!--  -->
<div id="menu">
	<div class="tagdhnew_01">
		<div class="left">
			<ul>
				<li ><a title="��Ƶ" href="<?php $v=_ctag_parse(array("ename" => "xs_menunode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">��Ƶ</a></li>
				<li ><a title="ŮƵ" href="<?php $v=_ctag_parse(array("ename" => "xs_nvpinnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "14",));if(!empty($v)){_aenter($v);?>
		<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">ŮƵ</a></li>
				<li><a href="<?=$cms_abs?>adminm.php" target="_blank" title="��Ա����">��Ա����</a></li>
				<li ><a title="���߸���" href="/archive.php?aid=174&caid=23">���߸���</a></li>
				<li ><a title="��Ϊ����" href="/adminm.php?action=utrans" target="_blank">��Ϊ����</a></li>
				<!-- 
				<li ><a title="����ѵ��Ӫ" href="#">����ѵ��Ӫ</a></li>
				<li ><a title="����ר��" href="#">����ר��</a></li>
				<li ><a title="�ܱ���־" href="#">�ܱ���־</a></li>
				<li ><a title="������̳" href="#">������̳</a></li>
				 -->
				<li ><a title="��ֵ" target="_blank" href="/adminm.php?action=payonline">��ֵ</a></li>
			</ul>
		</div>
	</div>
	<div class="tagdhnew_02">
		<div class="center">
			<div id="menu_1"><a href="/index.php?caid=22" title="���">���</a><a title="���а�" href="<?php $v=_ctag_parse(array("ename" => "pai_index","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "1","cosource7" => "38","urlmode" => "caid",));if(!empty($v)){_aenter($v);?>
	            <?=$v['indexurl']?><?php _aquit();} unset($v);?>
">���а�</a><?php $v=_ctag_parse(array("ename" => "outxsnode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?php $_xs_sen_list=_ctag_parse(array("ename" => "xs_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","urlmode" => "caid",));foreach($_xs_sen_list as $v){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_xs_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
			<div id="menu_6"><?php $v=_ctag_parse(array("ename" => "outnpxsnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "14",));if(!empty($v)){_aenter($v);?>
<?php $_xs_sen_list=_ctag_parse(array("ename" => "xs_sen_list","tclass" => "catalogs","disabled" => "0","limits" => "100","listby" => "ca","casource" => "2","urlmode" => "caid",));foreach($_xs_sen_list as $v){_aenter($v);?>
<a href="<?=$v['indexurl']?>"><?=$v['title']?></a><?php _aquit();} unset($_xs_sen_list,$v);?>
<?php _aquit();} unset($v);?>
</div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

<div class="repeat_bg searchBox"> 
    <div class="searchBox_inner"> 
      <ul stat_flag="st_t-gg:ͷ������" class="ico1 listTeseXs"> 
        <?php $_header_notice=_ptag_parse(array("ename" => "header_notice","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "3","orderby" => "createdate_desc","validperiod" => "1","length" => "10",));foreach($_header_notice as $v){_aenter($v);?>
<li><a style="color:#F00" href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a></li> <?php _aquit();} unset($_header_notice,$v);?>

      </ul> 
      
      <p stat_flag="st_ss-ci:�����ȴ�" class="ico1 search_rc" style="width:auto;">�����ȴʣ�<b><a target="_blank" href="<?=$cmsurl?>search.php?sid=<?=$sid?>&searchword=�������&searchsubmit=1&x=40&y=12" style="color:#FF0000;">�������</a></b><b><a target="_blank" href="<?=$cmsurl?>search.php?sid=<?=$sid?>&searchword=���ֽ�ʦ&searchsubmit=1&x=40&y=12">���ֽ�ʦ</a></b><b><a target="_blank" href="<?=$cmsurl?>search.php?sid=<?=$sid?>&searchword=����Ů��&searchsubmit=1&x=40&y=12">����Ů��</a></b></p> 
      <div class="search"> 
        <form name="form" id="searchform" action="<?=$cmsurl?>search.php?sid=<?=$sid?>" method="get" target="_blank">                                                     
                <span>
                <input style="width:162px;" id="queryString" name="searchword" title="����ͼ��" autocomplete="off" x-webkit-speech="" x-webkit-grammar="builtin:translate">                            
                </span>                            
                <input type="submit" value="����" class="but">                            
            </form>
      </div> 
    </div> 
</div>
<div class="h3">
<span class="reda">��ǰλ��&gt;&gt;</span>  <a href="<?=$cms_abs?>">��ҳ</a>&nbsp;>&nbsp;VIPר��</div>
</div>
</div>

<div id="main">
<div id="left">
<div class="divbox">
<div class="left">
<style type="text/css">
#menu #menu_1{display:none;}
#menu #menu_2{display:block;}
</style>
<script type="text/javascript" src="<?=$tplurl?>js/picBox.js" ></script>
<div id="flash_show">
<div class="flash_pic"><table cellpadding="0" cellspacing="0" border="0">
<tr><td align="center" valign="middle" id="flash_img" width="200" height="259"></td></tr></table></div>
<div class="flash_set"><ul id="flash_btn"><?php $_vip_lunhuan=_ctag_parse(array("ename" => "vip_lunhuan","tclass" => "archives","limits" => "4","cols" => "1","ccidson2" => "1","cosource2" => "1","ccids2" => "27","closed" => "-1","abover" => "-1",));foreach($_vip_lunhuan as $v){_aenter($v);?>
<li><a onMouseOver="javascript:showImage(<?=$v['sn_row']?>-1);return false;" title="<?=$v['subject']?>" href="<?=$v['arcurl']?>" target="_blank"><img title="<?php echo _utag_parse(array("ename" => "hotindex_abs_110","tclass" => "odeal","disabled" => "0","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "110","wordlink" => "1",));?>
" <?php $u=_utag_parse(array("ename" => "thumb_198_257","tclass" => "image","disabled" => "0","tname" => "$v[thumb]","maxwidth" => "198","maxheight" => "257","thumb" => "1","emptyurl" => "template/default/images/index_jspic.gif",));if(!empty($u)){?>src="<?=$u['url']?>" alt="<?=$u['width']?>*<?=$u['height']?>"<?php } unset($u);?></a></li><?php _aquit();} unset($_vip_lunhuan,$v);?>
</ul>
<div class="navli"><a id=img_prev_btn onClick="showPrevImage();return false;" href="javascript:void();" target=_self><img height=12 alt=��һҳ src="<?=$tplurl?>images/flash_back.gif" width=11 border=0></a> <a id=img_next_btn onClick="showNextImage();return false;" href="javascript:void();" target=_self><img height=12 alt=��һҳ src="<?=$tplurl?>images/flash_next.gif" width=11 border=0></a></div>
</div>
<div id="flash_show_ctl_msg" align="center">
<h3><a id="flash_title" href="javascript:void();"></a></h3>
<p id="flash_abs"></p></div>
<script type="text/javascript">
var fImgs=$("flash_btn").getElementsByTagName("a");
var fImgsrc=$("flash_btn").getElementsByTagName("img");
imagePlay();
function change_bg(d){
	d.style.background = "url('<?=$tplurl?>images/indexbg.png')";
	d.onmouseout = function(){d.style.background = "";}
}
</script>
</div>
</div>
<div class="right">
<div class="search" id="searchbox"><table cellpadding="0">
<tr>
<form id="searchform" action="<?=$cmsurl?>search.php?sid=<?=$sid?>" method="get" target="_blank">
<td width="5%" valign="middle"><img src="<?=$tplurl?>images/ico_search.gif" /></td>
<td width="14%" valign="middle"><b>վ������</b></td>
<td width="66%" id="seach_y"><input name="searchword" value="�Ƽ�����С˵" type="text" style="width:260px" maxlength="18" onclick="this.value=''" /></td>
<td width="15%"><input type="hidden" name="searchsubmit" value="1"><input src="<?=$tplurl?>images/b_s.gif"  type="image" width="52" height="21" id="Image12" /></td>
</form>
</tr>
</table></div>
<div class="k_xx">
<a href="" target="_blank">�ݽ�����</a> 
<a href="" target="_blank">���ܲ�</a> 
<a href="" target="_blank">�¹�MM���Ƴ�</a> 
<a href="" target="_blank">��������</a> 
<a href="" target="_blank">��֬�ң�����</a> 
<a href="" target="_blank">����·</a> 
</div>
<div class="k_xxbg"></div>
<div id="txtbox" class="k1">
<h1><?php $_vip_toutiao=_ctag_parse(array("ename" => "vip_toutiao","tclass" => "archives","limits" => "10","cols" => "1","ccidson1" => "1","cosource1" => "1","ccids1" => "29","closed" => "-1","abover" => "-1",));foreach($_vip_toutiao as $v){_aenter($v);?>
<a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>"  target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a><?php _aquit();} unset($_vip_toutiao,$v);?>
</h1>
<h2><?php $_vip_zhuanqu=_ctag_parse(array("ename" => "vip_zhuanqu","tclass" => "archives","limits" => "4","cols" => "1","ccidson1" => "1","cosource1" => "1","ccids1" => "35","closed" => "-1","abover" => "-1",));foreach($_vip_zhuanqu as $v){_aenter($v);?>
<a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>"  target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a><?php _aquit();} unset($_vip_zhuanqu,$v);?>
</h2>
<?php $_vip_tuwen=_ctag_parse(array("ename" => "vip_tuwen","tclass" => "archives","disabled" => "0","limits" => "2","ccidson1" => "1","cosource1" => "1","ccids1" => "33","closed" => "-1","abover" => "-1",));foreach($_vip_tuwen as $v){_aenter($v);?>
<div id="txtpic" onmouseover="change_bg(this)">
<div class="txtpic_r"><b><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></b><br>    ����
<?php echo _utag_parse(array("ename" => "hotindex_abs_180","tclass" => "odeal","disabled" => "0","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "180","wordlink" => "1","nl2br" => "1",));?>
  <a href="<?=$v['arcurl']?>"  target="_blank">�Ķ�&gt;&gt;</a>
</div>
<div class="txtpic_l pic_on"><a href="<?=$v['arcurl']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "thumb_66_87","tclass" => "image","tname" => "$v[thumb]","maxwidth" => "66","maxheight" => "87","thumb" => "1","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url_s']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$u['subject']?>"><?php } unset($u);?></a></div>
</div><?php _aquit();} unset($_vip_tuwen,$v);?>

</div>
</div></div>


<div id="lm3"><dl>
<dt><img src="<?=$tplurl?>images/ico_hsg.gif"  align="absmiddle" /><b>����<img src="<?=$tplurl?>images/vip.gif"  align="absmiddle" />С˵�Ƽ�</b></dt>
<dd>
<table cellpadding="0" cellspacing="10"><tr><td width="262"><?php $_vipindex_pictxt=_ctag_parse(array("ename" => "vipindex_pictxt","tclass" => "archives","limits" => "1","cols" => "1","caids" => "","ccidson1" => "1","cosource1" => "1","ccids1" => "35","ccids2" => "","ccids3" => "","ccids4" => "","ccids5" => "","chids" => "","closed" => "-1","abover" => "-1","wherestr" => "a.thumb != \'\'",));foreach($_vipindex_pictxt as $v){_aenter($v);?>
<div id="txtpic_fm">
<div class="txtpic_fm_l pic_on"><a href="<?=$v['arcurl']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "thumb_105_137","tclass" => "image","tname" => "$v[thumb]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url_s']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>"><?php } unset($u);?></a></div>
<div class="txtpic_fm_r">
<div class="font14" style="padding:5px 0"><a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></div>
<span class="orange_u"><?php echo _utag_parse(array("ename" => "hotindex_abs_120","tclass" => "odeal","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "120","wordlink" => "1",));?>
  <A href="<?=$v['arcurl']?>"  target=_blank>����Ķ�</A></span></div>
</div><?php _aquit();} unset($_vipindex_pictxt,$v);?>
</td>
<td valign="top">
<div class="newtxt"><ul><?php $_vipindex_title=_ctag_parse(array("ename" => "vipindex_title","tclass" => "archives","limits" => "24","cols" => "1","ccidson1" => "1","cosource1" => "1","ccids1" => "35","closed" => "-1","abover" => "-1",));foreach($_vipindex_title as $v){_aenter($v);?>
<li><a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></li><?php _aquit();} unset($_vipindex_title,$v);?>
</ul></div>
</td></tr></table></dd></dl></div>

<div id="divboxd">
<div id="lm4"><dl>
<dt><img src="<?=$tplurl?>images/ico_gx.gif"  align="absmiddle" /><b>����<img src="<?=$tplurl?>images/vip.gif"  align="absmiddle" />С˵�����б�</b></dt>
<dd><div id="txttd4"><div class="txttb4 txtbg1"><ul><?php $_index_vip_newlist=_ctag_parse(array("ename" => "index_vip_newlist","tclass" => "archives","disabled" => "0","limits" => "300","ccidson3" => "1","cosource3" => "1","ccids3" => "39","nochids" => "4","closed" => "-1","abover" => "-1",));foreach($_index_vip_newlist as $v){_aenter($v);?>
<li><span class="urs3 cGray"><?php echo _utag_parse(array("ename" => "gx_min","tclass" => "date","tname" => "$v[createdate]","date" => "m-d","time" => "H:i",));?>
</span><span class="urs4 cGray">[<?=$v['catalog']?>]</span> <span class="urs5"><?php $a=_ctag_parse(array("ename" => "arc_nav_xx","tclass" => "archive","disabled" => "0","album" => "4",));if(!empty($a)){_aenter($a);?>
<a href="<?=$a['arcurl']?>" title="<?=$a['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$a[subject]","trim" => "30",));?>
</a><?php _aquit();} unset($a);?>
</span><a href="<?=$v['arcurl']?>" target="_blank"><span class="cGray"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</span></a> <? if(($v['ccid3'])) { ?><font style="color:red;">[VIP]</font><? } ?><em class="vip_ico vip_<?=$v['viptype_id']?>">vip</em></li><?php _aquit();} unset($_index_vip_newlist,$v);?>
</ul></div></div></dd>
</dl></div>
</div>

</div>

<div id="right">


<div id="lm2"><dl><dt><img src="<?=$tplurl?>images/ico_bq.gif"  align="absmiddle" />���ű�ǩ</dt>
<dd><div class="li_title"><?php $js_file=$cms_abs.'js.php?tname=keywords';foreach($_midarr as $k => $v){ $js_file.= '&data['.$k.']='.rawurlencode($v);} ?><script type="text/javascript" src="<?=$js_file?>"></script><?php unset($js_file);?></div></dd></dl></div>
<div id="lm2"><dl>
<dt><img src="<?=$tplurl?>images/tuijian2ico.gif"  align="absmiddle" />�Ƽ�ר��</dt>
<dd><?php $_index_readmin=_ctag_parse(array("ename" => "index_readmin","tclass" => "archives","disabled" => "0","limits" => "2","caidson" => "1","casource" => "1","caids" => "1,2,4,5,6,7,17,14,3,15,16,18,19,20","ccids1" => "30","chsource" => "2","chids" => "4","orderby" => "favorites_desc","closed" => "-1","abover" => "-1",));foreach($_index_readmin as $v){_aenter($v);?>
	    <div id="txtpic">
<div class="retxtpic_r"><b><a <? if(($v['ccid3'])) { ?>style="color:red;"<? } ?> href="<?=$v['arcurl']?>" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></b><br>���ߣ�<?=$v['author']?><br>����ʱ�䣺<?php echo _utag_parse(array("ename" => "createdate_nj","tclass" => "date","tname" => "$v[createdate]","date" => "m-d",));?>
<br /><a href="<?=$v['arcurl']?>"  target="_blank">[ȫ���Ķ�]</a>
</div>
<div class="retxtpic_l pic_on"><a href="<?=$v['arcurl']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "thumb_66_87","tclass" => "image","tname" => "$v[thumb]","maxwidth" => "66","maxheight" => "87","thumb" => "1","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url_s']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$u['subject']?>"><?php } unset($u);?></a></div>
</div><?php _aquit();} unset($_index_readmin,$v);?>
</dd></dl></div>

<div id="lm2"><dl><dt>VIP����</dt><dd><ul><?php $_hotindex_mtitle=_ctag_parse(array("ename" => "hotindex_mtitle","tclass" => "archives","disabled" => "0","nsid" => "-1","caidson" => "1","casource" => "1","caids" => "1","cosource3" => "1","ccids3" => "6","orderby" => "clicks_desc","closed" => "-1","abover" => "-1",));foreach($_hotindex_mtitle as $v){_aenter($v);?>
<li><strong><?=$v['sn_row']?>.</strong><a href="<?=$v['arcurl']?>" target="_blank"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></li><?php _aquit();} unset($_hotindex_mtitle,$v);?>
</ul></dd></dl></div>


</div></div>
<div id="links"><b>�������ӣ�</b><?php $_txtflinklist=_ctag_parse(array("ename" => "txtflinklist","tclass" => "farchives","limits" => "10","cols" => "1","casource" => "1","orderby" => "vieworder_asc",));foreach($_txtflinklist as $v){_aenter($v);?>
<a href="<?=$v['linkurl']?>" title="<?=$v['subject']?>" target=_blank><?=$v['subject']?></a><?php _aquit();} unset($_txtflinklist,$v);?>
<br /><?php $_picflinklist=_ctag_parse(array("ename" => "picflinklist","tclass" => "farchives","limits" => "10","cols" => "1","casource" => "2","orderby" => "vieworder_asc",));foreach($_picflinklist as $v){_aenter($v);?>
<a href="<?=$v['linkurl']?>" title="<?=$v['linktxt']?>"><?php $u=_utag_parse(array("tclass" => "image","tname" => "$v[piclink]","maxwidth" => "88","maxheight" => "31","emptyurl" => "images/common/logo.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$u['subject']?>"><?php } unset($u);?></a><?php _aquit();} unset($_picflinklist,$v);?>
</div>
<div id="foot">
<span>
<?php $_all_dibu=_ctag_parse(array("ename" => "all_dibu","tclass" => "farchives","limits" => "100","cols" => "1","casource" => "11","orderby" => "vieworder_asc",));foreach($_all_dibu as $v){_aenter($v);?>
<a href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a>��|��<?php _aquit();} unset($_all_dibu,$v);?>

<a href="/adminm.php?action=archives&nmuid=2">����Ͷ��</a>
��|��
<a href="/adminm.php?action=payonline">֧������</a>
��|��
<a href="<?=$cms_abs?>register.php" >��Աע��</a>
</span>
<p id="copyright"><?=$copyright?>  Powered by <a href="<?=$hosturl?>" target="_blank"><?=$hostname?></a> v2013 &copy; 2013-2015 Inc.</a><br><?=$cms_icpno?> </p>
</div>
</body>
</html>