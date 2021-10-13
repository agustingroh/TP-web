<?php
require_once 'model/ProductModel.php';
require_once 'view/ProductView.php';
require_once 'view/AdminView.php';
require_once 'model/BrandModel.php';
require_once 'view/AccountView.php';
require_once 'helper/UserRole.php';

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


    public function adminView()
    {       
        session_start();     
        if (isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN)  {   // Checkeamos que el usuario sea admin
            $products =  $this->productModel->getAll();
            $brands = $this->brandModel->getAllBrands();                          
            $this->adminView->showAdminView($products, $brands,"Admistrador");
        }
        else
        header("Location: ".BASE_URL  . "home"); // lo enviamos al home si no es admin
        
        
     



     
    }

    public function deleteProduct($id)
    {
        try {
            if ($id)
                $this->productModel->remove($id);
            else
                $this->adminView->showMessage("Id invalido", 400);
        } catch (Exception $e) {
            $this->adminView->showMessage("No se pudo eliminar el producto", 500);
        }

        header("Location: ".BASE_URL  . "admins");
        die();
    }

    public function newProduct()
    {
        try {
            if (isset($_POST['product']) && (isset($_POST['price'])) && (isset($_POST['description'])) && (isset($_POST['brand'])) && !empty($_POST['description']) && !empty($_POST['price']) && !empty($_POST['product'])) {
                $this->productModel->add($_POST['description'], $_POST['brand'], $_POST['price'], $_POST['product']);
                header("Location: ".BASE_URL  . "admins");
            } else {
                $this->adminView->showMessage("Completa todos los campos", 400);
            }
        } catch (Exception $e) {
            $this->adminView->showMessage("No se pudo crear el producto", 500);
        }
        die();
    }

    public function edit()
    {
        try {
            if (isset($_POST['product']) && (isset($_POST['price'])) && (isset($_POST['description'])) && (isset($_POST['brand'])) && !empty($_POST['description']) && !empty($_POST['price']) && !empty($_POST['product'])) {
                $this->productModel->edit($_POST['id'], $_POST['product'], $_POST['description'], $_POST['brand'], $_POST['price']);
                header("Location: ".BASE_URL  . "admins");
                die();
            } else $this->adminView->showMessage("Algo ha salido mal", 400);
        } catch (Exception $e) {
            $this->adminView->showMessage("Bad request", 400);
        }
    }

    public function getProduct($id)
    {

        try {
            $product =  $this->productModel->get($id);
            if (empty($product))
                $this->adminView->showMessage("Ese producto no existe", 400);
           
            session_start();           
                    $this->productView->showProduct($product,"Producto");  
                 
        } catch (Exception $e) {
            $this->adminView->showMessage("Bad request", 400);
        }
    }



    public function getFilteredProducts($params)
    {
     
        try {
            $brands = $this->brandModel->getAllBrands();
            if (!$params || $params=='allbrands')
                $products =  $this->productModel->getAll();
            else
                $products = $this->productModel->getAllProductsByBrandId($params);           

            session_start();                      
                $this->productView->showAllProducts($products, $brands,"Inicio");                 
                         
        } catch (Exception $e) {
            $this->adminView->showMessage("Bad request", 400);
        }
    }
}
