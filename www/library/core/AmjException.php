<?php

namespace library\core;

class AmjException extends \Exception {

    private const ErroPadrao = 'erro_interno';

    protected $chave_erro;

    public function getChaveErro(): string {

        return $this->chave_erro ?? self::ErroPadrao;
    }
}