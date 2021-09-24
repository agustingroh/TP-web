<?php
define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

require_once 'controller/ProductController.php';


$controller = new ProductController();



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
        // home();
        $controller->getAllProducts();
        break;
    case 'admins':
        $controller->adminView();
        break;
    case 'deleteProduct':
        $controller->deleteProduct($params[1]);
        break;
    case 'newProduct':
        $controller->newProduct();
        break;
    case 'editProduct':
         $controller->editProduct($params[1],$params[2],$params[3],$params[4],$params[5]);
        break;
    case 'newBrand':
        $controller->newBrand();
        break;
    case 'deleteBrand':
        $controller->deleteBrand($params[1]);
        break;

    default:
        $controller->getAllProducts();
        break;
}
