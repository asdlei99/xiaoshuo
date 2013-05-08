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
<script type="text/javascript">
function AddFavorite(sURL, sTitle) {
    try {
        window.external.addFavorite(sURL, sTitle);
    } catch (e) {
        try {
            window.sidebar.addPanel(sTitle, sURL, "");
        } catch (e) {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
//设为首页 <a onclick="SetHome(this,window.location)">设为首页</a>
function SetHome(obj,vrl){
        try {
        	obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        } catch(e){
        	if(window.netscape) {
            	try {
                	netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            	} catch (e) {
                	alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
            	}
            	var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            	prefs.setCharPref('browser.startup.homepage',vrl);
            }
        }
}
</script>
<style type="text/css">
.search .but {float: left;margin: 5px 0 0 0;border: 0;width: 51px;height: 24px;line-height: 24px;font-size: 14px;color: #fff;background-position: 0 -19px;cursor: pointer;}
.headBanner {
	float : left;
}
</style>
</head>
<body>
<!-- 顶部 begin -->
<div id="top" style="margin-top:0px;">
<div class="left orangea"><script language="javascript"  src="<?=$cms_abs?>login.php?mode=js&sid=<?=$sid?>"></script></div>
<div class="right">【<a href="javascript:void(0);" onclick="SetHome(this,window.location)" style="cursor:hand">设为首页</a>】【<a href="javascript:void(0);" onClick="AddFavorite(window.location,document.title)">收藏本站</a>】</div>
</div>
<!-- 首体 begin -->
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
<!-- 首体 begin -->
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
				<li ><a title="男频" href="<?php $v=_ctag_parse(array("ename" => "xs_menunode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">男频</a></li>
				<li ><a title="女频" href="<?php $v=_ctag_parse(array("ename" => "xs_nvpinnode","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "14",));if(!empty($v)){_aenter($v);?>
		<?=$v['indexurl']?><?php _aquit();} unset($v);?>
">女频</a></li>
				<li><a href="<?=$cms_abs?>adminm.php" target="_blank" title="会员中心">会员中心</a></li>
				<li ><a title="作者福利" href="/archive.php?aid=174&caid=23">作者福利</a></li>
				<li ><a title="成为作者" href="/adminm.php?action=utrans" target="_blank">成为作者</a></li>
				<!-- 
				<li ><a title="新人训练营" href="#">新人训练营</a></li>
				<li ><a title="网编专区" href="#">网编专区</a></li>
				<li ><a title="总编日志" href="#">总编日志</a></li>
				<li ><a title="社区论坛" href="#">社区论坛</a></li>
				 -->
				<li ><a title="充值" target="_blank" href="/adminm.php?action=payonline">充值</a></li>
			</ul>
		</div>
	</div>
	<div class="tagdhnew_02">
		<div class="center">
			<div id="menu_1"><a href="/index.php?caid=22" title="书库">书库</a><a title="排行榜" href="<?php $v=_ctag_parse(array("ename" => "pai_index","tclass" => "cnode","disabled" => "0","listby" => "ca","casource" => "1","cosource7" => "38","urlmode" => "caid",));if(!empty($v)){_aenter($v);?>
	            <?=$v['indexurl']?><?php _aquit();} unset($v);?>
">排行榜</a><?php $v=_ctag_parse(array("ename" => "outxsnode","tclass" => "cnode","listby" => "ca","casource" => "1",));if(!empty($v)){_aenter($v);?>
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
    	<div style="float:left;">
    	 <ul stat_flag="st_t-gg:头部公告" class="ico1 listTeseXs" style="width: 230px;"> 
        	<?php $_header_notice=_ptag_parse(array("ename" => "header_notice","tclass" => "farchives","disabled" => "0","limits" => "1","casource" => "3","orderby" => "createdate_desc","validperiod" => "1","length" => "10",));foreach($_header_notice as $v){_aenter($v);?>
<li><a style="color:#F00" href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a></li> <?php _aquit();} unset($_header_notice,$v);?>

      	 </ul> 
   	 	</div>
     
      <div style="float:right;">
      	<p stat_flag="st_ss-ci:搜索热词" class="ico1 search_rc" style="width:auto;">搜索热词：<?php $_search_reci_list=_ctag_parse(array("ename" => "search_reci_list","tclass" => "farchives","limits" => "3","casource" => "56","orderby" => "vieworder_asc","validperiod" => "1",));foreach($_search_reci_list as $v){_aenter($v);?>
	<b><a target="_blank" href="<?=$v['rc_link']?>" <? if($v['rc_tuchu']) { ?>style="color:#FF0000;"<? } ?>><?=$v['subject']?></a></b><?php _aquit();} unset($_search_reci_list,$v);?>
</p> 
      	<div class="search" style="float:right;"> 
        	<form name="form" id="searchform" action="<?=$cmsurl?>search.php?sid=<?=$sid?>" method="get" target="_blank">                                                     
                <span>
                <input style="width:162px;" id="queryString" name="searchword" title="搜索图书" autocomplete="off" x-webkit-speech="" x-webkit-grammar="builtin:translate">                            
                </span>                            
                <input type="submit" value="搜索" class="but">                            
            </form>
      	</div> 
      </div>
      
    </div> 
</div>
<div class="h3"><span class="reda"><a>当前位置&gt;&gt;</a></span>  <a href="<?=$cms_abs?>">首页</a> <?php $_nav=_ctag_parse(array("ename" => "nav","tclass" => "nownav",));foreach($_nav as $v){_aenter($v);?>
> <a href="<?=$v['listurl']?>"><?=$v['title']?></a>&nbsp;<?php _aquit();} unset($_nav,$v);?>
  <?=$subject?></div>
</div>
</div>

<div id="main">
<div id="left">
<style type="text/css">
.book_list_li li {
	background: url("<?=$tplurl?>images/bookbg.png") no-repeat scroll -420px -62px transparent;
    height: 28px;
    line-height: 28px;
    margin-bottom: 6px;
	margin-top:40px;
	margin-right:10px;
   	text-align: center;
    width: 76px;
	float:left;
}
</style>
<div id="lm3">
<div>
<div style="margin:5px;float:left;"><img src="<?=$thumb?>" title="<?=$subject?>" width="120px" height="130px;" /></div>
<div style="text-align: left;float:left;">
	<h2 style="font-size: 18px;font-weight: bold;text-align:left;margin-top:15px;">《<?=$subject?>》评论区</h2>
	<p style="margin-top:10px;">作者：<?=$author?></p>
	<ul class="book_list_li">
		<li><a target="_blank" href="/archive.php?aid=<?=$aid?>">点击阅读</a></li>
		<li><a target="_blank" href="/archive.php?aid=<?=$aid?>&addno=1">返回目录</a></li>
		<li><a onclick="javascript:ajax_favorite('<?=$aid?>');" href="javascript:;">加入书架</a></li>
		<li><a target="_blank" href="/adminm.php?action=favorites">进入书签</a></li>
		<li><a href="#pinglun">评价作品</a></li>
	</ul>
</div>
</div>
<dl>
<div class="blank3"></div>
<dt><cite><a href="<?=$arcurl?>">&lt;&lt;返回</a>&nbsp;&nbsp;</cite><img src="<?=$cms_abs?>template/default/images/plen.png"  align="absmiddle" /><b><a href="<?=$arcurl?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$subject","trim" => "30",));?>
</a> </b> 共有<font id="cms_comments" style="color:#F00; font-weight:bold;">0</font> 次评论&nbsp;</dt>
<dd class="comlist"><?php $_comments=_ptag_parse(array("ename" => "comments","tclass" => "commus","disabled" => "0","limits" => "20","cuid" => "5","idsource" => "aid","length" => "10",));foreach($_comments as $v){_aenter($v);?>
<table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#ddd 1px solid;">
<tr><td rowspan="2" width="100" align="center" class="comor"><a href="<?=$cms_abs?>mspace/?mid=<?=$v['mid']?>" target="_blank"><?=$v['mname']?></a></td><td class="tbody"><span><?=$v['content']?></span></td></tr>
<tr><td align="right" class="tfoot"><a href="javascript:ajaxComment(<?=$v['aid']?>,<?=$v['cid']?>,1,'cms_praises_<?=$v['aid']?>_<?=$v['cid']?>');">支持(<span id="cms_praises_<?=$v['aid']?>_<?=$v['cid']?>"><?=$v['votes1']?></span>)</a>&nbsp;&nbsp;<a href="javascript:ajaxComment(<?=$v['aid']?>,<?=$v['cid']?>,2,'cms_debases_<?=$v['aid']?>_<?=$v['cid']?>');">不支持(<span id="cms_debases_<?=$v['aid']?>_<?=$v['cid']?>"><?=$v['votes2']?></span>)</a><font><?php echo _utag_parse(array("ename" => "createdate_all","tclass" => "date","tname" => "$v[createdate]","date" => "Y-m-d","time" => "H:i",));?>
</font></td></tr>
</table><?php _aquit();} unset($_comments,$v);?>
</dd></dl></div>
<div class="pagenav"><?=$mpnav?></div>
<div id="lm3">
<a name="pinglun"></a>
<dl>
<dt><cite><a href="<?=$arcurl?>">&lt;&lt;返回</a>&nbsp;&nbsp;</cite><img src="<?=$tplurl?>images/bx2.gif"  align="absmiddle" /><b>发表评论</b></dt>
<dd class="comform">
<form name="formcomment" method="post" action="<?=$cms_abs?>comment.php?aid=<?=$aid?>">
<input name="forward" type="hidden" value="<?=$cms_abs?>comments.php?aid=<?=$aid?>" />
<textarea name="communew[content]" id="communew[content]" tabindex="3" rows="6" cols="130" title="评论内容"></textarea>
<table cellpadding="0" cellspacing="0" border="0">
<tr><td width="60"></td><td width="50">验证码：</td><td width="50"><input type="text" name="regcode" size="7" maxlength="4" id="regcode" tabindex="2" value="" class="input"></td><td><img src="<?=$cms_abs?>regcode.php" alt="点击更换验证码" style="vertical-align:middle;cursor:pointer;" onClick="this.src='<?=$cms_abs?>regcode.php'" /></td><td align="center"><button type="submit" name="newcommu" value="true" class="cbtn">发表评论</button></td><td width="40%"> </td></tr></table>
</form></dd>
</dl></div>
</div>
<div id="right">
<div>
	<div class="topList borPad" style="height:80px;overflow: hidden;">
		<?php 
			$zuozheInfo = zuozhe_info($mid);
		?>
		<div style="float:left;margin:5px;"><img src="<?php echo $zuozheInfo['photo'];?>" width="60" height="70" /></div>
		<div style="float:left;">
			<p>作者：<?=$author?></p>
			<p>作者简介：<?php echo $zuozheInfo['intro'];?></p>
		</div>
	</div>
	<div class="blank10"></div>	
	<div class="topList borPad">
		<div class="tit02">
			<h2>本书粉丝荣誉榜</h2>
		</div>
		<div class="con">
			<ul class="top15 fsimg">
			<?php
				$userList = shoucang_user_list($aid);
				foreach ($userList as $u) {
			?>
					<li class="li0"><a target="_blank" href="/mspace/index.php?mid=<?php echo $u['mid'];?>"><?php echo $u['nicename'];?></a></li>
			<?php
				}
			?>
			</ul>
		</div>
	</div>
	<div class="blank10"></div>	
	<div class="topList borPad">
		<div class="tit02">
			<h2>热点作品</h2>				
		</div>
		<div class="con">
			<ul class="top15">
				<?php $_zuopin_qiangtuiliebiao=_ctag_parse(array("ename" => "zuopin_qiangtuiliebiao","tclass" => "archives","disabled" => "0","caidson" => "1","casource" => "2","caids" => "1,2,4,5,6,7,17,14,3,15,16,18,19,20","chsource" => "2","chids" => "4","orderby" => "praises_desc","closed" => "-1","abover" => "-1",));foreach($_zuopin_qiangtuiliebiao as $v){_aenter($v);?>
<li class="li<?=$v['sn_row']?>"><a href="<?=$v['arcurl']?>" target="_blank" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject20","tclass" => "odeal","disabled" => "0","tname" => "$v[subject]","trim" => "26",));?>
</a></li><?php _aquit();} unset($_zuopin_qiangtuiliebiao,$v);?>

			</ul>
		</div>
	</div>

