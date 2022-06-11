<?php

class Model
{
    public ?PDO $pdo = null;

    public function db(): ?PDO
    {
        if (!$this->pdo instanceof PDO) {
            $rawData = file_get_contents('PDO_info.php');
            $pdoData = unserialize($rawData);
            $PDO_host = $pdoData['host'];
            $PDO_dbname = $pdoData['name'];

            try {
                $this->pdo = new PDO("mysql:host=$PDO_host;dbname=$PDO_dbname;charset=utf8", $pdoData['user'], $pdoData['pass']);
                date_default_timezone_set('Europe/Paris');
            } catch (PDOException $e) {
                $installController = new InstallController();
                $installController->install($e->getMessage());
            }
        }
        return $this->pdo;
    }

    public function testDbConnection(): array
    {
        $rawData = file_get_contents('PDO_info.php');
        $pdoData = unserialize($rawData);
        $PDO_host = $pdoData['host'];
        $PDO_dbname = $pdoData['name'];

        try {
            new PDO("mysql:host=$PDO_host;dbname=$PDO_dbname;charset=utf8", $pdoData['user'], $pdoData['pass']);
            $return['result'] = 'ok';
        } catch (PDOException $e) {
            $return['result'] = 'ko';
            $return['error'] = $e->getMessage();
            $return['pdo'] = $pdoData;
        }

        return $return;
    }

    public function errorLog(Exception $e): void
    {
        $d = new DateTime('NOW');
        $msg = $d->format('Y-m-d H:i:s');
        $msg .= ' >> File:' . $e->getFile() . ':' . $e->getLine() . PHP_EOL;
        $msg .= ' >> ' . $e->getMessage() . PHP_EOL;
        file_put_contents('error_log.log', $msg, FILE_APPEND);
        echo 'An error has emerged. Please see the error_log';
    }
}