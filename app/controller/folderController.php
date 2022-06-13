<?php

class FolderController extends Controller
{
    private FolderModel $folderModel;

    public function __construct()
    {
        $this->folderModel = new FolderModel();
    }

    public function fetch($data): void
    {
        $allLinks = $this->folderModel->getLinks();

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
            } else if ($link['org'] === implode('/', $_SESSION['breadcrumb']) || $link['org'] === implode('/', $_SESSION['breadcrumb']) . '/') {
                $linkList[] = $link;
            }
        }
        // Merge folders and links
        $settings['content'] = array_merge($folderList, $linkList);

        $view = new View();
        $view->load('main', $settings);
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
            $data['newFolder']['url'] = implode('/', $_SESSION['breadcrumb']) . '/' . $data['newFolder']['title'];
            $data['newFolder']['img'] = 'assets/images/folder.png';
            $data['newFolder']['org'] = implode('/', $_SESSION['breadcrumb']) . '/#';
            $fullData = $data['newFolder'];
        }

        // Insert data in table
        if (!isset($fullData)) {
            exit(json_encode(['errors' => 'Form not found']));
        }
        $result = $this->folderModel->create($fullData);

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
        // Link screenshot check
        if (isset($data['editLink'])) {
            $data['editLink']['img'] = $this->addScreenshot($data['editLink']['img'], $data['editLink']['url']);
            $fullData = $data['editLink'];
        }
        // Complete folder data
        if (isset($data['editFolder'])) {
            $data['editFolder']['img'] = 'assets/images/folder.png';
            $fullData = $data['editFolder'];
        }

        if (!isset($fullData)) {
            exit(json_encode(['errors' => 'Form not found']));
        }

        $this->getOneOfMine($fullData['id']);
        $result = $this->folderModel->edit($fullData);

        $return = [
            'success' => true,
            'data' => $result
        ];

        exit(json_encode($return));
    }

    public function delete($data): void
    {
        if (!isset($data['delete'])) {
            exit(json_encode(['errors' => 'Form not found']));
        }
        $found = $this->getOneOfMine($data['delete']['id']);
        $result = $this->folderModel->delete($found['id']);

        $this->notify('success',
    '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="me-1 mb-1 bi bi-trash3" viewBox="0 0 16 16">
                <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"></path>
                </svg>Element #' . $found['id'] . ' has been deleted');

        $return = [
            'deleted' => true,
            'data' => $result,
            'found' => $data
        ];
        exit(json_encode($return));
    }

    public function search()
    {
        $content = [];
        if (!empty($_GET['keyword'])) {
            $content = $this->folderModel->search($_GET['keyword']);
        }

        $view = new View();
        $view->load('search', [
            'content' => $content,
            'keyword' => $_GET['keyword']
        ]);
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