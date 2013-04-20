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
<script type="text/javascript" src="<?=$tplurl?>js/upload.js"></script>
<script type="text/javascript" src="<?=$tplurl?>js/calendar.js"></script>
<script type="text/javascript" src="<?=$tplurl?>js/register.js"></script>
<div id="main">
<div id="left">
<style type="text/css">
.form_box{}
.form_box td{height:30px;line-height:30px;}
.error {font-size: 12px;color: #f00;}
</style>
<script type="text/javascript">
function check_form() {
	//检查表单的正确性
	var isError = false;
	if (_check_user($('#mname').val()) == false) {
		isError = true;
	}
	if (_check_pwd1($('#pwd1').val()) == false) {
		isError = true;
	}
	if (_check_pwd2($('#pwd2').val()) == false) {
		isError = true;
	}
	if (_check_email($('#email').val()) == false) {
		isError = true;
	}
	
	if (_check_authcode($('#regcode_1').val()) == false) isError = true;
	if (isError == true) return false;
	return true;
}

function _check_user(name) {
	if (_check_username(name) == false) return false;
	$.ajax({
		url: "/ajax.php?action=check_user&mname="+name,
		type: "get",
		async: false,
		dataType: 'text',
		data: {},
		success: function(res) {
			if (res !== 'succeed') {
				$('#error_username').text(res);
				$('#error_username').show();
			} else {
				$('#error_username').hide();
			}
		}		
	});
}

function _check_username (name) {
	if (name == '') {
		$('#error_username').text('请输入用户名');
		$('#error_username').show();
		return false;
	}
	$('#error_username').hide();
	return true;
}

function _check_pwd1(pwd) {
	if (pwd == '') {
		$('#error_pwd1').text('请输入密码');
		$('#error_pwd1').show();
		return false;
	}
	if (pwd.length < 6) {
		$('#error_pwd1').text('密码不能小于6位');
		$('#error_pwd1').show();
		return false;
	}
	
	$('#error_pwd1').hide();
	return true;
}
function _check_pwd2(pwd) {
	if (pwd == '') {
		$('#error_pwd2').text('请输入确认密码');
		$('#error_pwd2').show();
		return false;
	}
	if (pwd.length < 6) {
		$('#error_pwd2').text('确认密码不能小于6位');
		$('#error_pwd2').show();
		return false;
	}
	if ($('#pwd1').val() != pwd) {
		$('#error_pwd2').text('两次密码不一致');
		$('#error_pwd2').show();
		return false;
	}
	
	$('#error_pwd1').hide();
	return true;
}

function _check_email(email) {
	if (email == '') {
		$('#error_email').text('请输入邮箱地址');
		$('#error_email').show();
		return false;
	}
	re = /^[a-zA-Z0-9][a-zA-Z0-9._-]*@[a-zA-Z0-9\._-]+([\.][a-zA-Z]{2}|[\.][a-zA-Z]{3})+$/;
	if (!re.test(email)) {
		$('#error_email').text('邮箱地址格式错误');
		$('#error_email').show();
		return false;
	}
	var emailError = false;
	$.ajax({
		url: "/ajax.php?action=check_email&memail="+encodeURI(email) ,
		type: "get",
		async: false,
		dataType: 'text',
		data: {},
		success: function(res) {
			if (res !== 'succeed') {
				$('#error_email').text(res);
				$('#error_email').show();
				emailError = true;
			} else {
				$('#error_email').hide();
			}
		}		
	});
	if (emailError == true) return false;
	$('#error_email').hide();
	return true;
}
function _check_authcode(code) {
	if (code == '') {
		$('#error_authcode').text('请填写验证码');
		$('#error_authcode').show();
		return false;
	}
	if (code.length < 4) {
		$('#error_authcode').text('验证码格式不正确');
		$('#error_authcode').show();
		return false;
	}
	var codeError = false;
	$.ajax({
		url: "/ajax.php?action=check_authcode&regcode="+code,
		type: "get",
		async: false,
		dataType: 'text',
		data: {},
		success: function(res) {
			if (res !== 'succeed') {
				$('#error_authcode').text(res);
				$('#error_authcode').show();
				codeError = true;
			} else {
				$('#error_authcode').hide();
			}
		}		
	});
	if (codeError == true) return false;
	$('#error_authcode').hide();
	return true;
}
</script>
<div class="txtbox k1 form_box">
	<table width="100%" border="0" cellpadding="0" cellspacing="1">
	<caption>基本信息</caption>
<form name="register" id="register" method="post" onsubmit="return check_form();" enctype="multipart/form-data" action="<?=$cms_abs?>register.php?forward=<?=$forward?>">
	<tr><td align="right" widht="30%">用&#160;户&#160;名：</td>
	<td width="35%">
	<input type="text" size="35" maxlength="25" name="mname" id="mname" value="" onBlur="_check_user(this.value)"  />
	</td>
	<td align="left" width="35%"><span class="error" id="error_username">&nbsp;</span></td>
	</tr>
	<tr><td align="right">密&#160;&#160;&#160;&#160;码：</td>
	<td>
	<input type="password" size="35" maxlength="25" name="password" id="pwd1" value="" onBlur="_check_pwd1(this.value)" />
	</td>
	<td><span class="error" id="error_pwd1">&nbsp;</span></td>
	</tr>
	<tr><td align="right">确认密码：</td>
	<td>
	<input type="password" size="35" maxlength="25" name="password2" id="pwd2" value="" onBlur="_check_pwd2(this.value)" />
	</td>
	<td><span class="error" id="error_pwd2">&nbsp;</span></td>
	</tr>
	<tr><td align="right">邮件地址：</td>
	<td>
	<input type="text" size="35" maxlength="25" name="email" id="email" value="" onBlur="_check_email(this.value)" />
	</td>
	<td><span class="error" id="error_email">&nbsp;</span></td>
	</tr>
	
	<tr><td align="right">性&#160;&#160;&#160;&#160;别：</td>
	<td>
	<input class="radio" type="radio" name="gender" value="保密" checked style="border:0">保密
	<input class="radio" type="radio" name="gender" value="男"  style="border:0">男
	<input class="radio" type="radio" name="gender" value="女"  style="border:0">女
	</td></tr>
	
	<tr><td align="right">验 证 码：</td>
	<td><input type="text" name="regcode" id="regcode_1" size="4" value="" maxlength="4" onBlur="_check_authcode(this.value)"> 
	<img src="regcode.php" alt="点击图片换验证码" style="vertical-align:inherit;cursor:pointer;" onClick="this.src='regcode.php?'+Date.parse(new Date())"> 
	<span class="notice" id="checkregcode">点击图片换验证码</span>
	</td>
	<td><span class="error" id="error_authcode">&nbsp;</span></td>
	</tr>
    <tr><td colspan="3" align="center">
    	<br />
    	<input type="submit" name="register" value="1" style="cursor: pointer;background: url(<?=$tplurl?>images/zc0823.gif) no-repeat 0 -287px;width: 172px;height: 54px;border: 0;margin-bottom: 20px;" />
    </td>
    
    </tr>
</form>
	</table>
</div>

</div>
<div id="right">
<div id="lm2"><dl>
<dt><img src="<?=$tplurl?>images/tuijian2ico.gif"  align="absmiddle" />推荐专题</dt>
<dd><?php $_index_readmin=_ctag_parse(array("ename" => "index_readmin","tclass" => "archives","disabled" => "0","limits" => "2","caidson" => "1","casource" => "1","caids" => "1,2,4,5,6,7,17,14,3,15,16,18,19,20","ccids1" => "30","chsource" => "2","chids" => "4","orderby" => "favorites_desc","closed" => "-1","abover" => "-1",));foreach($_index_readmin as $v){_aenter($v);?>
	    <div id="txtpic">
<div class="retxtpic_r"><b><a <? if(($v['ccid3'])) { ?>style="color:red;"<? } ?> href="<?=$v['arcurl']?>" title="<?=$v['subject']?>"><?php echo _utag_parse(array("ename" => "subject30","tclass" => "odeal","tname" => "$v[subject]","trim" => "30",));?>
</a></b><br>作者：<?=$v['author']?><br>发表时间：<?php echo _utag_parse(array("ename" => "createdate_nj","tclass" => "date","tname" => "$v[createdate]","date" => "m-d",));?>
<br /><a href="<?=$v['arcurl']?>"  target="_blank">[全文阅读]</a>
</div>
<div class="retxtpic_l pic_on"><a href="<?=$v['arcurl']?>" target="_blank"><?php $u=_utag_parse(array("ename" => "thumb_66_87","tclass" => "image","tname" => "$v[thumb]","maxwidth" => "66","maxheight" => "87","thumb" => "1","emptyurl" => "template/default/images/mr_face.gif",));if(!empty($u)){?><img src="<?=$u['url_s']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$u['subject']?>"><?php } unset($u);?></a></div>
</div><?php _aquit();} unset($_index_readmin,$v);?>
</dd></dl></div>
</div></div>
<div id="links"><b>友情链接：</b><?php $_txtflinklist=_ctag_parse(array("ename" => "txtflinklist","tclass" => "farchives","limits" => "10","cols" => "1","casource" => "1","orderby" => "vieworder_asc",));foreach($_txtflinklist as $v){_aenter($v);?>
<a href="<?=$v['linkurl']?>" title="<?=$v['subject']?>" target=_blank><?=$v['subject']?></a><?php _aquit();} unset($_txtflinklist,$v);?>
<br /><?php $_picflinklist=_ctag_parse(array("ename" => "picflinklist","tclass" => "farchives","limits" => "10","cols" => "1","casource" => "2","orderby" => "vieworder_asc",));foreach($_picflinklist as $v){_aenter($v);?>
<a href="<?=$v['linkurl']?>" title="<?=$v['linktxt']?>"><?php $u=_utag_parse(array("tclass" => "image","tname" => "$v[piclink]","maxwidth" => "88","maxheight" => "31","emptyurl" => "images/common/logo.gif",));if(!empty($u)){?><img src="<?=$u['url']?>"  width="<?=$u['width']?>" height="<?=$u['height']?>" title="<?=$u['subject']?>"><?php } unset($u);?></a><?php _aquit();} unset($_picflinklist,$v);?>
</div>
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