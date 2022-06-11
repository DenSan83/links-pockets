<?php

class InstallModel extends Model
{
    public function createUsersTable(): bool
    {
        $db = $this->db();
        try {
            $req = $db->prepare('
                CREATE TABLE IF NOT EXISTS users(
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    username VARCHAR(255) NOT NULL,
                    email VARCHAR(255) NOT NULL,
                    avatar VARCHAR(255),
                    pw VARCHAR(255) NOT NULL,
                    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
                ) ENGINE = InnoDB;
            ');

            return $req->execute();
        } catch (Exception $e) {
            $this->errorLog($e);
            return false;
        }
    }

    public function createLinksTable(): bool
    {
        $db = $this->db();
        try {
            $req = $db->prepare('
                CREATE TABLE IF NOT EXISTS links(
                    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    user_id INT NOT NULL,
                    title VARCHAR(255) NOT NULL,
                    url TEXT,
                    description TEXT,
                    img TEXT NOT NULL,
                    org TEXT NOT NULL,
                    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                    FOREIGN KEY (user_id) REFERENCES users(id)
                    ON DELETE CASCADE
                ) ENGINE = InnoDB;
            ');

            return $req->execute();
        } catch (Exception $e) {
            $this->errorLog($e);
            return false;
        }
    }
}