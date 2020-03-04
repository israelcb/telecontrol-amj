<?php

namespace models;

require_once "library/core/DB.php";
require_once "library/DBUtils.php";
use library\core\DB;
use library\DBUtils;

class Fornecedor extends DB {

    public function selectAll() {

        return $this->query("
            SELECT
                *,
                " . DBUtils::formataCnpj('fornec.cnpj') . " as cnpj,
                COALESCE((
                    SELECT
                        COUNT(*)
                    FROM
                        erp.contrato
                    WHERE
                        id_fornecedor = fornec.id_fornecedor
                ), 0) as numero_contratos
            FROM
                erp.fornecedor fornec
        ")->fetchAll(\PDO::FETCH_ASSOC);
    }
}