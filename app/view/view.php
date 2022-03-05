<?php
include_once './vendor/autoload.php';

class View {
    private object $twig;

    public function __construct(){
        $loader = new \Twig\Loader\FilesystemLoader(__DIR__);
        $this->twig = new \Twig\Environment($loader, [
            'cache' => false,
            'debug' =>true
        ]);
        $this->twig->addExtension(new \Twig\Extension\DebugExtension());

        return $this->twig;
    }

    public function load($page, $params = []): void
    {
        $file = "./app/view/$page.tpl";
        if(file_exists($file)){
            try {
                echo $this->twig->render("$page.tpl", $params);
            } catch (Exception $e) {
                include_once './app/model/model.php';
                $model = new Model();
                $model->errorLog($e);
            }
        } else {
            echo '404: not found';
        }
    }
}