<?php

namespace Model;

use Core\BaseModel;

class Guestbook extends BaseModel
{
    public function getMy($userID)
    {
        $userID = $this->db->safe($userID);

        $sql = "SELECT u.id, u.first_name,u.last_name,gb.title,gb.is_active,gb.created_at 
        FROM test_app.guestbook gb
        LEFT JOIN user u ON gb.user_id = u.id 
        WHERE u.id = $userID 
        ORDER BY gb.created_at DESC";

        $result = $this->db->query($sql);

        $rows = [];
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }

        $this->db->freeResult();

        return $rows;
    }

    public function getGuest()
    {
        $sql = "SELECT gb.id, u.first_name, u.last_name, gb.title, gb.is_active, gb.created_at 
        FROM test_app.guestbook gb
        LEFT JOIN user u ON gb.user_id = u.id 
        WHERE u.authorization = 'guest' 
        ORDER BY gb.created_at DESC";

        $result = $this->db->query($sql);

        $rows = [];
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }

        $this->db->freeResult();

        return $rows;
    }

    public function toogleValidation($gbID)
    {
        $gbID = $this->db->safe($gbID);

        $sql = "UPDATE test_app.guestbook SET is_active = IF(is_active = 1, 0, 1) WHERE id = $gbID";
        $result = $this->db->query($sql);
        $row = $this->db->affectedRows();
        $this->db->freeResult();

        return $row;
    }

    public function insert($userID, $title, $note)
    {
        $userID = $this->db->safe($userID);
        $title = $this->db->safe($title);
        $note = $this->db->safe($note);

        $sql = "INSERT test_app.guestbook (user_id, title, note) VALUES ($userID, $title, $note)";
        $result = $this->db->query($sql);
        $row = $this->db->affectedRows();
        $this->db->freeResult();

        return $row;
    }
}
