<?php
require_once 'lib/smarty_php/libs/Smarty.class.php';

class ProductView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }


    public function showAllProducts($products, $brands,$title,$count = null)
    {      
        $this->smarty->assign('count', $count);
        $this->smarty->assign('products', $products);
        $this->smarty->assign('brands', $brands); 
        $this->smarty->assign('title', $title);              
        $this->smarty->display('templates/home.tpl');
    }

    public function showProduct($product,$title)    {

        $this->smarty->assign('product', $product); 
        $this->smarty->assign('title', $title);  
        $this->smarty->display('templates/productSpecifications.tpl');
    }
}
