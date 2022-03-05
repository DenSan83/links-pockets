<?php

class UserController extends Controller
{
    public function countUsers(): int
    {
        $model = new UserModel();
        return $model->countUsers();
    }

    public function createUser()
    {
        // Route '/new-user'
        $settings = [];
        if (isset($_POST['user'])) {
            if ($_POST['user']['pw'] === $_POST['user']['pw2']) {
                $userModel = new UserModel();
                if (!$userModel->checkExistingUser($_POST['user']['name'])) {
                    $_POST['user']['hash'] = password_hash($_POST['user']['pw'],PASSWORD_DEFAULT, ['cost' => 12]);

                    if ($userModel->createUser($_POST['user'])) {
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
            $userModel = new UserModel();
            if ($userModel->checkExistingUser($_POST['user']['name'])) {
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

    public function login(string $name, string $pw): bool
    {
        $userModel = new UserModel();
        $user = $userModel->getUserFromName($name);

        if (password_verify($pw, $user->getHash())) {
            $_SESSION['user_data'] = $user;
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