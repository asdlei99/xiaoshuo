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
				<li ><a title="���߸���" href="#">���߸���</a></li>
				<li ><a title="��Ϊ����" href="/adminm.php?action=utrans" target="_blank">��Ϊ����</a></li>
				<li ><a title="����ѵ��Ӫ" href="#">����ѵ��Ӫ</a></li>
				<li ><a title="����ר��" href="#">����ר��</a></li>
				<li ><a title="�ܱ���־" href="#">�ܱ���־</a></li>
				<li ><a title="������̳" href="#">������̳</a></li>
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
<style type="text/css">
#menu #menu_1{display:none;}
#menu #menu_5{display:block;}
</style>
<div class="h3">
<span class="reda">��ǰλ��&gt;&gt;</span>  <a href="<?=$cms_abs?>">��ҳ</a>&nbsp;<?php $_nav=_ctag_parse(array("ename" => "nav","tclass" => "nownav",));foreach($_nav as $v){_aenter($v);?>
> <a href="<?=$v['listurl']?>"><?=$v['title']?></a>&nbsp;<?php _aquit();} unset($_nav,$v);?>
</div>
</div>
</div>

<div id="main">
<div id="left">
<div>��û����</div>
<div class="findivbox">
<div class="findivtop"><img src="<?=$tplurl?>images/ico_hsg.gif" align="absmiddle" /><b>�ƽ�ר��</b></div>
<?php $_tjzt=_ctag_parse(array("ename" => "tjzt","tclass" => "archives","disabled" => "0","limits" => "4","ccidson1" => "1","cosource1" => "1","ccids1" => "30","closed" => "-1","abover" => "-1",));foreach($_tjzt as $v){_aenter($v);?>
<div class="fincon">
    <div class="finconimg"><?php $u=_utag_parse(array("ename" => "thumb_105_137","tclass" => "image","tname" => "$v[thumb]","maxwidth" => "105","maxheight" => "137","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url_s']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$v['subject']?>"><?php } unset($u);?></div>
    <div class="ficontxt">
        <ul>
            <li class="fincotit"><a href="<?=$v['arcurl']?>" title="<?=$v['subject']?>"><?=$v['subject']?></a></li>
            <li class="fincozz"><strong>���ߣ�<?=$v['author']?></strong></li>
            <li class="fincojj"><strong>��飺</strong><?php echo _utag_parse(array("ename" => "hotindex_abs_180","tclass" => "odeal","disabled" => "0","tname" => "$v[abstract]","dealhtml" => "clearhtml","trim" => "180","wordlink" => "1","nl2br" => "1",));?>
</li>
        </ul>
    </div>
</div><?php _aquit();} unset($_tjzt,$v);?>

</div>
<div class="blank9"></div>

<div id="divboxd">
<div id="lm4"><dl>
<dt><img src="<?=$tplurl?>images/ico_gx.gif"  align="absmiddle" /><b>����ר���б�</b>&nbsp;&nbsp;<a href="<?=$listurl?>"><font style="color:#F00;">����&gt;&gt;</font></a></dt>
<dd><div id="txttd4"><div class="txttb4 txtbg1"><ul><?php $_juntilist=_ctag_parse(array("ename" => "juntilist","tclass" => "archives","disabled" => "0","limits" => "300","caidson" => "1","casource" => "1","caids" => "11","closed" => "-1","abover" => "-1",));foreach($_juntilist as $v){_aenter($v);?>
<li><span class="urs3 cGray"><?php echo _utag_parse(array("ename" => "gx_min","tclass" => "date","tname" => "$v[createdate]","date" => "m-d","time" => "H:i",));?>
</span><span class="urs5"><a href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a></span></li><?php _aquit();} unset($_juntilist,$v);?>
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