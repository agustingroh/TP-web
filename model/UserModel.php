<?php

class UserModel {

    private $db;



function __construct()
{
    $this->db = new PDO('mysql:host=localhost;dbname=tpweb;charset=utf8', 'root', '');
}


   
    function logIn($email,$password,$userRole){
        $stmt = $this->db->prepare("INSERT INTO User (email,password,role) VALUES (?,?,?)");
        $stmt->execute(array($email,$password,$userRole));
      
    }

    function get($email){
        $stmt = $this->db->prepare("SELECT id_user,email,password,role FROM User WHERE email=?");
        $stmt->execute(array($email));
        return $stmt->fetch(PDO::FETCH_OBJ);
        
    }

    function getAll(){
        $stmt = $this->db->prepare("SELECT id_user,email,role FROM User");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }

    function edit($userId,$role){
        $stmt = $this->db->prepare("UPDATE User SET role=? WHERE id_user=?");
        $stmt->execute(array($role,$userId));
    }

    function delete($userId){
        $stmt = $this->db->prepare("DELETE FROM User WHERE id_user=?");
        $stmt->execute(array($userId));
    }

    function getById($userId){
        $stmt = $this->db->prepare("SELECT id_user,email,role FROM User WHERE id_user=?");
        $stmt->execute(array($userId));
        return $stmt->fetch(PDO::FETCH_OBJ);
    }

}