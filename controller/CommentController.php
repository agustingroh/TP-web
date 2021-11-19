<?php
require_once 'view/adminCommentView.php';
class commentController{

    private $commentView;

    function __construct()
    {
        $this->commentView = new adminCommentView();
    }

    function showComments(){
        session_start();  
        if(isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN){
            $this->commentView->showAll();            
        }
        else
       header("Location: home");
    }

}