function $id(d){return typeof d == 'string' ? document.getElementById(d) : d}
top.__08CMS_TOP_INFO__ || (top.__08CMS_TOP_INFO__ = {'_INFOS_' : {}});
var _08CMS_ = top.__08CMS_TOP_INFO__, undefined;
_08CMS_.set = function(key, val){if(!this._INFOS_[key] || this._INFOS_[key].window === window)this._INFOS_[key] = {'window' : window, 'value' : val};return this._INFOS_[key].value};
_08CMS_.get = function(key){return this._INFOS_[key] ?  this._INFOS_[key].value : undefined};
$WE = _08CMS_.set('$id', $id);
if(!$WE.elements){
	$WE.index = 999;
	$WE.elements = {};
}
(typeof CMS_ABS == 'undefined') && (CMS_ABS = '');

function redirect(url){
	if(location.assign){
		location.assign(url);
	}else{
		location.replace(url);
	}
}

function Cookie(key, value, expires, path, domain, secure){
	key = encodeURIComponent(key);
	var t = expires, r = (new RegExp('(?:;\s*)?' + key + '=(.*?)(?:;|$)')).exec(document.cookie), e, f;
	if(value !== undefined){
		if(t && !(t instanceof Date)){
			e = t;t = new Date();
			if(value === null){
				value = '';
			}else{
				e = /^([+-]?)(\d+)([YMWDHIS]?)$/i.exec(e) || [,,0];
				e[3] && (e[3] = e[3].toUpperCase());
				e[3] == 'W' && (e[3] = 'D') && (e[2] *= 7);
				f = {Y : 'FullYear', M : 'Month', D : 'Date', H : 'Hours', I : 'Minutes', S : 'Seconds'}[e[3] || 'I'];
				eval('t.set' + f + '(t.get' + f + '()' + (e[1] || '+') + e[2] + ')')
			}
		}
		document.cookie = key + '=' + encodeURIComponent(value)
						+ (t ? ';expires=' + t.toGMTString() : '')
						+ '; path=' + (typeof path != 'string' ? '/' : path)
						+ (domain ? '; domain=' + domain : '')
						+ (secure ? '; secure' : '')
	}
	return r ? decodeURIComponent(r[1]) : r
}
function listen(dom,event,action){
	if(dom.attachEvent){
		var func=action;action=function(){func.apply(dom,arguments)};
		dom.attachEvent('on'+event,action);
	}else if(dom.addEventListener){
		dom.addEventListener(event,action,false);
	}else{
		if(!dom.listens)dom.listens=[];
		var x,e=dom.listens[event];
		if(!e){
			e=dom.listens[event]=[];
			if(dom['on'+event])e.push(dom['on'+event]);
			dom['on'+event]=function(m){
				for(var i=0,l=e.length;i<l;i++)e[i].call(dom,m);
			}
		}
		e.push(action);
	}
}
function trim(str) {
	return str?str.replace(/^\s+|\s+$/,''):'';
}
function empty(val){
	var i,ret = !val;
	if(!ret){
		if(typeof val == 'string')
			ret =/^[\s|0]*$/.test(val);
		else if(val instanceof Array)
			ret = !val.length;
		else if(val instanceof Object){
			ret = true;
			for(i in val){ret = false;break}
		}
	}
	return ret;
}
function init_clear(a){
	var a = a instanceof Array ? a : arguments, l = a.length, r = '', i;
	if(l){
		for(i = 0; i < l; i++)r += 'delete $WE.elements[' + a[i] + '];';
		r = 'try{' + r + '}catch(e){}';
	}
	return r;
}
function uploadwin(mode,element,mincount,maxcount,player,float,width,height){
	width = width || 650;
	height = height || 500;
	var i,p,ifr,win,wid='uploadwin',url=CMS_ABS + 'upload.php?win_id='+wid+'&type='+mode+'&mincount='+mincount+'&maxcount='+maxcount+(empty(player)?'':'&player=1');
	p = $id(element);
	i = p.fwex = p.fwex ? p.fwex : ++$WE.index;
	$WE.elements[i] = p;
	url += '&field_id=' + i;
	if(window.floatwin && (float||(float===undefined&&window.allowfloatwin))){
		floatwin('open_' + wid,-1,width,height,0,0,1);
		win=$WE('floatwin_' + wid);
		showloading();
		$WE(wid + '_content').innerHTML='<div style="width:'+win.offsetWidth+'px;height:'+(win.offsetHeight-30)+'px;overflow:auto"><iframe id="' + wid + '_iframe" name="' + wid + '_iframe" onload="showloading(\'none\');" width="100%" height="100%" frameborder="0" scrolling="no"></iframe></div>';
		ifr=$WE(wid + '_iframe');
		ifr.contentWindow.floatwinParams = {wid : wid, fid : i};
		listen(ifr,'load',function(){$WE(wid + '_title').innerHTML=this.contentWindow.document.title});
		ifr.src=url;
	}else{
		var left=(screen.width-width)/2,top=(screen.height-height)/2;
		win = window.open(url, wid, 'scrollbars=no,resizable=yes,statebar=no,width='+width+',height='+height+',left='+left+',top='+top);
		win.focus();
	}
}
function cataarea(target, element, nsid, coid, chid, ism, mode, float, width, height, callback){
	width = width || 650;
	height = height || 500;
	var f,p,s,win,ifr,i=[],wid='cataarea',url=CMS_ABS + 'cata.php?win_id='+wid+(!empty(nsid) ? '&nsid=' + nsid : '')+'&mode='+(empty(mode) ? 0 : 1)+'&coid='+coid+'&chid='+chid+'&ism='+ism;
	p = $id(target);
	i[0] = p.fwex = p.fwex ? p.fwex : ++$WE.index;
	$WE.elements[i[0]] = p;
	url += '&show_id=' + i[0];
	if(p){
		p = p.form || p.parentNode;
		while(p && p.tagName && p.tagName.toLowerCase() != 'form')p = p.parentNode;
	}
	f = typeof element =='object' ? element : (p && p[element]) ? p[element] : $id(element);
	i[1] = f.fwex = f.fwex ? f.fwex : ++$WE.index;
	$WE.elements[i[1]] = f;
	url += '&field_id=' + i[1];
	if(f)url+='&select='+f.value;
	if(callback && !f._callback)f._callback = callback;
	if(window.floatwin && (float||(float===undefined&&window.allowfloatwin))){
		floatwin('open_'+wid,-1,width,height,0,0,1);
		win=$WE('floatwin_'+wid);
		showloading();
		$WE('floatwin_'+wid).innerHTML='<div><h3 class="float_ctrl"><div id="' + wid + '_title"></div><span><a href="javascript:;" class="float_close" onclick="floatwin(\'close_' + wid + '\',0,0,0,0,0,1);' + init_clear(i) + '">&nbsp</a></span></h3></div><div id="' + wid + '_content"><div style="width:'+win.offsetWidth+'px;height:'+(win.offsetHeight-30)+'px;overflow:auto"><iframe id="'+wid+'_iframe" name="'+wid+'_iframe" onload="showloading(\'none\');" width="100%" height="100%" frameborder="0"></iframe></div></div>';
		ifr=$WE(wid+'_iframe');
		ifr.contentWindow.floatwinParams = {wid : wid, fid : i[1], sid : i[0]};
		listen(ifr,'load',function(){$WE(wid+'_title').innerHTML=this.contentWindow.document.title});
		ifr.src=url;
	}else{
		var left=(screen.width-width)/2,top=(screen.height-height)/2;
		win = window.open(url, wid, 'scrollbars=no,resizable=yes,statebar=no,width='+width+',height='+(height-30)+',left='+left+',top='+top);
		win.focus();
	}
}
function albumarea(target, element, chid , isat, isopen, float, width, height, callback){
	width = width || 800;
	height = height || 600;
	var f,p,s,win,ifr,i=[],wid='albumarea',url=CMS_ABS + 'albums.php?win_id='+wid+'&mode=1&chid='+chid+'&isat='+isat+'&isopen='+isopen;
	p = $id(target);
	i[0] = p.fwex = p.fwex ? p.fwex : ++$WE.index;
	$WE.elements[i[0]] = p;
	url += '&show_id=' + i[0];
	if(p){
		p = p.form || p.parentNode;
		while(p && p.tagName && p.tagName.toLowerCase() != 'form')p = p.parentNode;
	}
	f = typeof element =='object' ? element : (p && p[element]) ? p[element] : $id(element);
	i[1] = f.fwex = f.fwex ? f.fwex : ++$WE.index;
	$WE.elements[i[1]] = f;
	url += '&field_id=' + i[1];
	if(!f._data)f._data = {};
	if(callback && !f._callback)f._callback = callback;
	f._tmp = {};
	for(k in f._data)f._tmp[k] = f._data[k];
	if(window.floatwin && (float||(float===undefined&&window.allowfloatwin))){
		floatwin('open_'+wid,-1,width,height,0,0,1);
		win=$WE('floatwin_'+wid);
		showloading();
		$WE('floatwin_'+wid).innerHTML='<div><h3 class="float_ctrl"><div id="' + wid + '_title"></div><span><a href="javascript:;" class="float_close" onclick="floatwin(\'close_' + wid + '\',0,0,0,0,0,1);' + init_clear(i) + '">&nbsp</a></span></h3></div><div id="' + wid + '_content"><div style="width:'+win.offsetWidth+'px;height:'+(win.offsetHeight-30)+'px;overflow:auto"><iframe id="'+wid+'_iframe" name="'+wid+'_iframe" onload="showloading(\'none\');" width="100%" height="100%" frameborder="0"></iframe></div></div>';
		ifr=$WE(wid+'_iframe');
		ifr.contentWindow.floatwinParams = {wid : wid, fid : i[1], sid : i[0]};
		listen(ifr,'load',function(){$WE(wid+'_title').innerHTML=this.contentWindow.document.title});
		ifr.src=url;
	}else{
		var left=(screen.width-width)/2,top=(screen.height-height)/2;
		win = window.open(url, wid, 'scrollbars=no,resizable=yes,statebar=no,width='+width+',height='+(height-30)+',left='+left+',top='+top);
		win.focus();
	}
}
function checkempty(name, form, limit, regular, min, max){
	var field = typeof name != 'string' ? name : form ? form.elements[name] : $id(name), dom = field.length ? field[0] : field, tag = dom.tagName.toLowerCase(), ret = lang('empty_info'), i, val;
	if(tag == 'option'){
		for(i = 0; i < field.length; i++)if(field[i].selected && !empty(field[i].value)){ret = '';val = field[i].value;break}
	}else if(tag == 'textarea'){
		val = dom.value;
		if(!empty(val))ret = '';
	}else if(dom.type){
		switch(dom.type.toLowerCase()){
		case 'text':
		case 'password':
		case 'hidden':
		case 'file':
		case 'button':
		case 'image':
			val = dom.value;
			if(!empty(dom.value))ret = '';
			break;
		case 'radio':
		case 'checkbox':
			for(i = 0; i < field.length; i++)if(field[i].checked && !empty(field[i].value)){ret = '';val = field[i].value;break}
			break;
		default:
			ret = '';//unknow
		}
	}else{
		ret = '';//unknow
	}
	!ret && val && limit && (ret = checklimit(val, limit));
	!ret && val && (ret = checkregular(regular, val));
	return ret;
}
function checkcheck(name, form){
	var field = typeof name != 'string' ? name : form ? form.elements[name] : $id(name), dom = field.length ? field[0] : field, tag = dom.tagName.toLowerCase(), ret = lang('empty_info'), i, val;
	if(tag == 'option'){
		for(i = 0; i < field.length; i++)if(field[i].selected){ret = '';break}
	}if(dom.type){
		switch(dom.type.toLowerCase()){
		case 'radio':
		case 'checkbox':
			field.length || (field = [field]);
			for(i = 0; i < field.length; i++)if(field[i].checked){ret = '';break}
			break;
		default:
			ret = '';//unknow
		}
	}else{
		ret = '';//unknow
	}
	return ret;
}
function checktext(id, notnull, limit, regular, min, max){
	var dom=$id(id),val=trim(dom.value),len,ret;
	if(empty(val))return empty(notnull) ? '' : lang('not can empty');
	if(limit && (ret=checklimit(val,limit)))return ret;
	if(ret = checkregular(regular, val))return ret;
	if(!min&&!max)return;
	len=strlen(val);
	min=parseInt(min);
	max=parseInt(max);
	if((min && len < min) || (max && len > max))return lang('length_fall_between', min, max);
}
function checkmultitext(id, notnull, min, max){
	var dom=$id(id),val=trim(dom.value),len,ret;
	if(empty(val))return empty(notnull) ? '' : lang('not can empty');
	if(!min&&!max)return;
	len=strlen(val);
	min=parseInt(min);
	max=parseInt(max);
	if((min && len < min) || (max && len > max))return lang('length_fall_between', min, max);
}
function checkhtmltext(id, notnull, min, max){
	var val=trim(CKEDITOR && CKEDITOR.instances[id] ? CKEDITOR.instances[id].getData() : $id(id).value),len,ret;
	if(empty(val))return empty(notnull) ? '' : lang('not can empty');
	if(!min&&!max)return;
	len=strlen(val);
	min=parseInt(min);
	max=parseInt(max);
	if((min && len < min) || (max && len > max))return lang('length_fall_between', min, max);
}
function checksimple(id, notnull, exts){
	var e=','+exts+',',dom=$id(id),val=trim(dom.value),ext;
	if(empty(val))return empty(notnull) ? '' : lang('not can empty');
	ext=trim(val.substr(val.lastIndexOf('.')+1)).toLowerCase();
	if(!ext||e.indexOf(','+ext+',')<0)return lang('not support this upload type extension of adjunct !');
}
function checkmultiple(id, notnull, exts, min, max){
	var dom=$id(id),val=trim(dom.value),len;
	if(empty(val))return empty(notnull) ? '' : lang('not can empty');
	val=val.split('\n');len=val.length;
	min=parseInt(min);
	max=parseInt(max);
	if((min && len < min) || (max && len > max))return lang('count out_and_validate',min,max);
	var i,v,e=','+exts+',',ext;
	for(i=0;i<len;i++){
		v=val[i].split('|');
		if(empty(v[0]) || v.length>3 || (v.length==3 && !isint(trim(v[2]))))return (i+1)+lang('line not be validate data format !');
		ext=trim(v[0].substr(v[0].lastIndexOf('.')+1)).toLowerCase();
		if(!ext||e.indexOf(','+ext+',')<0)return (i+1)+lang('line not support this upload type extension of adjunct !');
	}
}
function checkdate(id, notnull, min, max){
	var dom=$id(id),val=trim(dom.value),e=/^(\d{4})-(\d{1,2})-(\d{1,2})$/,ret;
	if(empty(val))return empty(notnull) ? '' : lang('not can empty');
	if(ret=checklimit(val,'date'))return ret;
	if(!min&&!max)return;
	if(min && (ret=min.match(e)))min=new Date(ret[1],ret[2],ret[3]);else min=0;
	if(max && (ret=max.match(e)))max=new Date(ret[1],ret[2],ret[3]);else max=0;
	ret=val.match(e);val=new Date(ret[1],ret[2],ret[3]);
	if((min && val < min) || (max && val > max))return lang('date out_and_validate',min,max)
}
function checkint(id, notnull, regular, min, max){
	var dom=$id(id),val=trim(dom.value),ret;
	if(empty(val))return empty(notnull) ? '' : lang('not can empty');
	if(ret=checklimit(val,'int'))return ret;
	if(ret = checkregular(regular, val))return ret;
	if(!min&&!max)return;
	val=parseInt(val);
	min=parseInt(min);
	max=parseInt(max);
	if((min && val < min) || (max && val > max))return lang('out_and_validate',min,max)
}
function checkfloat(id, notnull, regular, min, max){
	var dom=$id(id),val=trim(dom.value),ret;
	if(empty(val))return empty(notnull) ? '' : lang('not can empty');
	if(ret=checklimit(val,'number'))return ret;
	if(ret = checkregular(regular, val))return ret;
	if(!min&&!max)return;
	val=parseFloat(val);
	min=parseFloat(min);
	max=parseFloat(max);
	if((min && val < min) || (max && val > max))return lang('out_and_validate',min,max)
}
function checklimit(val,limit){
	var ret;
	switch(limit){
	case'int':
		if(!isint(val))ret = lang('not be a integer');
		break;
	case'number':
		if(!isnumber(val))ret = lang('not be a number');
		break;
	case'letter':
		if(!isletter(val))ret = lang('not be validate letter string');
		break;
	case'numberletter':
		if(!isnumberletter(val))ret = lang('not be validate character string');
		break;
	case'tagtype':
		if(!istagtype(val))ret = lang('please use letter initially character string');
		break;
	case'date':
		if(!isdate(val))ret = lang('not be validate date format');
		break;
	case'email':
		if(!isemail(val))ret = lang('not be validate email address format');
		break;/*
	default:
		ret=lang('unknow detect format');*/
	}
	return ret;
}
function checkregular(regular, val){
	try{
		if(regular){
			eval('var e=' + regular);
			if(e.test(val))return lang('input fall rule');
		}
	}catch(e){
		return lang('regularerr');
	}
}
function strlen(str){
	var tmp =window.charset == 'utf-8' ? '***' : '**';
	return str.replace(/[^\x00-\xff]/g, tmp).length;
}
function isdate(str){
	var ret = str.match(/^(\d{4})-(\d{1,2})-(\d{1,2})$/);
	if(ret == null) return false;
	ret[2] --;
	var d = new Date(ret[1],ret[2],ret[3]);
	return d.getFullYear() == ret[1] && d.getMonth() == ret[2] && d.getDate() == ret[3];
}
function isnumber(str){
	var reg = /^(-?\d+)(\.\d+)?$/;
	return reg.test(str);
}
function isnumberletter(str){
	var reg = /^\w+$/;
	return reg.test(str);
}
function istagtype(str){
	var reg = /^[a-zA-Z]+\w*$/;
	return reg.test(str);
}
function isletter(str){
	var reg = /^[a-zA-Z]+$/;
	return reg.test(str);
}
function isint(str){
	var reg = /^-?\d+$/;
	return reg.test(str);
}
function isemail(str){
	var reg = /([\w|_|\.|\+]+)@([-|\w]+)\.([A-Za-z]{2,4})/;
	return reg.test(str);
}

