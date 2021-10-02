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
        $this->adminView = new AdminView();  
    }

    private function logIn($userRole){
      $password = password_hash($_POST['password'],PASSWORD_BCRYPT);
      $this->userModel->logIn($_POST['email'],$password,$userRole);
    }

   public function newAdmin(){  
      $this->logIn(UserRole::ADMIN); 
      header("Location: ".BASE_URL  . "admins");
      $this->signIn();
        
    }

   public function newUser(){  
      $this->logIn(UserRole::BILLING); 
      $this->signIn();   
          
      }

    public function signIn(){  
      $userData =  $this->userModel->get($_POST['email']);
         if(password_verify($_POST['password'],$userData->password)){
            session_start();
            
            $_SESSION['role'] = $userData->role;
            $_SESSION['email'] = $userData->email;
            header("Location: ".BASE_URL  . "admins");        
            die();
         }         
        header('Location: /tp/home');    
         
     }

     public function showSignInView(){
        $this->accountView->signInView();
     }

     public function logInView(){
      $this->accountView->logInView();
     }

     public function logOut (){
        session_start();
        session_destroy();
        header("Location:".BASE_URL  . "home");
     }
     

    
}