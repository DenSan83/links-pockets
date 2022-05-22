<?php
require_once './app/model/installModel.php';

class InstallController extends Controller
{
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
                if (!$this->createTables()) return;

                $this->redirect();
            }
        }
        $view = new View();
        $view->load('install', $settings);
    }

    public function createTables(): bool
    {
        $allCreated = true;
        $installModel = new InstallModel();
        if ($installModel->createUsersTable()) {
            echo 'Table users: created' . PHP_EOL;
        } else {
            echo 'Error when creating: table users' . PHP_EOL;
            $allCreated = false;
        }
        if ($installModel->createLinksTable()) {
            echo 'Table links: created' . PHP_EOL;
        } else {
            echo 'Error when creating: table links' . PHP_EOL;
            $allCreated = false;
        }

        return $allCreated;
    }
}