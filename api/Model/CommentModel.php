<?php

class CommentModel {

    private $db;

 function __construct() {
    $this->db = new PDO('mysql:host=localhost;dbname=tpweb', 'root', '');
 }

 function getComments(){
    $stmt=$this->db->prepare("SELECT c.id_comment, c.comment, c.punctuation, u.email, p.component FROM Comment c INNER JOIN Product p ON c.id_product=p.id_product INNER JOIN User u ON u.id_user=c.id_user ");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
 }

 function getCommentsByProductId($productId){
     $stmt=$this->db->prepare("SELECT c.id_comment, c.comment, c.punctuation, u.email, p.component FROM Comment c INNER JOIN Product p ON c.id_product=p.id_product INNER JOIN User u ON u.id_user=c.id_user WHERE p.id_product=?");
     $stmt->execute(array($productId));
     return $stmt->fetchAll(PDO::FETCH_OBJ);

 }

 function add($comment,$punctuation,$productId,$userId){
     $stmt= $this->db->prepare("INSERT INTO Comment(comment, punctuation, id_product, id_user) VALUES(?,?,?,?)");
     $stmt->execute(array($comment, $punctuation, $productId,$userId));
     return $this->db->lastInsertId();
 }

 function get($id){
        $stmt=$this->db->prepare("SELECT * FROM Comment WHERE id_comment=?");
        $stmt->execute(array($id));
        return $stmt->fetch(PDO::FETCH_OBJ);
 }
 }