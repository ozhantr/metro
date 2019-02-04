<?php

namespace App\Controllers;

use Core\BaseController;

class LogoutController extends BaseController
{
    /**
     * @description(Logout)
     * @method("GET")
     */
    public function index()
    {
        session_start();
        unset($_SESSION['user_id']);
        unset($_SESSION['authorization']);
        session_unset();
        session_destroy();

        header("location: /login");
    }
}
