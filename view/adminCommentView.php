<?php
require_once 'lib/smarty_php/libs/Smarty.class.php';

class adminCommentView{
    private $smarty;
    

    function __construct(){
        $this->smarty= new Smarty();
    }

    function showAll($comments){
        $this->smarty->assign('comments',$comments);  
        $this->smarty->display('templates/adminComments.tpl');
    }
}