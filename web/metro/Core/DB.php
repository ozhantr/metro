<?php

namespace Core;

use mysqli;

/**
 * DB Class.
 *
 * @author  Ozhan Duran <ozhan@hotmail.com>
 *
 * @version 1.1.0
 */
class DB
{
    const DB_USER = 'test';
    const DB_PASSWORD = 'test';
    const DB_HOST = 'lemp-mysql';
    const DB_PORT = 3306;
    const DB_TABLE = 'test_app';

    private static $instance = null;

    private $db = null;

    private function __construct()
    {
        $this->db = new mysqli(self::DB_HOST, self::DB_USER, self::DB_PASSWORD, self::DB_TABLE, self::DB_PORT);

        /* Check connection. */
        if ($this->db->connect_errno) {
            printf("Connect failed: %s\n", $this->db->connect_error);
            exit();
        }

        $this->db->set_charset('utf8mb4');
    }

    public static function getInstance()
    {
        if (null == self::$instance) {
            self::$instance = new self();
        }

        return self::$instance;
    }

    public function query($sql)
    {
        return $this->db->query($sql);
    }

    public function affectedRows()
    {
        return $this->db->affected_rows;
    }

    public function safe($input)
    {
        $input = "'".$this->db->real_escape_string($input)."'";

        return $input;
    }

    public function freeResult()
    {
        while ($this->db->more_results()) {
            $this->db->next_result();
            if ($result = $this->db->store_result()) {
                $result->free();
            }
        }
    }

    /**
     * Prevent duplication of connection.
     */
    private function __clone()
    {
    }
}
