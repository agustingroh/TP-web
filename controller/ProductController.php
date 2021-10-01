<?php
require_once 'model/ProductModel.php';
require_once 'view/ProductView.php';
require_once 'view/AdminView.php';
require_once 'model/BrandModel.php';
require_once 'view/AccountView.php';

class ProductController
{

    private $productModel;
    private $productView;
    private $adminView;
    private $brandModel;
    private $accountView;

    function __construct()
    {
        $this->productModel = new ProductModel();
        $this->productView = new ProductView();
        $this->adminView = new AdminView();     
        $this->brandModel = new BrandModel();  
        $this->accountView = new AccountView();
    }

    public function getAllProducts()
    {
       
        $products =  $this->productModel->getAll();
        $brands = $this->brandModel->getAllBrands();
        $this->productView->showAllProducts($products,$brands);
    }

    public function adminView()
    {    
        session_start();
       
        if (!isset($_SESSION['email']) && $_SESSION['role']!=1){
           $this->accountView->showLogin();
        }
        else{
      
            $products =  $this->productModel->getAll();        
            $brands = $this->brandModel->getAllBrands();
            $this->adminView->showAdminView($products, $brands,"ingreso con exito");
        }
    }

    public function deleteProduct($id)
    {
        try{   
        if($id)    
            $this->productModel->remove($id);
        else 
            $this->adminView->showMessage("Id invalido",400);
        
    } catch (Exception $e) {
        $this->adminView->showMessage("No se pudo eliminar el producto",500);
    }

        header("Location: /tp/admins");
        die();
    }

    public function newProduct()
    {
        try {
            if (isset($_POST['product']) && (isset( $_POST['price'])) && (isset(  $_POST['description'])) && (isset(  $_POST['brand']) )&& !empty($_POST['description']) && !empty($_POST['price'])&& !empty($_POST['product'])) { 
                $this->productModel->add($_POST['description'], $_POST['brand'], $_POST['price'], $_POST['product']);
                header("Location: /tp/admins");               
                
            } else {
                $this->adminView->showMessage("Completa todos los campos",400);
                
           }
        } catch (Exception $e) {
            $this->adminView->showMessage("No se pudo crear el producto",500);
        }
        die();
    }

    public function edit()
    {  
        try {
            if (isset($_POST['product']) && (isset( $_POST['price'])) && (isset(  $_POST['description'])) && (isset(  $_POST['brand']) )&& !empty($_POST['description']) && !empty($_POST['price'])&& !empty($_POST['product']) ) { 
                $this->productModel->edit($_POST['id'], $_POST['product'], $_POST['description'], $_POST['brand'], $_POST['price']);
                header("Location: /tp/admins");
            die();
            }   else $this->adminView->showMessage("Algo ha salido mal",400);
        } 
        catch (Exception $e) {  
            $this->adminView->showMessage("Bad request",400);
        }
    }

    public function getProduct($id){
       
        try {  
            $product =  $this->productModel->get($id);
            if (empty($product))
                $this->adminView->showMessage("Ese producto no existe",400);
            else
                $this->productView->showProduct($product);
        } 
        catch (Exception $e) {  
            $this->adminView->showMessage("Bad request",400);
        }
    }



    public function getFilteredProducts()
    { 
        try {
            $brands = $this->brandModel->getAllBrands();
            if($_POST['brand']=='allbrands' || empty($_POST['brand']))
                $products =  $this->productModel->getAll();       
            else
                $products = $this->productModel->getAllProductsByBrandId($_POST['brand']);
            
            session_start();
            if($_SESSION['role'] == 1){

                 $this->productView->showAllProducts($products,$brands, "show");
            }
            else{
                $this->productView->showAllProducts($products,$brands, "hide");

            }

        }
        catch (Exception $e) {  
            $this->adminView->showMessage("Bad request",400);
        }
    }

  
}
