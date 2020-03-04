<?php

namespace library\core;

class App {

    private $_controller;
    private $_action;
    private $_params;
    private $_filtros;

    function __construct() {

        $path = explode('/', $_REQUEST['url'] ?? '');
        $this->_controller = array_shift($path);
        $this->_action = array_shift($path);

        $this->_params = $_POST;
        while (count($path) > 0)
            $this->_params[array_shift($path)] = array_shift($path);

        $this->_filtros = $_GET;
        unset($this->_filtros['url']);
    }

    public function getController(): string {

        return $this->_controller ? $this->_controller : 'index';
    }

    public function getAction(): string {

        return $this->_action ? $this->_action : 'index';
    }

    public function getParams(): array {

        return $this->_params;
    }

    public function getFiltros(): array {

        return $this->_filtros;
    }

    public function run(): void {

        $nome_controller = ucfirst($this->getController()) . 'Controller';
        $caminho_controller = 'controllers/' . $nome_controller . '.php';
        if (!file_exists($caminho_controller)) die('404!');

        require_once $caminho_controller;
        $nome_controller = 'controllers\\' . $nome_controller;
        $instancia_controller = new $nome_controller($this);
        $nome_action = strtolower($this->getAction()) . 'Action';
        if (!method_exists($instancia_controller, $nome_action)) die('404!');

        $instancia_controller->$nome_action();
        
        $caminho_view = 'views/' . $this->getController() . '/' . $this->getAction() . '.phtml';
        if (!file_exists($caminho_view)) die('404!');

        $instancia_controller->getView()->render($caminho_view);
    }
}