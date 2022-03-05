<?php

include_once('config.php');
MyAutoload::start();
session_start();

if(empty($_GET['r'])) $_GET['r'] = 'home';
$request = $_GET['r']; // index.php?r=...

$router = new Router($request);
$router->getController();