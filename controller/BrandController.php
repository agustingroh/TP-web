<?php
require_once 'view/AdminView.php';
require_once 'model/BrandModel.php';
class BrandController
{

   
    private $adminView;
    private $brandModel;

    function __construct()
      {
    
        $this->adminView = new AdminView();
        $this->brandModel = new BrandModel();
    }

    public function delete($id)
    {
        try{
        if($id)
        $this->brandModel->deleteBrand($id);
        header("Location: /tp/admins");
        }catch(Exception $e){
            
        }
        
        die();
    }

    public function new()
    {

        if (!isset($_POST['brand']) || empty($_POST['brand'])) {
            echo "bad request, completa todos los campos";
            var_dump($_POST);
        } else {
            $this->brandModel->add($_POST['brand']);
            header("Location: /tp/admins");
        }
        die();
    }

    public function edit($id,$brand){
        $this->brandModel->edit($id,$brand);
        header("Location: /tp/admins");
    }

}
