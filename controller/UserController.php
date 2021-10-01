<?php

require_once 'model/UserModel.php';
require_once 'view/AccountView.php';
class UserController
{

    private $userModel;
    private $accountView;

    function __construct()
    {
        $this->userModel= new UserModel();
        $this->accountView= new AccountView();
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
            
            $_SESSION['role'] = $userData->role;
            $_SESSION['email'] = $userData->email;
            header("Location: /tp/admins");
            
            die();
         }   
        $this->accountView->showMessage("email o contraseña incorrecto");
      
         
     }

     public function logOut (){
        session_start();
        session_destroy();
        header("Location: /tp/home");
     }
     

    
}