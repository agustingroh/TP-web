<?php
define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

require_once 'controller/ProductController.php';
require_once 'controller/BrandController.php';
require_once 'controller/UserController.php';

$productController = new ProductController();
$brandController = new BrandController();
$userController = new UserController();



if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = "home";
}


$params = explode('/', $action);

switch ($params[0]) {
    case 'coments':

        break;
    case 'home':
  
        $productController->getFilteredProducts();
        break;
    case 'admins':
        $productController->adminView();
        break;
    case 'deleteProduct':
        $productController->deleteProduct($params[1]);
        break;
    case 'newProduct':
        $productController->newProduct();
        break;
    case 'editProduct':
        $productController->edit();
        break;
    case 'newBrand':
        $brandController->new();
        break;
    case 'deleteBrand':
        $brandController->delete($params[1]);
        break;
    case 'editBrand':
        $brandController->edit();
        break;
    case 'showProduct':
        $productController->getProduct($params[1]);
        break;
    case 'logIn':
        $userController->logIn();
        break;
    case 'newAdmin':
            $userController->signIn();
            break;
    default:
  
        $productController->getFilteredProducts();
        break;
}
