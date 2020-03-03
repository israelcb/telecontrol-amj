<?php

namespace library\core;

class App {

    private $_controller;
    private $_action;
    private $_params;
    private $_filtros;

    function __construct() {

        $path = explode('/', $_REQUEST['url']);
        $this->_controller = array_shift($path);
        $this->_action = array_shift($path);

        $this->_params = [];
        while (count($path) > 0)
            $this->_params[array_shift($path)] = array_shift($path);

        $this->_filtros = $_REQUEST;
        unset($this->_filtros['url']);
    }

    public function getController(): string {

        return $this->_controller;
    }

    public function getAction(): string {

        return $this->_action;
    }

    public function getParams(): array {

        return $this->_params;
    }

    public function getFiltros(): array {

        return $this->_filtros;
    }

    public function run(): void {


    }
}