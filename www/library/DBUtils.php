<?php

namespace library;

abstract class DBUtils {

    public static function formataCnpj(string $nome_campo_cnpj): string {

        return "regexp_replace((
            CASE
                WHEN LENGTH($nome_campo_cnpj) = 12 THEN REGEXP_REPLACE($nome_campo_cnpj, E'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})', '\\1.\\2.\\3/\\4')
                ELSE REGEXP_REPLACE($nome_campo_cnpj, E'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})', '\\1.\\2.\\3/\\4-\\5')
            END
        ), E'[\\n\\r\\f\\u000B\\u0085\\u2028\\u2029]+', ' ', 'g' )";
    }
}