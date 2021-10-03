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
       try{
      $password = password_hash($_POST['password'],PASSWORD_BCRYPT);
      $this->userModel->logIn($_POST['email'],$password,$userRole);
       }catch(Exception $e){
          if($userRole==UserRole::BILLING){
          $this->accountView->logInView("¡El usuario ya existe!");
          }else{
            $this->adminView->showMessage("¡El usuario ya existe!", 400);
          }
          die();
       }
    }

   public function newAdmin(){  
      $this->logIn(UserRole::ADMIN);      
      $this->signIn();
        
    }

   public function newUser(){  
      $this->logIn(UserRole::BILLING); 
      $this->signIn();   
          
      }

    public function signIn(){  
       try{   
         $userData =  $this->userModel->get($_POST['email']);
         echo"USER DATA";
         var_dump($userData);
         if(password_verify($_POST['password'],$userData->password)){
            session_start();            
            $_SESSION['role'] = $userData->role;
            $_SESSION['email'] = $userData->email;

            if($_SESSION['role'] == UserRole::ADMIN)
               header("Location: ".BASE_URL  . "admins"); 
            else
               header("Location: ".BASE_URL  . "home");
            die();
         }else if($userData!=false)             
            $this->accountView->signInView("¡Contraseña incorrecta!");   // si ingresa mal la contraseña mostramos el error  
         else
            $this->accountView->signInView("¡El usuario no existe"); 

      }catch(Exception $e){
         $this->adminView->showMessage("Bad request", 400);
      }
       
         
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