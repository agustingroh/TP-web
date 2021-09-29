<?php
require_once 'view/AccountView.php';
require_once 'model/AccountModel.php';
class AccountController
{

    function addAccount(){
        var_dump($_POST['password']);
    }

}