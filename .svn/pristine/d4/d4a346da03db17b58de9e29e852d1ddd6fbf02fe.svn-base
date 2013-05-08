<?
!defined('M_COM') && exit('No Permission');
class cls_ncache{
	var $catalogs = array();
	var $altypes = array();
	function __construct(){
		$this->cls_ncache();
	}
	function cls_ncache(){
	}
	function active($nsid){
		$this->catalogs = read_ncache('catalogs',$nsid);
		$this->altypes = read_ncache('altypes',$nsid);
	}
}
?>
