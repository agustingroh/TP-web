<?php
require_once "api/Model/CommentModel.php";
require_once "api/view/ApiView.php";
require_once "model/UserModel.php";

class commentController
{

    private $apiView;
    private $commentModel;
    private $data;
    private $userModel;

    function __construct()
    {
        $this->commentModel = new CommentModel();
        $this->apiView = new ApiView();
        $this->data = file_get_contents("php://input");
        $this->userModel = new UserModel();
    }


    function getCommentsByProductId($params = [])
    {

        try {
            if (!empty($params)) {

                $comments = $this->commentModel->getCommentsByProductId($params[":ID"]);
                $this->apiView->response($comments, 200);
            }
        } catch (Exception $e) {
            $this->apiView->response(null, 500);
        }
    }

    function addComment($params = [])
    {
        try {   
             
                    session_start();
                    if(isset($_SESSION['email']) && !empty($_SESSION['email'])){
                        if($_SESSION['role']==2 || $_SESSION['role']==1){
                             $email = $_SESSION['email'];
                             $user = $this->userModel->get($email);                
                            $comment = json_decode($this->data);
                            $id =  $this->commentModel->add($comment->comment, $comment->punctuation, $comment->productId, $user->id_user);
                            $newComment = $this->commentModel->get($id);
                            $this->apiView->response($newComment, 200);
                        }else
                            $this->apiView->response(null, 401);
                        
                    }else
                        $this->apiView->response(null, 404);
              
        } catch (Exception $e) {
            $this->apiView->response(null, 500);
        }
    }
}
