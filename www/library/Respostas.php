<?php

namespace library;

require_once 'library/core/amjException/ConflitoException.php';

use library\core\amjException\ConflitoException;

abstract class Respostas {

    public const Conflito = 'conflito';

    public static function call(string $nome_resposta): void {

        self::$nome_resposta();
    }

    protected static function conflito(): void {

        throw new ConflitoException();
    }
}