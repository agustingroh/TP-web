<?php
require_once 'lib/smarty_php/libs/Smarty.class.php';

class AccountView{
    private $smarty;
    

    function __construct(){
        $this->smarty= new Smarty();
    }


    public function showMessage($msg){
        $this->smarty->assign('message',$msg);
        $this->smarty->display('templates/errorLogIn.tpl');
    }

    public function signInView(){       
        $this->smarty->display('templates/registration.tpl');
    }

    public function logInView($message=''){
        $this->smarty->assign('message',$message);
        $this->smarty->display('templates/newAccount.tpl');
    }
  

}