<?php
require_once './app/model/installModel.php';

class InstallController extends Controller
{
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