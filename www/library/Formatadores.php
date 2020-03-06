<?php

namespace library;

abstract class Formatadores {

    public const LimparCNPJ = 'limparCnpj';

    public static function call(string $nome_formatador, &$valor): void {

        $valor = self::$nome_formatador($valor);
    }

    protected static function limparCnpj(string $cnpj): string {

        return preg_replace('/[\/\.-]/', '', $cnpj);
    }
}