<?php

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

require_once 'controller/ProductController.php';
require_once 'controller/BrandController.php';
require_once 'controller/UserController.php';
require_once 'controller/CommentController.php';

$productController = new ProductController();
$brandController = new BrandController();
$userController = new UserController();
$commentController = new CommentController();


if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = "home";
}


$params = explode('/', $action);

switch ($params[0]) {
    case 'home': 
        $productController->getFilteredProducts($params[1],$params[2],$params[3]);
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
    case 'newAdmin':
        $userController->newAdmin();
        break;
    case 'signIn':
        $userController->signIn();
        break;
    case 'logOut':
        $userController->logOut();
        break;
    case 'registration':
        $userController->showSignInView();
        break;
    case 'newAccount':
        $userController->logInView();
        break;
    case 'newUser':
        $userController->newUser();
        break;
    case 'userRole':
        $userController->edit($params[1],$params[2]);
        break;
    case 'deleteUser':
        $userController->delete($params[1]);
        break;
    case 'adminComments':
        $commentController->showComments();
        break;
    case 'deleteImageProduct':
        $productController->deleteImageProduct($params[1]);
        break;
    default:
        $productController->getFilteredProducts($params[1],$params[2],$params[3]);
        break;
}
