<?php

namespace library\core\controller;

class ErrorHandler {

    private $_error;
    private $_errorChecks = [];

    private const ForeignKeyViolation = 23503;
    private const UniqueViolation = 23505;

    public function setError(\Exception $e): ErrorHandler {

        $this->_error = $e;
        return $this;
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