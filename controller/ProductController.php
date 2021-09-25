<?php
require_once 'model/ProductModel.php';
require_once 'view/ProductView.php';
require_once 'view/AdminView.php';
require_once 'model/BrandModel.php';

class ProductController
{

    private $productModel;
    private $productView;
    private $adminView;
    private $brandModel;

    function __construct()
    {
        $this->productModel = new ProductModel();
        $this->productView = new ProductView();
        $this->adminView = new AdminView();     
        $this->brandModel = new BrandModel();  
    }

    public function getAllProducts()
    {
        $products =  $this->productModel->getAll();
        $this->productView->showAllProducts($products);
    }

    public function adminView()
    {    
      
        $products =  $this->productModel->getAll();        
        $brands = $this->brandModel->getAllBrands();
        $this->adminView->showAdminView($products, $brands);
    }

    public function deleteProduct($id)
    {
        try{   
        if($id)    
        $this->productModel->remove($id);
        }catch(Exception $e){
            var_dump($e);
        }

        header("Location: /tp/admins");
        die();
    }

    public function newProduct()
    {

        if (isset($_POST['description']['brand']['price']['product']) || empty($_POST['description'])) { 
            echo "bad request, completa todos los campos"; 
            var_dump($_POST);
        } else {
            $this->productModel->add($_POST['description'], $_POST['brand'], $_POST['price'], $_POST['product']);
            header("Location: /tp/admins");
            var_dump($_POST);
        }
        die();
    }

    public function edit()
    {
        $this->productModel->edit($_POST['id'], $_POST['product'], $_POST['description'], $_POST['brand'], $_POST['price']);
        header("Location: /tp/admins");
        die();
    }

  
}
