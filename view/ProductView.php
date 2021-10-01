<?php
require_once 'lib/smarty_php/libs/Smarty.class.php';

class ProductView {
    private $smarty;

    function __construct(){
        $this->smarty= new Smarty();
    }
    
    public function showAllProducts($products,$brands, $state = ''){ 
        
        $this->smarty->assign('products',$products);
       $this->smarty->assign('brands',$brands); 
       $this->smarty->assign('state',$state);   

        $this->smarty->display('templates/allProductList.tpl');

    }

    public function showProduct($product){ 
             
        $this->smarty->assign('product',$product);
        $this->smarty->display('templates/productSpecifications.tpl');

    }

}