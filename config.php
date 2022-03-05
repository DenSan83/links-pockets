<?php
/***** Configuration *****/
ini_set('display_errors','on');
error_reporting(E_ALL);

class MyAutoload
{
    public static function start()
    {

        spl_autoload_register([__CLASS__, 'autoload']);

        $root = $_SERVER['DOCUMENT_ROOT'];
        $host = $_SERVER['HTTP_HOST'];

        /////// LOCALHOST ////////
        $localFolder = '/mylocals/06.Links_pockets';
        $root = $root . $localFolder;
        $host = $host . $localFolder;
        //////////////////////////

        define('HOST','https://'.$host.'/');
        define('ROOT',$root.'/');
        define('HOME',$root.'/');

        define('MODEL',ROOT.'app/model/');
        define('CONTROLLER',ROOT.'app/controller/');
        define('VIEW',ROOT.'app/view/');
        define('ENTITY',ROOT.'app/entity/');


    }

    public static function autoload($class)
    {
        if(file_exists(MODEL.$class.'.php')) {
            require_once MODEL . $class . '.php';
        }
        else if (file_exists(CONTROLLER . $class . '.php')) {
            require_once CONTROLLER . $class . '.php';
        }
        else if (file_exists(VIEW . $class . '.php')) {
            require_once VIEW . $class . '.php';
        }
        else if (file_exists(ENTITY . $class . '.php')) {
            require_once ENTITY . $class . '.php';
        }
    }
}
