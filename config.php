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
        $host = 'https://' . $_SERVER['HTTP_HOST'];

        /////// LOCALHOST ////////
        $localFolder = '/mylocals/06.Links_pockets';
        $root = $root . $localFolder;
        $host = 'http://' . $_SERVER['HTTP_HOST'] . $localFolder;
        //////////////////////////

        define('HOST',$host);
        define('ROOT',$root);

        define('MODEL',ROOT.'/app/model/');
        define('CONTROLLER',ROOT.'/app/controller/');
        define('VIEW',ROOT.'/app/view/');
        define('OBJ',ROOT.'/app/object/');
        define('ROUTER',ROOT.'/app/router/');

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
        else if (file_exists(OBJ . $class . '.php')) {
            require_once OBJ . $class . '.php';
        }
        else if (file_exists(ROUTER . $class . '.php')) {
            require_once ROUTER . $class . '.php';
        }
    }
}
