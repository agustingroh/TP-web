<?php

require_once 'model/UserModel.php';
class UserController
{

    private $userModel;

    function __construct()
    {
        $this->userModel= new UserModel();
    }


  public function logIn(){  
       $password = password_hash($_POST['password'],PASSWORD_BCRYPT);
       $this->userModel->logIn($_POST['email'],$password);
       header("Location: /tp/admins");
        
    }

    public function signIn(){  
      $userData =  $this->userModel->get($_POST['email']);
         if(password_verify($_POST['password'],$userData->password)){
            session_start();
            $_SESSION['email'] = $_POST['email'];
            header("Location: /tp/admins");
            die();
         }   
        
        header('Location: /tp/home');
      
         
     }

}