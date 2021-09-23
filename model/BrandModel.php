<?php

class BrandModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=tpweb;charset=utf8', 'root', '');
    }


    public function getAllBrands()
    {

        $stmt = $this->db->prepare("SELECT name,id_brand FROM Brand ORDER BY name ASC");
        $stmt->execute();
        $products = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $products;
    }

}