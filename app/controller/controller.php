<?php

class Controller {

    public function init($data)
    {
        // Route '/'
        if (!file_exists('PDO_info.php')) {
            $installController = new InstallController();
            $installController->install();
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

    public function redirect($route = null): void
    {
        header('Location: ' . HOST . $route);
        exit();
    }
}