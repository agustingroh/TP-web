<?php
    require_once('lib/Router/Route.php');
    require_once('api/controller/CommentController.php');
      

    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

    $router = new Router();

    // rutas
     $router->addRoute("/comment/:ID", "GET", "CommentController", "getCommentsByProductId");
    
    // $router->addRoute("/tareas/:ID", "DELETE", "TaskApiController", "deleteTask");
     $router->addRoute("/comment", "POST", "CommentController", "addComment");
    // $router->addRoute("/tareas/:ID", "PUT", "TaskApiController", "updateTask");

    //run
     $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']); 
