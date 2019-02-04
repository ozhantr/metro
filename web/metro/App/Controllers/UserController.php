<?php

namespace App\Controllers;

use Core\AuthController;
use Model\User;

class UserController extends AuthController
{
    /**
     * @description(Get All Guest List);
     * @method("GET")
     */
    public function guest()
    {
        if ($_SESSION['authorization'] != 'admin') {
            header("location: /home");
        }

        $user = new User();
        $data = $user->getGuestUsers();
        $this->render('users', $data);
    }
}
