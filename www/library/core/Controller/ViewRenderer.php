<?php

namespace library\core\controller;

class ViewRenderer {

    function render(string $caminho_view) :void {

        require_once 'templates/base_layout.phtml';
        require_once $caminho_view;
    }
}