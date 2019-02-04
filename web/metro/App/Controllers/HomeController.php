<?php

namespace App\Controllers;

use Core\AuthController;
use Model\User;

class HomeController extends AuthController
{
    /**
     * @description(Home)
     * @method("GET")
     */
    public function index()
    {
        $this->render('home');
    }
}
