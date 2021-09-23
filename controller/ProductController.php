<?php
require_once 'model/ProductModel.php';
require_once 'view/ProductView.php'; 
require_once 'view/AdminView.php'; 
require_once 'model/BrandModel.php';
class ProductController{

    private $productModel;
    private $productView;
    private $adminView;
    private $brandModel;

    function __construct(){
        $this->productModel = new ProductModel();
        $this->productView = new ProductView();
        $this->adminView = new AdminView();
        $this->brandModel = new BrandModel();
    }
    
    public function getAllProducts(){
       $products =  $this->productModel->getAll();
       $this->productView->showAllProducts($products);       
    }
        
    public function adminView(){
        $products =  $this->productModel->getAll();      
        $brands = $this->brandModel->getAllBrands();
        $this->adminView->showAdminView($products,$brands);       
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
        die();
            
    }

    public function editProduct($id_product,$component,$description,$price,$id_brand){
        $this->productModel->edit($id_product,$component,$description,$price,$id_brand);
        header("Location: /tp/admins");
        die();
    }
    


}