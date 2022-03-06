<?php

class FolderModel extends Model
{
    public function getLinks(): array
    {
        $db = $this->db();
        $req = $db->prepare('SELECT * FROM links ORDER BY id');
        $req->execute();
        return $req->fetchAll(PDO::FETCH_ASSOC);
    }
}