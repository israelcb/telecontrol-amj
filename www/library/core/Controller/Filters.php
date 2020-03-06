<?php

namespace library\core\controller;

class Filters {

    private $_filters_hash;

    public function setFiltersHash(array $filters_hash): void {

        $this->_filters_hash = $filters_hash;
    }
}