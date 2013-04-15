<link href="<?=$tplurl?>css/login.css" rel="stylesheet" type="text/css" />
<div class="topLogin">

<form name=formlogin action="<?=$cms_abs?>login.php?forward=<?=$forward?>" method="post">
<input type="hidden" name="expires" value="1m" />

<label class="label">账户名：</label>
<div class="login_ipt"><input name="username" id="username" type="text" size="15" maxlength="15" onmouseover="input_over(this)" onmouseout="input_out(this)"></div>

<label class="label">密码：</label>
<div class="login_ipt"><input name="password" id="password" type="password" size="15" maxlength="12" onmouseover="input_over(this)" onmouseout="input_out(this)" /></div>

<label class="label">验证码:</label>
<div class="login_ipt"><input type="text" name="regcode" id="regcode" size="4" maxlength="4" onmouseover="input_over(this)" onmouseout="input_out(this)" /><img src="<?=$cms_abs?>regcode.php" style="vertical-align:top;cursor:pointer;" onclick="this.src='<?=$cms_abs?>regcode.php?t='+(new Date).getTime()"></div>

<div style="float:left;">
<input type="hidden" name="cmslogin" value="true" />
<input style="float:left;margin-left:5px;margin-top:1px;" src="<?=$tplurl?>images/b_login.gif" type="image" value="确定" />

<a style="float:left;margin-left:5px;margin-top:1px;" href="<?=$cms_abs?>register.php" target="_blank"><img src="<?=$tplurl?>images/b_reg.gif" width="70" height="21" border="0"></a>

<a href="<?=$cms_abs?>lostpwd.php" class="label" style="float:left;margin-left:5px;margin-top:1px;" target="_blank">找回密码</a>

</div>




</form>

</div>