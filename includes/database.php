<?php 

function getConnection() {

$hostname = 'localhost';

$username = 'root';

$password= '';

$database = 'clarke_jake_php_listing_pages';

$port = 3306;

return mysqli_connect($hostname, $username, $password, $database, $port);

}

?>