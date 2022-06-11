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
        $settings['user_count'] = $this->userModel->countUsers();
        if (isset($_POST['user'])) {
            $check = $this->verifyPassword($_POST['user']['pw']);
            $check['update'] = true;
            $check['no_exist'] = !$this->userModel->checkExistingUser($_POST['user']['email']);
            $check['same'] = $_POST['user']['pw'] === $_POST['user']['pw2'];

            if ($check['passed'] && $check['same'] && $check['no_exist']) {
                // hash password
                $_POST['user']['hash'] = password_hash($_POST['user']['pw'],PASSWORD_DEFAULT, ['cost' => 12]);

                // Create user
                if ($this->userModel->createUser($_POST['user'])) {
                    if ($this->login($_POST['user']['email'], $_POST['user']['pw'])) {
                        $this->redirect('/');
                    }
                }
            } else {
                // Prepare errors return
                $settings['pwCheck'] = $check;
                if (!$check['no_exist']) {
                    $settings['errors'][] = 'This user email already exists';
                }
                if (!$check['same']) {
                    $settings['errors'][] = 'Passwords don\'t match';
                }

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

            if ($this->userModel->checkExistingUser($_POST['user']['email'])) {
                if ($this->login($_POST['user']['email'], $_POST['user']['pw'])) {
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

    public function login(string $email = '', string $pw = ''): bool
    {
        if (password_verify($pw, $this->userModel->getHashFromEmail($email))) {
            $_SESSION['user_data'] = $this->userModel->getUserFromEmail($email);
            return true;
        }

        return false;
    }

    public function logout(): void
    {
        session_destroy();
        $this->redirect('/');
    }

    private function verifyPassword(string $pass): array
    {
        $eigChar = strlen($pass) >= 8; // Minimum 8 characters
        $upper = preg_match("/^(?=\S*[A-Z])\S*$/", $pass) === 1;
        $lower = preg_match("/^(?=\S*[a-z])\S*$/", $pass) === 1;
        $number = preg_match("/^(?=\S*[\d])\S*$/", $pass) === 1;

        return [
            'length' => $eigChar,
            'upper' => $upper,
            'lower' => $lower,
            'number' => $number,
            'passed' => $eigChar && $upper && $lower && $number
        ];
    }
}