function findtags(parentobj, tag) {
	if(parentobj.getElementsByTagName) {
		return parentobj.getElementsByTagName(tag);
	} else if(parentobj.all && parentobj.all.tags) {
		return parentobj.all.tags(tag);
	} else {
		return null;
	}
}
function clearalerts(form){
	tags = findtags(form,'div');
	if(!tags) return;
	var reg = /^alert_/;
	for(k in tags){
		if(reg.test(tags[k].id)){
			try{
				var div = document.createElement('div');
				div.id =tags[k].id;
				div.className = tags[k].className;
				tags[k].parentNode.replaceChild(div,tags[k]);
			}catch(e){
				tags[k].innerHTML = '';
			}
		}
	}
}
function checklogin(form){
	var ret;
	if(checktext(form.username, 1, 0, 0, 3, 15)){
		form.username.focus();
		ret = 'uname_err';
	}else if(checktext(form.password, 1)){
		form.password.focus();
		ret = 'pwd_e1';
	}else if(form.regcode && !/\w{4}/.test(form.regcode.value)){
		form.regcode.value = '';
		form.regcode.focus();
		ret = 'code_e1';
	}else if(form.client_t){
		form.client_t.value = (new Date).getTime();
	}
	ret && alert(lang(ret));
	return !ret;
}
function checksubject(btn, tab, fix){
	var field = btn.form[fix ? fix : 'subject'], val = trim(field.value), ajax = Ajax();
	if(!val || !tab)return alert(lang('inputsubject'));
	btn.disabled = true;
	ajax.form(CMS_ABS + 'ajax.php?action=subject',{'table':tab,'subject':val}, function(xml){
		btn.disabled = false;
		count = parseInt(xml);
		alert(lang(!count ? 'subjectavailable' : count == -1 ? 'inputsubject' : 'subjectexist'));
	});
}
function checkbiming(btn, tab, fix){
	var field = btn.form[fix ? fix : 'biming'], val = trim(field.value), ajax = Ajax();
	if(!val || !tab)return alert('请输入笔名');
	btn.disabled = true;
	ajax.form(CMS_ABS + 'ajax.php?action=biming',{'table':tab,'biming':val}, function(xml){
		btn.disabled = false;
		count = parseInt(xml);
		alert(lang(!count ? '笔名可用' : count == -1 ? '请输入笔名' : '笔名已存在'));
	});
}