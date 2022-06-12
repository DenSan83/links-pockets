<?php

class UserModel extends Model
{
    public function countUsers(): int
    {
        $db = $this->db();
        $req = $db->query('SELECT * FROM users');
        return $req->rowCount();
    }

    public function checkExistingUser(string $email, int $otherId = 0): bool
    {
        $and = null;
        if ($otherId !== 0) {
            $and = 'AND id <> :id';
        }
        $db = $this->db();
        $req = $db->prepare("SELECT * FROM users WHERE email = :email $and");
        $req->bindValue(':email', $email);
        if ($otherId !== 0) {
            $req->bindValue(':id', $otherId);
        }
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

    public function updateUser(array $user): bool
    {
        $updatePw = null;
        if (!empty($user['hash'])) {
            $updatePw = ', pw = :pw';
        }
        $req = $this->db()->prepare("
            UPDATE users SET username = :username, email = :email $updatePw
            WHERE id = :id
        ");
        $req->bindValue(':username', $user['name']);
        $req->bindValue(':email', $user['email']);
        if (!empty($user['hash'])) {
            $req->bindValue(':pw', $user['hash']);
        }
        $req->bindValue(':id', $user['id']);
        return $req->execute();
    }

    public function updateAvatar(string $image, int $id)
    {
        $req = $this->db()->prepare("
            UPDATE users SET avatar = :avatar 
            WHERE id = :id
        ");
        $req->bindValue(':avatar', $image);
        $req->bindValue(':id', $id);
        return $req->execute();
    }
}