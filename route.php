<?php
define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

require_once 'controller/ProductController.php';
// Crear una aplicación MVC para listar los nombres de productos de una casa de limpieza. 
//Al seleccionar uno se debe navegar a otra página donde se vea la descripción y precio.

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
    case 'admin':
        $controller->deleteProduct($params[1]);
        break;
    case 'newProduct':        
        $controller->newProduct();
        break;
      
    default:
        $controller->getAllProducts();
        break;
}
