<?php

namespace library\core\controller;

require_once 'library/core/AmjException.php';
require_once 'library/Respostas.php';

use library\core\AmjException;
use library\Respostas;

class ErrorHandler {

    private $_error;
    private $_errorChecks = [];

    private const ForeignKeyViolation = 23503;
    private const UniqueViolation = 23505;

    public function setError(\Exception $e): ErrorHandler {

        $this->_error = $e;
        return $this;
    }

    public function handle(): void {

        if (!$this->_error) return;

        try {

            foreach ($this->_errorChecks as [ $code, $handle ]) {
    
                if ($this->_error->getCode() == $code)
                    Respostas::call($handle);
            }
        }
        catch (AmjException $e) {

            http_response_code($e->getCode());
            die('{ "erro": "' . $e->getChaveErro() . '" }');
        }
    }

    public function onUniqueViolation(string $tratamentoErro): ErrorHandler {

        array_push($this->_errorChecks, [self::UniqueViolation, $tratamentoErro]);
        return $this;
    }

    public function onForeignKeyViolation(string $tratamentoErro): ErrorHandler {

        array_push($this->_errorChecks, [self::ForeignKeyViolation, $tratamentoErro]);
        return $this;
    }
}