</div>
</div></div>
<div id="links"><b>友情链接：</b><?php $_txtflinklist=_ctag_parse(array("ename" => "txtflinklist","tclass" => "farchives","limits" => "10","cols" => "1","casource" => "1","orderby" => "vieworder_asc",));foreach($_txtflinklist as $v){_aenter($v);?>
<a href="<?=$v['linkurl']?>" title="<?=$v['subject']?>" target=_blank><?=$v['subject']?></a><?php _aquit();} unset($_txtflinklist,$v);?>
<br /><?php $_picflinklist=_ctag_parse(array("ename" => "picflinklist","tclass" => "farchives","limits" => "10","cols" => "1","casource" => "2","orderby" => "vieworder_asc",));foreach($_picflinklist as $v){_aenter($v);?>
<a href="<?=$v['linkurl']?>" title="<?=$v['linktxt']?>"><?php $u=_utag_parse(array("tclass" => "image","tname" => "$v[piclink]","maxwidth" => "88","maxheight" => "31","emptyurl" => "images/common/logo.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$u['subject']?>"><?php } unset($u);?></a><?php _aquit();} unset($_picflinklist,$v);?>
</div>
<script src="<?=$tplurl?>js/commu.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">arc_view_count('<?=$aid?>')</script>
<div id="foot">
<span>
<?php $_all_dibu=_ctag_parse(array("ename" => "all_dibu","tclass" => "farchives","limits" => "100","cols" => "1","casource" => "11","orderby" => "vieworder_asc",));foreach($_all_dibu as $v){_aenter($v);?>
<a href="<?=$v['arcurl']?>" target="_blank"><?=$v['subject']?></a>　|　<?php _aquit();} unset($_all_dibu,$v);?>

<a href="/adminm.php?action=archives&nmuid=2">作者投稿</a>
　|　
<a href="/adminm.php?action=payonline">支付中心</a>
　|　
<a href="<?=$cms_abs?>register.php" >会员注册</a>
</span>
<p id="copyright"><?=$copyright?>  Powered by <a href="<?=$hosturl?>" target="_blank"><?=$hostname?></a> v2013 &copy; 2013-2015 Inc.</a><br><?=$cms_icpno?> </p>
</div>
</body>
</html>
<?=$cms_counter?>