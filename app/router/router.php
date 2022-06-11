<?php

class Router
{
    private string $request;
    private array $routes = [];

    public function __construct($request)
    {
        if (empty($this->routes)) {
            $routesJson = file_get_contents('app/router/routes.json');
            $this->routes = json_decode($routesJson, true);
        }
        $this->request = $request;
    }

    public function getRoute(): string
    {
        $elements = explode('/',$this->request);
        return $elements[0];
    }

    public function getParams(): array
    {
        // extract $_GET params :
        $params = explode('/',$this->request);
        unset($params[0]);

        // extract $_POST params :
        if($_POST) {
            foreach($_POST as $key => $val) {
                $params[$key] = $val;
            }
        }
        return $params;
    }

    public function getController(): void
    {
        $route = $this->getRoute();
        $params = $this->getParams();

        if (key_exists($route,$this->routes)) {
            $controller  = $this->routes[$route]['controller'];
            $method      = $this->routes[$route]['method'];

            $currentController = new $controller();
            $currentController->$method($params);

        } else {
            echo '404: not found';
        }
    }
}