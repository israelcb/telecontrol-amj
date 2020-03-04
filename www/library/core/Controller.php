<?php

namespace library\core;

require_once 'library/core/Controller/ViewRenderer.php';
use library\core\controller\ViewRenderer;

class Controller {

    protected $view;

    function __construct() {
        
        $this->view = new ViewRenderer();
    }

    public function getView(): ViewRenderer {

        return $this->view;
    }
}