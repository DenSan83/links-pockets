<?php

class Controller {

    public function init($data)
    {
        // Route '/'
        $installController = new InstallController();
        if (!file_exists('PDO_info.php')) {
            $installController->install();
            exit;
        }
        $testConnection = $installController->testConnection();
        if ($testConnection['result'] === 'ko') {
            if (isset($_POST['confirm']['no'])) {
                unset($_POST);
                if (file_exists('PDO_info.php')) {
                    unlink('PDO_info.php');
                }
                $testConnection = [];
            }

            $view = new View();
            $view->load('install', $testConnection);
            exit;
        }
        if ((new UserModel())->countUsers() === 0) {
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

    protected function notify(string $type, string $message): void
    {
        $notificationController = new notificationController();
        $notificationController->createNotification($type, $message);
    }
}