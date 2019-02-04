<?php

namespace App\Controllers;

use Core\AuthController;
use Model\Guestbook;

class GuestbookController extends AuthController
{
    /**
     * @description(Guestbook Create Form)
     * @method("GET")
     */
    public function create()
    {
        $this->render('note');
    }

    /**
     * @description(Guestbook Insert)
     * @method("POST")
     */
    public function insert()
    {
        if (!$this->isAjaxRequest()) {
            return false;
        }

        $title = $this->inputSanitize($_POST['guestbook']['title']);
        $note = $this->inputSanitize($_POST['guestbook']['note']);
        $gb = new Guestbook;
        $result = $gb->insert($_SESSION['user_id'], $title, $note);
        
        $this->rest(['result' => $result]);
    }

    /**
     * @description(Current User Notes)
     * @method("GET")
     */
    public function my()
    {
        $gb = new Guestbook;
        $data = $gb->getMy($_SESSION['user_id']);
        $this->render('noteList', $data);
    }

    /**
     * @description(Guest User Notes)
     * @method("GET")
     */
    public function guest()
    {
        if ($_SESSION['authorization'] != 'admin') {
            header("location: /guestbook/my");
        }
        
        $gb = new Guestbook;
        $data = $gb->getGuest();
        $this->render('noteList', $data);
    }

    /**
     * @description(Validate/Invalidate Note);
     * @method("GET")
     */
    public function validate($gbID)
    {
        if ($_SESSION['authorization'] != 'admin') {
            $this->rest(['result' => 0]);
        }

        if (!$this->isAjaxRequest()) {
            return false;
        }

        $gb = new Guestbook;
        $result = $gb->toogleValidation($gbID);
        
        $this->rest(['result' => $result]);
    }
}
