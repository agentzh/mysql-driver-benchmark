<?php
$link = mysql_connect('127.0.0.1', 'ngx_test', 'ngx_test')
    or die('Could not connect: ' . mysql_error());
#echo 'Connected successfully';
mysql_select_db('world') or die('Could not select database');

// Performing SQL query
$query = 'SELECT sleep(1)';
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

$lines = array();
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    array_push($lines, $line);
}

echo json_encode($lines) ?>

