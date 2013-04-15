<?
!defined('M_COM') && exit('No Permission');
load_cache('cnodes',$sid);
class cls_notice{
	var $index = 0;//主站首页
	var $sindex = 0;//子站首页
	var $cnstrs = array();
	var $aids = array();
	var $saids = array();//需要追溯其合辑的文档id
	function __construct(){
		$this->cls_notice();
	}
	function cls_notice(){
	}
	function init(){
		$this->index = 0;
		$this->sindex = 0;
		$this->cnstrs = array();
		$this->aids = array();
		$this->saids = array();//需要追溯其上级合辑的文档id
	}
	function saids2aids(){
		global $enablestatic,$db,$tblprefix;
		if(!$enablestatic) return;
		if(!$this->saids) return;
		$query = $db->query("SELECT pid FROM {$tblprefix}albums WHERE aid ".multi_str(array_keys($this->saids))." AND checked=1 ORDER BY abid");
		while($row = $db->fetch_array($query)){
			$this->aids[$row['pid']] = 1;
		}
		$this->saids = array();
	}
	function deal_cnstr(){
		//相关类目的上级类目追溯 //组合节点的上级节点 //各类系的一级节点，栏目与其它类系的二级组合节点，上级类目的一级节点
		global $enablestatic,$cnodes,$timestamp,$db,$tblprefix;
		if(!$enablestatic) return;
		$cnstrs = array_keys($this->cnstrs);
		$cns = array();
		foreach($cnstrs as $cnstr){
			parse_str($cnstr,$idsarr);
			$cns = $cns + $this->parse($idsarr);
		}
		$cns = array_intersect(array_keys($cnodes),array_keys($cns));
		$cns && $db->query("UPDATE {$tblprefix}cnodes SET ineedstatic=$timestamp,lneedstatic=$timestamp,bkneedstatic=$timestamp WHERE ename ".multi_str($cns));
		unset($cns,$idsarr,$cnstrs);
		$this->cnstrs = array();
	}
	function parse($ids=array()){
		$rets = array();
		if(!$ids) return $rets;
		$caid = $ids['caid'];
		$pids = pcaidsarr($caid,1);
		foreach($pids as $id) $rets["caid=$id"] = '';
		foreach($ids as $k => $v){
			if($k != 'caid'){
				$coid = str_replace('ccid','',$k);
				$rets["caid=$caid&$k=$v"] = '';
				$pids = pccidsarr($v,$coid,1);
				foreach($pids as $id) $rets["ccid$coid=$id"] = '';
			}
		}
		unset($pids);
		return $rets;
	}
	function deal(){
		global $enablestatic,$db,$tblprefix,$timestamp,$sid;
		if(!$enablestatic) return;
		$this->saids && $this->saids2aids();
		$this->index && $db->query("UPDATE {$tblprefix}mconfigs SET value=$timestamp WHERE varname='ineedstatic'");
		($sid && $this->sindex) && $db->query("UPDATE {$tblprefix}subsites SET ineedstatic=$timestamp WHERE sid='$sid'");
		$this->cnstrs && $this->deal_cnstr();
		if($this->aids){
			$sqlstr = "needstatic='$timestamp'";
			$sqlstr .= ",needstatic1='$timestamp'";
			$sqlstr .= ",needstatic2='$timestamp'";
			$plus_mode = 'needstatic_2';@include M_ROOT."./include/arcplus.inc.php";
			$db->query("UPDATE {$tblprefix}archives_sub SET $sqlstr WHERE aid ".multi_str(array_keys($this->aids)));
		}
		$this->init();
	}
}
?>
