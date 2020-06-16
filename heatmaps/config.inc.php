<?php
error_reporting(E_ALL);
ini_set("memory_limit", "1024M");
ini_set("max_execution_time", "0");

define('DB_HOST',	'localhost');
define('DB_USER',	'');
define('DB_PASS',	'');
define('DB_NAME',	'');
define('HLXCE_WEB',	'/var/www/html/web/');
define('HUD_URL',	'https://hlstatsx.com');
define('OUTPUT_SIZE',	'large');

define('DB_PREFIX',	'hlstats');
define('KILL_LIMIT',	50000);
define('DEBUG', 1);

// No need to change this unless you are on really low disk.
define('CACHE_DIR',	dirname(__FILE__) . '/cache');

