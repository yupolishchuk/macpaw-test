<?php

spl_autoload_register(function ($className) {
    $file = str_replace("\\", "/", $className) . '.php';
    if (is_readable($file)) {
        include $file;
    }
});