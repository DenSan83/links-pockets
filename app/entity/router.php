<?php

class Router
{
    private string $request;

    private array $routes = [
            'home' => [
                'controller' => 'Controller',
                'method' => 'init'
            ]
        ];

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function getRoute(): string
    {
        $elements = explode('/',$this->request);
        return $elements[0];
    }

    public function getParams(): array
    {
        return [];
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