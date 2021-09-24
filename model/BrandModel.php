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

        $stmt = $this->db->prepare("SELECT brand_name,id_brand FROM Brand ORDER BY brand_name ASC");
        $stmt->execute();
        $products = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $products;
    }

    public function deleteBrand ($id){
        $stmt = $this->db->prepare("DELETE FROM Brand WHERE id_brand=?");
        $stmt->execute(array($id));       
    }

    public function add($brand)
    {
        $stmt = $this->db->prepare("INSERT INTO Brand (brand_name) VALUES (?)");
        $stmt->execute(array($brand));       
    
    }

    public function edit($id,$brand)
    {     
        $stmt = $this->db->prepare("UPDATE Brand SET brand_name=? WHERE id_brand=?");
        $stmt->execute(array($brand,$id));       
    
    }
}