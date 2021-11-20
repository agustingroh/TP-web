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
    private $userModel;
    

    function __construct()
    {
        $this->productModel = new ProductModel();
        $this->productView = new ProductView();
        $this->adminView = new AdminView();
        $this->brandModel = new BrandModel();    
        $this->userModel = new UserModel();    
    }


    public function adminView()
    {       
        session_start();     
        if (isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN)  {   // Checkeamos que el usuario sea admin
            $products =  $this->productModel->getAll();
            $brands = $this->brandModel->getAllBrands();
            $users = $this->userModel->getAll();                          
            $this->adminView->showAdminView($products, $brands,"Admistrador",$users);
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
            if (isset($_POST['product']) && (isset($_POST['price'])) && (isset($_POST['description'])) && (isset($_POST['brand'])) && !empty($_POST['description']) && !empty($_POST['price']) && !empty($_POST['product'])&&($_FILES['image']['type'] == "image/jpg" || $_FILES['image']['type'] == "image/jpeg" || $_FILES['image']['type'] == "image/png")) {
                

                // creating directory if not exist for saving images
                $path = $_SERVER["DOCUMENT_ROOT"] . '/tp/public/uploads';
                
                if(!is_dir( $path ) ){                   
                    mkdir($path, 0777, true);                              
                }
             
               

                $filePath = 'public/uploads/' . uniqid("", true) . "." . strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION));   
                
                      
                move_uploaded_file($_FILES['image']['tmp_name'], $filePath);

                $this->productModel->add($_POST['description'], $_POST['brand'], $_POST['price'], $_POST['product'], $filePath);
                
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
            if (isset($_POST['product']) && (isset($_POST['price'])) && (isset($_POST['description'])) && (isset($_POST['brand'])) && !empty($_POST['description']) && !empty($_POST['price']) && !empty($_POST['product'])&&($_FILES['image']['type'] == "image/jpg" || $_FILES['image']['type'] == "image/jpeg" || $_FILES['image']['type'] == "image/png")) {
                
                $filePath = "public/upload/" . uniqid("", true) . "." . strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION));            
                move_uploaded_file($_FILES['image']['tmp_name'], $filePath);
                //lo tengo que volver a hacer?? puede que lo que se tenga que editar sea el nombre nomas, y esto me crearia una nuevaimg, o no??
                
                $this->productModel->edit($_POST['id'], $_POST['product'], $_POST['description'], $_POST['brand'], $_POST['price'], $filePath);
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



    public function getFilteredProducts($params,$limit,$page)
    {
     
        try {
            $brands = $this->brandModel->getAllBrands();
            if (!$params || $params=='allbrands'){                 
                $page = $page? $page : 1;                
                $limit = $limit? $limit : 5;                       
                $offset = ($limit * $page) - $limit;
                $productCount = $this->productModel->getCount();                
                $products =  $this->productModel->getAll($limit,$offset);                
            }
            else
                $products = $this->productModel->getAllProductsByBrandId($params);           

            session_start();                      
                $this->productView->showAllProducts($products, $brands,"Inicio",$productCount->count);                 
                         
        } catch (Exception $e) {
            $this->adminView->showMessage("Bad request", 400);
        }
    }
}
