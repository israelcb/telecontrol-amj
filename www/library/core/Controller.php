<?php

namespace library\core;

require_once 'library/core/Controller/Filters.php';
require_once 'library/core/Controller/Params.php';
require_once 'library/core/Controller/ErrorHandler.php';
require_once 'library/core/Controller/ViewRenderer.php';

use library\core\controller\Filters;
use library\core\controller\Params;
use library\core\controller\ErrorHandler;
use library\core\controller\ViewRenderer;

class Controller {

    private $_params;
    private $_filters;
    private $_error_handler;
    private $_view_renderer;

    function __construct() {
        
        $this->_params = new Params();
        $this->_filters = new Filters();
        $this->_error_handler = new ErrorHandler();
        $this->_view_renderer = new ViewRenderer();
    }

    public function getParams(): Params {

        return $this->_params;
    }

    public function getErrorHandler(): ErrorHandler {

        return $this->_error_handler;
    }

    public function getViewRenderer(): ViewRenderer {

        return $this->_view_renderer;
    }

    public function setParamsHash(array $params_hash): void {

        $this->_params->setParamsHash($params_hash);
    }

    public function setFiltersHash(array $filters_hash): void {

        $this->_filters->setFiltersHash($filters_hash);
    }
}