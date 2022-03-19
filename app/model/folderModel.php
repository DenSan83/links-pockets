<?php

class FolderModel extends Model
{
    public function getLinks(): array
    {
        $db = $this->db();
        $req = $db->prepare('SELECT * FROM links WHERE user_id = :user_id ORDER BY id');
        $req->bindValue(':user_id', $_SESSION['user_data']->getId());
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    }

    public function create($data): bool
    {
        $db = $this->db();
        $req = $db->prepare('
            INSERT INTO links (user_id, title, url, description, img, org, created_at) 
            VALUES (:user_id, :title, :url, :description, :img, :org, NOW())
        ');
        $req->bindValue(':user_id', $_SESSION['user_data']->getId());
        $req->bindValue(':title', $data['title']);
        $req->bindValue(':url', $data['url']);
        $req->bindValue(':description', $data['description']);
        $req->bindValue(':img', $data['img']);
        $req->bindValue(':org', $data['org']);

        try {
            $req->execute();
            return true;
        } catch (Exception $e) {
            $this->errorLog($e);
            return false;
        }
    }
}