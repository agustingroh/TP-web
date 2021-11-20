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
            session_start();     
            if (isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN)  {
                if ($id)
                    $this->productModel->remove($id);
                else
                    $this->adminView->showMessage("Id invalido", 400);
            }
            else  $this->adminView->showMessage("No tienes permisos", 400);
        } catch (Exception $e) {
            $this->adminView->showMessage("No se pudo eliminar el producto", 400);
        }

        header("Location: ".BASE_URL  . "admins");
        die();
    }

    public function newProduct()
    {
        try {
            session_start();     
            if (isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN)  {
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
            }
            else $this->adminView->showMessage("no tienes permisos", 400);
        } catch (Exception $e) {
            $this->adminView->showMessage("No se pudo crear el producto", 400);
        }
        die();
    }

    public function edit()
    {
        try {
            session_start();     
            if (isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN)  {
                if (isset($_POST['product']) && (isset($_POST['price'])) && (isset($_POST['description'])) && (isset($_POST['brand'])) && !empty($_POST['description']) && !empty($_POST['price']) && !empty($_POST['product'])) {
                    if ($_FILES['image']['name'] != ""){
                        
                        if ($_FILES['image']['type'] == "image/jpg" || $_FILES['image']['type'] == "image/jpeg" || $_FILES['image']['type'] == "image/png"){
                    
                            $filePath = 'public/uploads/' . uniqid("", true) . "." . strtolower(pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION));   
                            move_uploaded_file($_FILES['image']['tmp_name'], $filePath);
                        
                            $this->productModel->edit($_POST['id'], $_POST['product'], $_POST['description'], $_POST['brand'], $_POST['price'], $filePath);
                            header("Location: ".BASE_URL  . "admins");
                            die();
                        }
                        else $this->adminView->showMessage("ingrese tipo de imagen valido", 400);
                    }else{
                        //no cambio imagen
                        $product=$this->productModel->get($_POST['id']);
                        $filePath=$product->filePath;

                        $this->productModel->edit($_POST['id'], $_POST['product'], $_POST['description'], $_POST['brand'], $_POST['price'], $filePath);
                        header("Location: ".BASE_URL  . "admins");
                    }

                } else $this->adminView->showMessage("Algo ha salido mal", 400);
            }
            else $this->adminView->showMessage("no tienes permisos", 400);
        } catch (Exception $e) {
            $this->adminView->showMessage("Bad request", 400);
        }
    }

    function deleteImageProduct($id_product){
        try{
            session_start();     
            if (isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN)  {
                if($id_product){
                    $product=$this->productModel->get($id_product);
                    if($product){
                        if(is_file($product->filePath)){
                            unlink($product->filePath);
                        }
                        $this->productModel->edit($product->id_product, $product->component, $product->description, $product->id_brand,$product->price, NULL);
                        header("Location: ".BASE_URL  . "admins");
                    }
                    else $this->adminView->showMessage("el producto no existe", 400);
                }
                else $this->adminView->showMessage("seleccione un producto", 400);
            }
            else $this->adminView->showMessage("no tienes permisos", 400);

        } catch (Exception $e) {
            $this->adminView->showMessage("no se pudo eliminar imagen", 400);
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
