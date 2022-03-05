<?php
//session_start();

include_once('config.php');
MyAutoload::start();

if(!isset($_GET['r'])) $_GET['r'] = 'home';
$request = $_GET['r']; // index.php?r=...

$router = new Router($request);
$router->getController();