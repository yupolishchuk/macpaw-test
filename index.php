<?php

//ignore favicon request
if (strpos($_SERVER['REQUEST_URI'],'favicon.ico')) {
    die();
}

define('PATH_ROOT', __DIR__ . '/');

require_once PATH_ROOT . 'src/autoload.php';
$abTests = require_once PATH_ROOT . 'src/abTests.php';

/* To refresh test case uncomment */
//(new src\Cookie('ab_test'))->unset();

echo (new src\AbTest('60/40', $abTests, new src\Cookie('ab_test')))->getCase();
