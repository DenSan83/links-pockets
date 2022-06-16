<?php

class UserController extends Controller
{
    private UserModel $userModel;

    public function __construct()
    {
        $this->userModel = new UserModel();
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
                    if (isset($_SESSION['user_data'])) {
                        $this->notify('success', 'The new user ' . $_POST['user']['name'] . ' has been added successfully to database');
                    } else {
                        $this->login($_POST['user']['email'], $_POST['user']['pw']);
                    }
                    $this->redirect('/');
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
        $view->load('profile', $settings);
    }

    public function getProfile()
    {
        $settings = [];
        if (!empty($_SESSION['user_data'])) {
            $settings['user'] = $_SESSION['user_data'];
        }

        if (isset($_POST['user'])) {
            if (empty($_POST['user']['pw']) && empty($_POST['user']['pw2'])) {
                $check['same'] = $check['passed'] = $check['length'] = $check['upper'] = $check['lower'] = $check['number'] = true;
            } else {
                $check = $this->verifyPassword($_POST['user']['pw']);
                $check['same'] = $_POST['user']['pw'] === $_POST['user']['pw2'];
            }
            $check['update'] = true;
            $check['no_exist'] = !$this->userModel->checkExistingUser($_POST['user']['email'], $_POST['user']['id']);

            if ($check['passed'] && $check['same'] && $check['no_exist']) {
                if (!empty($_POST['user']['pw']) && !empty($_POST['user']['pw2'])) {
                    // hash password
                    $_POST['user']['hash'] = password_hash($_POST['user']['pw'],PASSWORD_DEFAULT, ['cost' => 12]);
                }

                // Update user
                if ($this->userModel->updateUser($_POST['user'])) {
                    $_SESSION['user_data']->setName($_POST['user']['name']);
                    $_SESSION['user_data']->setEmail($_POST['user']['email']);
                    $this->notify('success', 'Profile updated successfully');
                    $this->redirect('/profile');
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
        }

        if (isset($_FILES['photo-upload']) && is_uploaded_file($_FILES['photo-upload']['tmp_name'])) {
            $uploadResult = $this->upload($_FILES['photo-upload']);
            if ($uploadResult === 'success') {
                // update user & session
                $this->userModel->updateAvatar($_FILES['photo-upload']['name'], $_SESSION['user_data']->getId());
                $_SESSION['user_data']->setAvatar($_FILES['photo-upload']['name']);

                $this->notify('success', 'Profile avatar updated successfully');
                $this->redirect('/profile');
            } else {
                $settings['errors'][] = $uploadResult;
            }
        }

        $view = new View();
        $view->load('profile', $settings);
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

    private function login(string $email = '', string $pw = ''): bool
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

    private function upload(array $file)
    {
        $fileInfo = pathinfo($file['name']);
        $acceptedFormats = ['jpg', 'jpeg', 'png', 'gif', 'bmp'];
        if (!in_array($fileInfo['extension'], $acceptedFormats)) {
            return 'File format not accepted';
        }
        $uploadDir = 'assets'.DIRECTORY_SEPARATOR.'images'.DIRECTORY_SEPARATOR.'uploads'.DIRECTORY_SEPARATOR.$_SESSION['user_data']->getId() . DIRECTORY_SEPARATOR;
        if (!is_dir($uploadDir)) {
            if (!mkdir($uploadDir, 077, true)) {
                return 'Impossible to create necessary folders. Please verify the app rights.';
            }
        }

        $fileName = $fileInfo['filename'] . '.' . $fileInfo['extension'];
        if (move_uploaded_file($file['tmp_name'], $uploadDir . $fileName)) {
            return 'success';
        } else {
            return 'Failed to upload image';
        }
    }
}