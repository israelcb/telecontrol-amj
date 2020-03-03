<?php

namespace library\core;

require_once 'library/core/Controller/ViewRenderer.php';
use library\core\controller\ViewRenderer;

class Controller {

    private $_view;

    function __construct() {
        
        $this->_view = new ViewRenderer();
    }

    public function getView(): ViewRenderer {

        return $this->_view;
    }
}