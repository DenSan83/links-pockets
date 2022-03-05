<?php

class UserModel extends Model
{
    public function countUsers(): int
    {
        $db = $this->db();
        $req = $db->query('SELECT * FROM users');
        return $req->rowCount();
    }

    public function checkExistingUser(string $name): bool
    {
        $db = $this->db();
        $req = $db->prepare('SELECT * FROM users WHERE username = :username');
        $req->bindValue(':username', $name);
        $req->execute();

        return !empty($req->fetch(PDO::FETCH_ASSOC));
    }

    public function createUser(array $user): bool
    {
        $db = $this->db();
        $req = $db->prepare('INSERT INTO users(username, pw, created_at) VALUES(:username, :pw, NOW())');
        $req->bindValue(':username', $user['name']);
        $req->bindValue(':pw', $user['hash']);
        return $req->execute();
    }

    public function getUserFromName($name): ?User
    {
        try {
            $db = $this->db();
            $req = $db->prepare('SELECT * FROM users WHERE username = :username');
            $req->bindValue(':username', $name);
            $req->execute();

            $userArray = $req->fetch(PDO::FETCH_ASSOC);
            return new User($userArray);
        } catch (Exception $e) {
            $this->errorLog($e);

            return null;
        }
    }
}