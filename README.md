extension=php_pgsql.dll
extension=php_pdo_pgsql.dll

RewriteRule ^www/(.*)$ www/index.php?url=$1 [QSA,L]