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
        try {
            session_start();     
            if (isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN)  {
                if ($id)
                    $this->brandModel->deleteBrand($id);
                header("Location: ".BASE_URL  . "admins");
            }
            else  $this->adminView->showMessage("No tienes permisos", 400);

        } catch (Exception $e) {
            $this->adminView->showMessage("La marca esta siendo utilizada por un producto",500);
        }
        
    }

    public function new()
    {
        try{
            session_start();     
            if (isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN)  {
                if (!isset($_POST['brand']) || !isset($_POST['id'])|| empty($_POST['brand'])) {
                    $this->adminView->showMessage("Bad request",400);              
                } else {
                    $this->brandModel->add($_POST['brand']);
                    header("Location: ".BASE_URL  . "admins");
                } 
            }
            else  $this->adminView->showMessage("No tienes permisos", 400);
                      
        }catch(Exception $e){         
            
            $this->adminView->showMessage("La marca ingresada ya existe",500);
        }

      
    }

    public function edit()
    {  
        try{
            session_start();     
            if (isset($_SESSION['email']) && $_SESSION['role'] == UserRole::ADMIN)  {
                if(isset($_POST['id']) && isset($_POST['brand'])&& !empty($_POST['brand'])) {       
                    $this->brandModel->edit($_POST['id'],$_POST['brand']);
                    header("Location: ".BASE_URL  . "admins");
                }
                else{
                    $this->adminView->showMessage("Bad request",400);
                }
            }
            else  $this->adminView->showMessage("No tienes permisos", 400);
            
     
        }catch(Exception $e){
            $this->adminView->showMessage("La marca que se desea utilizar esta siendo utilizada por un producto",500);
        }
    }
}
