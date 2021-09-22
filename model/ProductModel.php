<?php


class ProductModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=tpweb;charset=utf8', 'root', '');
    }

    public function getAll()
    {

        $stmt = $this->db->prepare("SELECT p.productId,p.component,p.description,p.price,b.name,b.brandId FROM Product p
        INNER JOIN Brand b ON b.brandId=p.brandId ORDER BY p.component");
        $stmt->execute();
        $products = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $products;
    }

    public function getAllBrands()
    {

        $stmt = $this->db->prepare("SELECT name,brandId FROM Brand ORDER BY name ASC");
        $stmt->execute();
        $products = $stmt->fetchAll(PDO::FETCH_OBJ);
        return $products;
    }


    public function remove($id)
    {
        $stmt = $this->db->prepare("DELETE FROM Product WHERE productId=?");
        $stmt->execute(array($id));       
    
    }

    public function add($description,$brandId,$price,$component)
    {
        $stmt = $this->db->prepare("INSERT INTO Product (component,description,price,brandId) VALUES (?,?,?,?)");
        $stmt->execute(array($component,$description,$price,$brandId));       
    
    }
}
