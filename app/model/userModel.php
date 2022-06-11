<?php

class UserModel extends Model
{
    public function countUsers(): int
    {
        $db = $this->db();
        $req = $db->query('SELECT * FROM users');
        return $req->rowCount();
    }

    public function checkExistingUser(string $email): bool
    {
        $db = $this->db();
        $req = $db->prepare('SELECT * FROM users WHERE email = :email');
        $req->bindValue(':email', $email);
        $req->execute();

        return !empty($req->fetch(PDO::FETCH_ASSOC));
    }

    public function createUser(array $user): bool
    {
        $db = $this->db();
        $req = $db->prepare('
            INSERT INTO users(username, email, pw, created_at) 
            VALUES(:username, :email, :pw, NOW())
        ');
        $req->bindValue(':username', $user['name']);
        $req->bindValue(':email', $user['email']);
        $req->bindValue(':pw', $user['hash']);
        return $req->execute();
    }

    public function getUserFromEmail(string $email): ?User
    {
        try {
            $db = $this->db();
            $req = $db->prepare('SELECT * FROM users WHERE email = :email');
            $req->bindValue(':email', $email);
            $req->execute();

            $userArray = $req->fetch(PDO::FETCH_ASSOC);
            return new User($userArray);
        } catch (Exception $e) {
            $this->errorLog($e);

            return null;
        }
    }

    public function getHashFromEmail(string $email): ?string
    {
        try {
            $db = $this->db();
            $req = $db->prepare('SELECT pw FROM users WHERE email = :email');
            $req->bindValue(':email', $email);
            $req->execute();

            $userArray = $req->fetch(PDO::FETCH_ASSOC);

            return $userArray['pw'];
        } catch (Exception $e) {
            $this->errorLog($e);

            return null;
        }
    }
}