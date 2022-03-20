<?php

class FolderController extends Controller
{
    public function fetch($data): void
    {
        $folderModel = new FolderModel();
        $allLinks = $folderModel->getLinks();

        // Org
        $home = ['*'];
        if (!empty($data) && $data[array_key_last($data)] === '') {
            unset($data[array_key_last($data)]); // Erases last element '' when url ends on '/'
        }
        $_SESSION['breadcrumb'] = empty($data) ? $home : $data;

        // Reorder
        $folderList = $linkList = [];
        foreach ($allLinks as $link) {
            // Forbidden chars: #, *, ?, &
            if ($link['org'] === implode('/', $_SESSION['breadcrumb']) . '/#'){
                $folderList[] = $link;
            } else if ($link['org'] === implode('/', $_SESSION['breadcrumb'])) {
                $linkList[] = $link;
            }
        }
        // Merge folders and links
        $settings['content'] = array_merge($folderList, $linkList);

        $view = new View();
        $view->load('layout', $settings);
    }

    public function create($data): void
    {
        // Ajax call on '/create'
        if (!isset($data['newLink']) && !isset($data['newFolder'])) {
            $result['errors'] = 'A problem occurred while fetching the form';
            exit(json_encode($result));
        }

        // Complete newLink data (Add image if not given) (ratio 16:9)
        if (isset($data['newLink'])) {
            if ($data['newLink']['img'] === '') {
                $data['newLink']['img'] = 'https://s0.wordpress.com/mshots/v1/' . urlencode($data['newLink']['url']) . '?w=320&h=180';
            }
            $fullData = $data['newLink'];
        }
        // Complete newFolder data
        if (isset($data['newFolder'])) {
            $data['newFolder']['url'] = '/folder/' . implode('/', $_SESSION['breadcrumb']) . '/' . $data['newFolder']['title'];
            $data['newFolder']['img'] = 'assets/images/folder.png';
            $data['newFolder']['org'] = implode('/', $_SESSION['breadcrumb']) . '/#';
            $fullData = $data['newFolder'];
        }

        // Insert data in table
        if (!isset($fullData)) {
            exit(json_encode(['errors' => 'Form not found']));
        }
        $folderModel = new FolderModel();
        $result = $folderModel->create($fullData);

        if ($result) {
            $content['success'] = true;
        } else {
            $content['errors'] = 'A problem occurred saving data. Please check error log';
        }
        exit(json_encode($content));
    }

    public function edit($data): void
    {
        var_dump($data);
    }

    public function delete($data): void
    {
        var_dump($data);
    }
}