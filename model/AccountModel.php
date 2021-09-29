<?php

class AccountModel {

    private $db;

function __construct(){
    $this->db= new PDO('mysql:host=localhost;' . 'dbname=tpweb;charset=utf-8', 'root','');
}


    function add(){

    }

    function signIn(){
        var_dump($_POST);
    }

}