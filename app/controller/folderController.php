<?php

class FolderController extends Controller
{
    public function init($data): void
    {
        $folderModel = new FolderModel();
        $allLinks = $folderModel->getLinks();

        // Org
        $home = '*/';
        if ($data[array_key_last($data)] === '') {
            unset($data[array_key_last($data)]); // Erases last element '' when url ends on '/'
        }
        $_SESSION['breadcrumb'] = empty($data) ? $home : $data;

        // Reorder
        $folderList = $linkList = [];
        foreach ($allLinks as $link) {
            // Forbidden chars: #, *, ?, &
            if ($link['org'] === $_SESSION['breadcrumb'] . '#'){
                $folderList[] = $link;
            } else if ($link['org'] === $_SESSION['breadcrumb']) {
                $linkList[] = $link;
            }
        }
        // Merge folders and links
        $settings['content'] = array_merge($folderList, $linkList);

        $view = new View();
        $view->load('layout', $settings);
    }
}