<?php
require_once "model/CommentModel.php";
require_once "api/view/ApiView.php";
require_once "model/UserModel.php";
require_once "view/adminCommentView.php";

class commentController
{

    private $apiView;
    private $commentModel;
    private $data;
    private $userModel;
    private $adminCommentView;

    function __construct()
    {
        $this->commentModel = new CommentModel();
        $this->adminCommentView = new adminCommentView();
        $this->apiView = new ApiView();
        $this->data = file_get_contents("php://input");
        $this->userModel = new UserModel();
    }

    function getAll()
    {
        try {
            $comments = $this->commentModel->getComments();
            $this->apiView->response($comments, 200);
        } catch (Exception $e) {
            $this->apiView->response(null, 500);
        }
    }

    function getCommentsByProductId($params = [])
    {
        try {
            if (!empty($params) && isset($params[':ID'])) {

                $comments = $this->commentModel->getCommentsByProductId($params[":ID"]);
                $this->apiView->response($comments, 200);
            } else
                $this->apiView->response(null, 404);
        } catch (Exception $e) {
            $this->apiView->response(null, 500);
        }
    }

    function addComment($params = [])
    {
        try {
            session_start();
            if (isset($_SESSION['email']) && !empty($_SESSION['email'])) {
                if ($_SESSION['role'] == 2 || $_SESSION['role'] == 1) {
                    $email = $_SESSION['email'];
                    $user = $this->userModel->get($email);
                    $comment = json_decode($this->data);
                    if ($comment->comment != null || $comment->comment != '') {
                        $id =  $this->commentModel->add($comment->comment, $comment->punctuation, $comment->productId, $user->id_user);
                        $newComment = $this->commentModel->get($id);
                        $this->apiView->response($newComment, 200);
                    } else {
                        $this->apiView->response(null, 404);
                    }
                } else
                    $this->apiView->response(null, 401);
            } else
                $this->apiView->response(null, 404);
        } catch (Exception $e) {
            $this->apiView->response(null, 500);
        }
    }

    function deleteComment($params = [])
    {
        try {
            session_start();
            if ($_SESSION['role'] == 1) {
                if (!empty($params) && isset($params[":ID"])) {
                    $this->commentModel->delete($params[":ID"]);
                    $this->apiView->response(null, 200);
                } else
                    $this->apiView->response(null, 404);
            } else
                $this->apiView->response(null, 401);
        } catch (Exception $e) {
            $this->apiView->response(null, 500);
        }
    }

    function getFilteredComments($params = [])
    {

        try {
            if (!empty($params) && !empty($params[":ID"]) && !empty($params[":ORDER"]) && !empty($params[":SORT"] && isset($params[":SORT"]) && isset($params[":ORDER"]) && isset($params[":ID"]))) {
                $sort = '';
                $order = '';
                if ($params[":ORDER"] == 'asc')
                    $order = 'ASC';
                else if ($params[":ORDER"] == 'desc')
                        $order = 'DESC';
                    else
                        $this->apiView->response(null, 404);

                if ($params[":SORT"] == 'punctuation')
                    $sort = 'punctuation';
                else if ($params[":SORT"] == 'date')
                        $sort = 'date';
                    else
                        $this->apiView->response(null, 404);

                $comments = $this->commentModel->getFiltered($order, $sort, $params[":ID"]);
                $this->apiView->response($comments, 200);
            } else {
                $this->apiView->response(null, 404);
            }
        } catch (Exception $e) {
            $this->apiView->response(null, 500);
        }
    }

    function getCommentsByPunctuation($params = []){
        try {
            if (!empty($params) && !empty($params[":ID"]) && !empty($params[":SORT"]) && isset($params[":SORT"]) && isset($params[":ID"]) && isset($params)) {
                $comments = $this->commentModel->getByPunctuation($params[":SORT"], $params[":ID"]);
                $this->apiView->response($comments, 200);
            } else {
                $this->apiView->response(null, 404);
            }
        } catch (Exception $e) {
            $this->apiView->response(null, 500);
        }
    }
}
