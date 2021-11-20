<?php
    require_once('lib/Router/Route.php');
    require_once('api/controller/CommentController.php');
      

    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

    $router = new Router();

    // routes
    $router->addRoute("/comment/:ID", "GET", "CommentController", "getCommentsByProductId");  
    $router->addRoute("/comment/:ID", "DELETE", "CommentController", "deleteComment");    
    $router->addRoute("/comment", "POST", "CommentController", "addComment");
    $router->addRoute("/comment", "GET", "CommentController", "getAll");
    $router->addRoute("/comment/:ID/:SORT/:ORDER", "GET", "CommentController", "getFilteredComments");
    $router->addRoute("/comment/:ID/:SORT", "GET", "CommentController", "getCommentsByPunctuation");
    //run
     $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']); 
