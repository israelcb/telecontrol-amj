<?php

namespace library\core\controller;

class ViewRenderer {

    function render(string $caminho_view) :void {

        require_once $caminho_view;
    }
}