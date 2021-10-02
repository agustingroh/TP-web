<?php
require_once 'lib/smarty_php/libs/Smarty.class.php';

class ProductView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }


    public function showAllProducts($products, $brands, $userRole)
    {
      
        $this->smarty->assign('products', $products);
        $this->smarty->assign('brands', $brands);
        $this->smarty->assign('userRole', $userRole);        
        $this->smarty->display('templates/allProductList.tpl');
    }

    public function showProduct($product,$userRole)
    {

        $this->smarty->assign('product', $product);
        $this->smarty->assign('userRole', $userRole); 
   
        $this->smarty->display('templates/productSpecifications.tpl');
    }
}
