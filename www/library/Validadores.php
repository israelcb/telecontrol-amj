<?php

namespace library;

require_once 'library/core/AmjException/RequisicaoInvalidaException.php';

use library\core\amjException\RequisicaoInvalidaException;

abstract class Validadores {

    public const CampoVazio = 'campoVazio';
    public const CNPJNumerico = 'cnpjNumerico';
    public const CampoNumerico = 'campoNumerico';

    public static function call(string $nome_validador, string $chave_erro, $valor): void {

        if (self::$nome_validador($valor) === false) {

            throw new RequisicaoInvalidaException($chave_erro);
        }
    }

    protected static function campoVazio($campo): bool {

        return !empty($campo);
    }
    
    protected static function cnpjNumerico(string $cnpj): bool {
    
        return preg_match('/^[0-9]{12,14}$/', $cnpj);
    }

    protected static function campoNumerico(string $campo): bool {

        return preg_match('/^[0-9]*$/', $campo);
    }
}