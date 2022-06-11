<?php

class UserController extends Controller
{
    private UserModel $userModel;

    public function __construct()
    {
        $this->userModel = new UserModel();
    }

    public function countUsers(): int
    {
        return $this->userModel->countUsers();
    }

    public function createUser()
    {
        // Route '/new-user'
        $settings = [];
        if (isset($_POST['user'])) {
            if ($_POST['user']['pw'] === $_POST['user']['pw2']) {

                if (!$this->userModel->checkExistingUser($_POST['user']['name'])) {
                    $_POST['user']['hash'] = password_hash($_POST['user']['pw'],PASSWORD_DEFAULT, ['cost' => 12]);

                    if ($this->userModel->createUser($_POST['user'])) {
                        if ($this->login($_POST['user']['name'], $_POST['user']['pw'])) {
                            $this->redirect('/');
                        }
                    }
                } else {
                    $settings['error'] = 'This user already exist';
                }
            } else {
                $settings['error'] = 'Passwords don\'t match';
            }

            $settings['user'] = $_POST['user'];
        }
        $view = new View();
        $view->load('new_user', $settings);
    }

    public function loginPage(): void
    {
        // Route '/login'
        $settings = [];
        if (isset($_POST['user'])) {

            if ($this->userModel->checkExistingUser($_POST['user']['name'])) {
                if ($this->login($_POST['user']['name'], $_POST['user']['pw'])) {
                    $this->redirect('/');
                } else {
                    $settings['error'] = 'Incorrect user or password';
                }
            } else {
                $settings['error'] = 'Incorrect user or password';
            }
        }

        $view = new View();
        $view->load('login', $settings);
    }

    public function login(string $name = '', string $pw = ''): bool
    {
        if (password_verify($pw, $this->userModel->getHashFromUser($name))) {
            $_SESSION['user_data'] = $this->userModel->getUserFromName($name);
            return true;
        }

        return false;
    }

    public function logout(): void
    {
        session_destroy();
        $this->redirect('/');
    }
}