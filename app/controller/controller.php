<?php

class Controller {

    public function init($data)
    {
        // Route '/'
        if (!file_exists('PDO_info.php')) {
            $this->install();
            exit;
        }
        if ((new UserController())->countUsers() === 0) {
            $this->redirect('/new-user');
        }
        if (!isset($_SESSION['user_data'])) {
            $this->redirect('/login');
        }

        $folderController = new FolderController();
        $folderController->fetch($data);
    }

    public function install()
    {
        $settings = [];
        if (isset($_POST['pdo'])) {
            $settings['pdo'] = $_POST['pdo'];
        }
        if (isset($_POST['confirm'])) {
            if (isset($_POST['confirm']['no'])) {
                unset($_POST);
            } else {
                // Store DB data
                $data = [
                    'host' => $_POST['confirm']['host'],
                    'name' => $_POST['confirm']['name'],
                    'user' => $_POST['confirm']['user'],
                    'pass' => $_POST['confirm']['pass']
                ];
                file_put_contents('PDO_info.php', serialize($data));

                // Create tables
                require_once 'installController.php';
                $installController = new InstallController();
                if (!$installController->createTables()) return;

                $this->redirect();
            }
        }
        $view = new View();
        $view->load('install', $settings);
    }

    public function redirect($route = null): void
    {
        header('Location: ' . HOST . $route);
        exit();
    }
}