<?php

namespace library\core;

abstract class DB extends \PDO {

    function __construct() {

        try {
            
            parent::__construct(
                'pgsql' .
                ':host=' . SGBD_HOST .
                ';dbname=' . SGBD_DATABASE .
                ';user=' . SGBD_USER .
                ';password=' . SGBD_PASS
            );
            $this->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        }
        catch (\PDOException $e) {

            echo 'ERRO DE CONEXÃO COM O BANCO:';
            echo '<pre>';
            var_dump($e);
            echo '</pre>';
            exit;
        }
        
    }
}