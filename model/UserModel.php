<?php

class UserModel {

    private $db;



function __construct()
{
    $this->db = new PDO('mysql:host=localhost;dbname=tpweb;charset=utf8', 'root', '');
}


   
    function signIn($email,$password){
        $stmt = $this->db->prepare("INSERT INTO User (email,password,role) VALUES (?,?,?)");
        $stmt->execute(array($email,$password,1));
      
    }

    function get($email){
        $stmt = $this->db->prepare("SELECT id_user,email,password,role FROM User WHERE email=?");
        $stmt->execute(array($email));
        return $stmt->fetch(PDO::FETCH_OBJ);
        
    }

}