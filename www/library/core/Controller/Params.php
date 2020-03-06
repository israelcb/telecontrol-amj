<?php

namespace library\core\controller;

use library\Formatadores;
use library\Validadores;

class Params {

    private $_params_hash;
    private $_referencia_ultimo_valor;

    public function setParamsHash(array $params_hash): void {

        $this->_params_hash = $params_hash;
    }

    public function get(string &$valor): Params {

        $valor = filter_var($this->_params_hash[$valor] ?? '');
        $this->_referencia_ultimo_valor =& $valor;
        return $this;
    }

    public function formatar(string $formatador): Params {

        Formatadores::call($formatador, $this->_referencia_ultimo_valor);        
        return $this;
    }

    public function validar(string $validador, string $codigo_erro): Params {

        Validadores::call($validador, $codigo_erro, $this->_referencia_ultimo_valor);
        return $this;
    }
}