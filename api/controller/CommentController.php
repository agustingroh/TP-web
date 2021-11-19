<?php
require_once "api/Model/CommentModel.php";
require_once "api/view/ApiView.php";

class commentController
{

    private $apiView;
    private $commentModel;

    function __construct()
    {
        $this->commentModel = new CommentModel();
        $this->apiView = new ApiView();
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
}