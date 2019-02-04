<?php

namespace Model;

use Core\BaseModel;

class User extends BaseModel
{
    public function getUserByEmail($email)
    {
        $email = $this->db->safe($email);

        $sql = "SELECT * FROM test_app.user WHERE email = $email LIMIT 1";
        $result = $this->db->query($sql);
        $row = $result->fetch_assoc();
        $this->db->freeResult();

        return $row;
    }

    public function getGuestUsers()
    {
        $sql = "SELECT * FROM test_app.user WHERE authorization = 'guest' ORDER BY first_name, last_name";
        $result = $this->db->query($sql);
        $row = $result->fetch_assoc();

        $rows = [];
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }

        $this->db->freeResult();

        return $rows;
    }
}
