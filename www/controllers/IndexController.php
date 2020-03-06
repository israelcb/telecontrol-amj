<?php

namespace controllers;

require_once 'models/Fornecedor.php';
require_once 'library/core/Controller.php';
use library\core\Controller;
use models\Fornecedor;

class IndexController extends Controller {

    public function indexAction(): void {

        $this->getViewRenderer()->fornecedores = (new Fornecedor())->selectAll();
    }
}