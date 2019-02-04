<?php

namespace App\Controllers;

use Core\BaseController;
use Model\User;

class LoginController extends BaseController
{
    protected $errorCodes = [
        1001 => 'Invalid email or password!',
    ];
    /**
     * @description(Login Form)
     * @method("GET")
     */
    public function index()
    {
        $this->render('login');
    }

    /**
     * @description(Check Login Data)
     * @method("POST")
     */
    public function auth()
    {
        if (!$this->isAjaxRequest()) {
            return false;
        }

        $user = new User;
        $data = $user->getUserByEmail($_POST['login']['email']);

        /**
         * Check user password
         */
        if (!password_verify($_POST['login']['password'], $data['password'])) {
            $this->displayError(1001);
        }

        session_start();
        $_SESSION['user_id'] = $data['id'];
        $_SESSION['authorization'] = $data['authorization'];
        $this->rest(['url' => 'home']);
    }
}
