<?php
require_once 'lib/smarty_php/libs/Smarty.class.php';

class AccountView{
    private $smarty;
    

    function __construct(){
        $this->smarty= new Smarty();
    }


    public function showMessage($msg,$title){
        $this->smarty->assign('message',$msg);
        $this->smarty->assign('title', $title);  
        $this->smarty->display('templates/errorLogIn.tpl');
    }

    public function signInView($message='',$title){   
        $this->smarty->assign('message',$message);
        $this->smarty->assign('title', $title);  
        $this->smarty->display('templates/registration.tpl');
    }

    public function logInView($message='',$title){
        $this->smarty->assign('message',$message);
        $this->smarty->assign('title', $title); 
        $this->smarty->display('templates/newAccount.tpl');
    }
  

}