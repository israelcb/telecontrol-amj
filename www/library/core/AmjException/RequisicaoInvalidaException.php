<?php

namespace library\core\amjException;

require_once 'library/core/amjException.php';

use library\core\AmjException;

class RequisicaoInvalidaException extends AmjException {

    function __construct(string $chave_erro) {
        
        parent::__construct();
        $this->code = 400;
        $this->chave_erro = $chave_erro;
    }
}