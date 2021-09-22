<?php
require_once 'lib/smarty_php/libs/Smarty.class.php';

class ProductView {
    private $smarty;

    function __construct(){
        $this->smarty= new Smarty();
    }
    
    public function showAllProducts($products){      

        $this->smarty->assign('products',$products);

        $this->smarty->display('templates/allProductList.tpl');

    }
}