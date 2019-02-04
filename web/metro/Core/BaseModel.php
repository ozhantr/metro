<?php

namespace Core;

/**
 * Base Model.
 *
 * @author  Ozhan Duran <ozhan@hotmail.com>
 *
 * @version 1.0.0
 *
 */
abstract class BaseModel
{
    protected $db;

    public function __construct()
    {
        $this->db = DB::getInstance();
    }

    public function __call($name, $arg)
    {
        exit($name . ': Invoking inaccessible methods!');
    }
}
