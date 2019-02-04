<?php

namespace Core;

class AuthController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        session_start();
        session_regenerate_id();
        if (!isset($_SESSION['user_id'])) {
            header("location: /login");
        }
    }
}
