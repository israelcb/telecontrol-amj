<?php

namespace library\core\amjException;

require_once 'library/core/AmjException.php';

use library\core\AmjException;

class ConflitoException extends AmjException {

    function __construct() {
        
        parent::__construct();
        $this->code = 409;
        $this->chave_erro = 'conflito';
    }
}