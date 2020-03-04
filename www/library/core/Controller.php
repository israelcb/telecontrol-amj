<?php

namespace library\core;

require_once 'library/core/Controller/ViewRenderer.php';
use library\core\controller\ViewRenderer;

class Controller {

    private $_app;
    protected $view;

    function __construct(App $app) {
        
        $this->_app = $app;
        $this->view = new ViewRenderer();
    }

    public function getApp(): App {

        return $this->_app;
    }

    public function getView(): ViewRenderer {

        return $this->view;
    }
}