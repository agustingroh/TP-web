<?php
require_once 'lib/smarty_php/libs/Smarty.class.php';

class AdminView {
    private $smarty;
    

    function __construct(){
        $this->smarty= new Smarty();
    }
    
    public function showAdminView($products,$brands){      
        $this->smarty->assign('products',$products);
        $this->smarty->assign('brands',$brands);       
        $this->smarty->display('templates/adminAllProductList.tpl');
       

    }


    public function showMessage($msg,$error){
        $this->smarty->assign('message',$msg);
        $this->smarty->assign('error',$error);
        $this->smarty->display('templates/error.tpl');
    }
}