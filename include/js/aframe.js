var Head = document.getElementsByTagName('head')[0],
	all_operates = {}, curr_operate;
function $id(d){return typeof d == 'string' ? document.getElementById(d) : d}
function listen(dom,event,action){
	if(dom.attachEvent){
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
function setsite(dm){
	window.open('?sid=' + dm.options[dm.selectedIndex].value, '_self');
}
function doane(e){
	if(!e)return;
	try{
		e.stopPropagation();
		e.preventDefault();
	}catch(x){
		e.returnValue=false;
		e.cancelBubble=true;
	}
}
function initaMenu(ul, ck){
	var oa, o, s = [];
	function F(i, ul){
		var x, k;
		i.onclick = function(e){
			e = e || event;
			doane(e);
			var me = e.target || e.srcElement, a;
			me.blur();
			while(me.tagName.toLowerCase()!='li'){
				if(me.href){
					if(!e.nohref)main.location.replace(me.href.replace(/[?&]isframe\b[^&]*$|([?&])isframe\b[^&]*&/g,'$1'));
					a = 1;
				}else if(a && me.tagName.toLowerCase()=='em'){
					i.em = me;
					if(!me.className.match(/\bdj0/))me.className += ' dj0';
				}
				me = me.parentNode;
			}
			if(a){
				if(o && o.className != 'jia')o.className = o == i ? 'dian0' : o.oc ? o.oc : '';
				if(o && o != i && o.em)o.em.className = o.em.className.replace(/\s?dj0/,'');
				currItem = o = i;
				i.className = 'dian0';
			}
			if(!a && i == me && ul){
				if(i.className != 'dian0')i.className = !x ? '' : 'jia';else i.oc = !x ? '' : 'jia';
				ul.style.display = x ? 'none' : '';
				x = !x;
				if(ck)Cookie(k, x ? 1 : 0, '9Y');
			}
		};
		if(ul){
			if(ck){
				k = ck + '_' + s.join('_');
				x = Cookie(k) == 1 ? 0 : 1;
			}else{
				x = 1;
			}
			i.onclick({target:i});
		}
		i.onmouseover = function(e){
			doane(e || event);
			if(i.className != 'dian0'){
				i.oc = i.className;
				i.className += ' hover0';//alert($id('operateitem').getElementsByTagName('ul')[0].innerHTML)
			}
		};
		i.onmouseout = function(e){
			doane(e || event);
			i.className = i.className.replace(/ ?hover0/,'');
		};
	}
	function G(ul){
		var a = [], i, z, x, cu, li = ul.childNodes;
		for(i = li.length-1; i >= 0; i--)if(li[i].nodeType == 1)a.push(li[i]);
		x = a[0];
		while(i = a.pop()){
			cu = i.getElementsByTagName('ul');
			s.push(a.length);
			if(cu.length){
				F(i,cu[0]);
				G(cu[0]);
			}else{
				F(i);
			}
			s.pop();
		}
	}
	G(ul);
}
var initMenus = [], currMenu, currSub, currItem;
function setMenu(id, no){
	var s ,i = -1, k = !/^\d+$/.test(id), a = $id((k ? '' : 'mainmenu_') + id), lm = $id('leftmenu'), oi = $id('operateitem');
	if(a)a.blur();
	$id('urlmenus').style.display = 'none';
	if(!no && !window.main) return alert(lang('wait_err_load'));
	if(currMenu){
		if(currMenu == a.parentNode)return;
		currMenu.className = '';
	}
	if(a)(currMenu = a.parentNode).className = 's1';
	if(currSub){
		if(currItem && currItem.className != 'jia')currItem.className = '';
		if(currItem && currItem.em)currItem.em.className = currItem.em.className.replace(/\s?dj0/,'');
		currSub.style.display = 'none';
	}
	a = $id((k ? '' : 'submenus_') + id).getElementsByTagName('a');
	while(++i < a.length)if(s = a[i].href.match(/^javascript:\/\/(\w+)/)){
		s = {
			'content':'catamenu',
			'fcontent':'plugmenu',
			'mcontent':'clubmenu'
		}[s[1]];
		break;
	}
	if(s){
		if(s != 'catamenu' && !initMenus[id])initaMenu(initMenus[id] = $id(s));else initMenus[id] = $id(s);
		curr_operate = null;
		ini_operateitem();
		oi.style.display = '';
		lm.className = 'col1';
		(currSub = initMenus[id]).style.display = '';
		a = currSub.getElementsByTagName('a')[0];
		a && a.onclick();
	}else{
		oi.style.display = 'none';
		lm.className = 'col2';
		if(!initMenus[id])initaMenu(initMenus[id] = $id((k ? '' : 'submenus_') + id));
		(currSub = initMenus[id]).style.display = '';
		a = currSub.getElementsByTagName('a')[0];
	}
	if(!no){if(a && a.href && a.href.charAt(0) != '&' && !a.href.match(/\/&/))a.parentNode.parentNode.onclick({target:a});else main.location.href = 'about:blank'}
}
function toggleMenu(url, key) {
	hideMenu();
	if(url == 'javascript:')return;
	var i, x, k = !/^\d+$/.test(key), a = $id(key ? ((k ? '' : 'submenus_') + key) : 'leftmenu').getElementsByTagName('a');
	if(!key)url = url.replace(/[?&]isframe\b[^&]*$|([?&])isframe\b[^&]*&/g,'$1');
	k = location.href.length - (location.hash ? location.hash.length : 0);
	for(i = 0; i < a.length; i++){
		x = a[i].href.replace(/[?&]isframe\b[^&]*$|([?&])isframe\b[^&]*&/g,'$1');
		if(a[i].href == url || a[i].href.substr(a[i].href.indexOf('?')) == url || x == url || x.substr(x.indexOf('?')) == url){
			if(a[i].href.charAt(k) == '#' && a[i].href.substr(0, k) + location.hash == location.href)continue;
			x = a[i];
			while(x.tagName.toLowerCase() != 'li')x = x.parentNode;
//			if(!key)key = x.parentNode.id.match(/\d+/)[0];
			if(!key)key = x.parentNode.id;
			setMenu(key, 1);
			if(x.onclick)x.onclick({target:a[i], nohref:1});
			break;
		}
	}
}
function initCpMap(m,t) {
	var i, j, k, s, sa, ma = $id(t).getElementsByTagName('a'), fix = '',ret = '';
	for(j = 0; j < ma.length; j++) {
		k = ma[j].id.match(/\d+/)[0];
		sa = $id('submenus_' + k).getElementsByTagName('a');
		if(!sa.length)continue;
		i = -1;while(++i < sa.length)if(s = sa[i].href.match(/^javascript:\/\/(\w+)/)){s = s[1]; break;}
		switch(s){
		case 'content':
		case 'fcontent':
		case 'mcontent':
			fix += '<li><a href="javascript:" target="main" onclick="showMap();setMenu('+k+');return false">' + ma[j].innerHTML + '</a></li>';
			break;
		default:
			ret += '<td valign="top"><ul class="cmblock"><li><h4>' + ma[j].innerHTML + '</h4></li>';
			for(var i = 0; i < sa.length; i++) {
				ret += '<li><a href="' + sa[i].href + '" target="main" onclick="toggleMenu(this.href,'+k+')">' + sa[i].innerHTML + '</a></li>';
			}
			ret += '</ul></td>';
		}
	}
	if(fix)fix = '<td valign="top"><ul class="cmblock"><li><h4>' + lang('fixlink') + '</h4></li>' + fix + '</ul></td>';
	sa = $id('urlmenus').getElementsByTagName('a');
	if(sa.length){
		fix += '<td valign="top"><ul class="cmblock"><li><h4>' + lang('urllink') + '</h4></li>';
		for(var i = 0; i < sa.length; i++)fix += '<li><a href="' + sa[i].href.replace(/[?&]isframe\b[^&]*$|([?&])isframe\b[^&]*&/g,'$1') + '" target="main" onclick="toggleMenu(this.href,\'urlmenus\')">' + sa[i].innerHTML + '</a></li>';
		fix += '</ul></td>';
	}
	ret	= '<ul class="cnote"><li>' + lang('map_tip') + '</li></ul><table class="cmlist"><tr>' + fix + ret + '</tr></table>';
	$id(m).innerHTML = ret;
}
function showMap() {
	showMenu('cpmap', true);
}
function get_operate(caid, type){
	var a, i, p, t, u;
	if(curr_operate === caid)return;
	curr_operate = caid;
	type = type || 0;
	i = all_operates[type];
	if(!i)i = all_operates[type] = {};
	if(i[caid]){
			ini_operate(caid, type);
	}else{
		p = document.createElement('li');
		p.className = 'loading';
		p.appendChild(document.createTextNode(lang('load_item')));
		ini_operateitem().appendChild(p);
		a = Ajax();
		u = 'ajax.php?action=' + (
			type == 0 ? ('ablock&sid=' + site_id +'&caid=' + caid) :
			type == 1 ? ('fblock&caid=' + caid) :
						('mblock&mchid=' + caid)
			) + '&t=' + (new Date).getTime();
		a.get(u, function(x){
				  clearTimeout(t);
				eval('i[caid] = ' + x);
				ini_operate(caid, type);
		});
		t = setTimeout(function(){a=null;p.innerHTML = 'time out'},30000);
	}
}
function ini_operate(caid, type){
	if(curr_operate !== caid)return;
	var a, l, i, u, d = ini_operateitem(), p = all_operates[type][caid];
	function F(m){var c; m.onmouseover = function(){c = m.className; m.className = 'btnon'}; m.onmouseout = function(){if(m.className == 'btnon')m.className = c}}
	for(i = 0; i < p.length && p[i]; i++){
		a = document.createElement('a');
		a.href = !p[i][1] || p[i][1] == '#' ? 'javascript:' : p[i][1];
		a.target = 'main';
		a.onclick = function(){this.blur();if(d._curr_)d._curr_.className = '';d._curr_ = this.parentNode;d._curr_.className = 'btnok';};
		a.appendChild(document.createTextNode(p[i][0]));
		F(l = document.createElement('li'));
		l.appendChild(a);
		d.appendChild(l);
		if(i == 0){
			u = a.href
			setTimeout(function(){main.location.replace(u)},20);
			a.onclick();
		}
	}
}
function ini_operateitem(){
	var p = $id('operateitem'), d = p.childNodes, i = -1;
	while(++i < d.length)if(d[i].nodeType == 1 && d[i].tagName.toLowerCase() == 'ul'){d[i].parentNode.removeChild(d[i]);break};
	d = document.createElement('ul');
	p.appendChild(d);
	return d;
}
function resetEscAndF5(e) {
	e = e ? e : window.event;
	actualCode = e.keyCode ? e.keyCode : e.charCode;
	if(actualCode == 27) {
		showMap();
	}
	if(actualCode == 116 && parent.main) {
		parent.main.location.reload();
		if(document.all) {
			e.keyCode = 0;
			e.returnValue = false;
		} else {
			e.cancelBubble = true;
			e.preventDefault();
		}
	}
}
function main_onload(f){
	var a, u, li, ul, id = '_'+'0'+'8'+'c'+'m'+'s'+'_'+'d'+'y'+'n'+'a'+'m'+'i'+'c'+'_'+'i'+'n'+'f'+'o', c = Cookie(id), w = f.contentWindow || window.main, d = w.document;
	if(!w.location.href.match(/\bentry=home\b/i))return;
	listen(d.documentElement, 'keydown', resetEscAndF5);
	ul = d.getElementById(id);
	if(ul){
		li = d.createElement('li');
		li.appendChild(d.createTextNode('L'+'o'+'a'+'d'+'i'+'n'+'g'+'.'+'.'+'.'));
		ul.appendChild(li)
	}//alert(escape('http://www.08cms.com/ajax.php?'))
	if(ul || !c){
		eval("u='http://www.08cms.com/ajax.php?'+(ul?('a'+'c'+'t'+'i'+'o'+'n'+'='+'d'+'y'+'n'+'a'+'m'+'i'+'c'):('t='+(new Date).getTime()))");
/*		a = Ajax();
		a.get(u, function(x){
			
		});
		Cookie(id, 1);*/
	}
}
listen(document.documentElement, 'keydown', resetEscAndF5);
