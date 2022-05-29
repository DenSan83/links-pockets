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
        if (!isset($_SESSION['user_data']) || !$_SESSION['user_data'] instanceof User) {
            $result['errors'] = 'User is not connected';
            exit(json_encode($result));
        }

        // Link screenshot check
        if (isset($data['newLink'])) {
            $data['newLink']['img'] = $this->addScreenshot($data['newLink']['img'], $data['newLink']['url']);
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

    public function findId($data): void
    {
        // Ajax call on '/find-id'
        if (!isset($data['id'])) {
            $return['errors'] = 'Data not found';
            exit(json_encode($return));
        }
        if (!isset($_SESSION['user_data']) || !$_SESSION['user_data'] instanceof User) {
            $return['errors'] = 'User is not connected';
            exit(json_encode($return));
        }
        $result = $this->getOneOfMine($data['id']);

        $return = [
            'success' => true,
            'data' => $result
        ];
        exit(json_encode($return));
    }

    public function edit(array $data): void
    {
        // Screenshot check
        if (isset($data['editLink'])) {
            $data['editLink']['img'] = $this->addScreenshot($data['editLink']['img'], $data['newLink']['url']);
        }
        $result = $this->getOneOfMine($data['editLink']['id']);

        $return = [
            'success' => true,
            'data' => $result
        ];

        exit(json_encode($return));
    }

    public function delete($data): void
    {
        var_dump($data);
    }

    private function getOneOfMine(int $id)
    {
        $folderModel = new FolderModel();
        $data = $folderModel->findOne($id);
        if (is_null($data) ) {
            $return['errors'] = 'Data not found';
            exit(json_encode($return));
        }
        if ($_SESSION['user_data']->getId() !== (int) $data['user_id']) {
            $return['errors'] = 'Permission not allowed';
            exit(json_encode($return));
        }

        return $data;
    }

    private function addScreenshot(string $img, string $url) 
    {
        //(Add image if not given) (ratio 16:9)
        if ($img === '') { 
            // Can I get image from youtube ?
            if (preg_match('/(youtube|youtu\.be)/', $url) === 1) {
                if (!str_contains($url, '/user/') && !str_contains($url, '/embed/') && !str_contains($url, '-nocookie')) {
                    $metas = get_meta_tags($url);
                    if (!empty($metas['twitter:image'])) {
                        $img = $metas['twitter:image'];
                    }
                }
            }

            // Screenshot API
            if ($img === '') {
                $img = 'https://s0.wordpress.com/mshots/v1/' . urlencode($url) . '?w=320&h=180';
            }
        }
        return $img;
    }

}