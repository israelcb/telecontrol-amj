<?php

namespace library\core;

class App {

    private $_controller;
    private $_action;
    private $_params;
    private $_filters;

    function __construct() {

        $path = explode('/', $_REQUEST['url'] ?? '');
        $this->_controller = array_shift($path);
        $this->_action = array_shift($path);

        $this->_params = $_POST;
        while (count($path) > 0)
            $this->_params[array_shift($path)] = array_shift($path);

        $this->_filters = $_GET;
        unset($this->_filters['url']);
    }

    public function run(): void {

        $nome_controller = ucfirst($this->_getController()) . 'Controller';
        $caminho_controller = 'controllers/' . $nome_controller . '.php';
        if (!file_exists($caminho_controller)) die('404!');

        require_once $caminho_controller;
        $nome_controller = 'controllers\\' . $nome_controller;
        $instancia_controller = new $nome_controller($this);
        $nome_action = strtolower($this->_getAction()) . 'Action';
        if (!method_exists($instancia_controller, $nome_action)) die('404!');

        $instancia_controller->setParamsHash($this->_params);
        $instancia_controller->setFiltersHash($this->_filters);

        try {

            $instancia_controller->$nome_action();
            $instancia_controller->getErrorHandler()->handle();
        }
        catch(AmjException $e) {

            http_response_code($e->getCode());
            die('{ "erro": "' . $e->getChaveErro() . '" }');
        }
        
        $caminho_view = 'views/' . $this->_getController() . '/' . $this->_getAction() . '.phtml';

        if (!file_exists($caminho_view)) {

            http_response_code(200);
            die('{ "mensagem": "Sucesso!" }');
        }

        $instancia_controller->getViewRenderer()->render($caminho_view);
    }

    private function _getController(): string {

        return $this->_controller ? $this->_controller : 'index';
    }

    private function _getAction(): string {

        return $this->_action ? $this->_action : 'index';
    }
}