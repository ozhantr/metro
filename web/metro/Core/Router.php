<?php

namespace Core;

/**
 * Router Class.
 *
 * @author  Ozhan Duran <ozhan@hotmail.com>
 *
 * @version 1.0.0
 */
final class Router
{
    /**
     * Controller Name Space.
     */
    private static $nameSpace = 'App\\Controllers\\';

    /**
     * Controller Suffix.
     */
    public const SUFFIX = 'Controller';

    public function __construct()
    {
        $url = explode('/', $_SERVER['REQUEST_URI']);
        $this->match($url);
    }

    public function match(array $url = [])
    {
        /* CHECK CLASS NAME */
        if (isset($url[1]) && preg_match('/^([a-zA-Z]+)$/', $url[1])) {
            $controller = self::$nameSpace.$this->convertToStudlyCaps($url[1]).self::SUFFIX;
        } else {
            $controller = self::$nameSpace.'Home'.self::SUFFIX;
        }

        /* CHECK CLASS IS EXIST */
        if (class_exists($controller)) {
            /* CHECK METHOD NAME */
            if (isset($url[2]) && preg_match('/^([a-zA-Z-]+)$/', $url[2])) {
                $method = $this->convertToCamelCase($url[2]);
                $params = array_slice($url, 3);
            } else {
                $method = 'index';
                $params = [];
            }
        } else {
            http_response_code(400);
            echo $controller.'-> Class could not find!';
            die;
        }

        /* CHECK METHOD IS EXIST */
        if (!method_exists($controller, $method)) {
            http_response_code(400);
            echo $method.'-> Method could not find!';
            die;
        }

        return $this->dispatch($controller, $method, $params);
    }

    public function dispatch($controller, $method, $params)
    {
        $controllerObject = new $controller();
        $reflect = new \ReflectionClass($controllerObject);
        $doc = $reflect->getMethod($method)->getDocComment();

        preg_match("/@method\(([\"a-zA-Z,\s]+)\)/", $doc, $match);
        if (empty($match) || !preg_match("/\"({$_SERVER['REQUEST_METHOD']})\"/i", $match[1])) {
            exit('Wrong Request Method');
        }

        preg_match("#@contentType\(\"([a-zA-Z,\s]+)\"\)#", $doc, $match);
        if (!empty($match) && 'json' == $match[1]) {
            header('Content-Type: application/json; charset=UTF-8');
        }

        call_user_func_array([$controllerObject, $method], $params);
    }

    /**
     * For Class Name
     * Hyphens to StudlyCaps,
     * e.g. post-test => PostTest.
     */
    private function convertToStudlyCaps($string)
    {
        return str_replace('-', '', mb_convert_case($string, MB_CASE_TITLE, 'UTF-8'));
    }

    /**
     * For Method Name
     * Hyphens to camelCase,
     * e.g. add-test => addTest.
     */
    private function convertToCamelCase($string)
    {
        return lcfirst($this->convertToStudlyCaps($string));
    }
}
