<?php

ini_set('display_erros', 1);
error_reporting(E_ALL);

require_once './config/environment.php';
require_once './library/core/App.php';

use library\core\App;
$app = new App();
$app->run();