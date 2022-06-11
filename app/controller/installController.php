<?php
require_once './app/model/installModel.php';

class InstallController extends Controller
{
    public function install(string $msg = '')
    {
        $settings['msg'] = $msg;
        if (isset($_POST['pdo'])) {
            $settings['pdo'] = $_POST['pdo'];
        }

        $view = new View();
        if (isset($_POST['confirm'])) {
            if (isset($_POST['confirm']['no'])) {
                unset($_POST);
                if (file_exists('PDO_info.php')) {
                    unlink('PDO_info.php');
                }
            } else {
                // Store DB data
                $data = [
                    'host' => $_POST['confirm']['host'],
                    'name' => $_POST['confirm']['name'],
                    'user' => $_POST['confirm']['user'],
                    'pass' => $_POST['confirm']['pass']
                ];
                file_put_contents('PDO_info.php', serialize($data));

                // Test tables
                $test = $this->testConnection();
                if ($test['result'] === 'ko') {

                    $view->load('install', $test);
                    exit;
                } else {
                    // Create tables
                    $this->createTables();
                }

                $this->redirect();
            }
        }

        $view->load('install', $settings);
    }

    public function testConnection(): array
    {
        $model = new Model();
        return ($model->testDbConnection());
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