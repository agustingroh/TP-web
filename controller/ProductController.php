<?php
require_once 'model/ProductModel.php';
require_once 'view/ProductView.php'; 
require_once 'view/AdminView.php'; 
class ProductController{

    private $productModel;
    private $productView;
    private $adminView;

    function __construct(){
        $this->productModel = new ProductModel();
        $this->productView = new ProductView();
        $this->adminView = new AdminView();
    }
    
    public function getAllProducts(){
       $products =  $this->productModel->getAll();
       $this->productView->showAllProducts($products);       
    }
        
    public function adminView(){
        $products =  $this->productModel->getAll();
        $this->adminView->showAdminView($products);       
     }

     public function deleteProduct($id){        
         $this->productModel->remove($id);        
         header("Location: /tp/admins");
         die();
             
     }

     public function newProduct(){     
        if(!isset($_POST['description']) && !isset($_POST['brand']) && !isset($_POST['price']) && !isset($_POST['product'])){
            echo "bad request";
        }

        $this->productModel->add($_POST['description'],$_POST['brand'],$_POST['price'],$_POST['product']);       
        header("Location: /tp/admins");
       // die();
            
    }
    


}