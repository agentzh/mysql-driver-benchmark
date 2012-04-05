<?php

$nodes = array(
    "10.211.162.185",
    "10.211.93.139",
    "10.192.15.221",
    "10.210.187.58"
);

$i = rand(0, count($nodes) - 1);
#echo $i;

$link = mysql_connect($nodes[$i], 'ngx_test', 'ngx_test')
    or die('Could not connect: ' . mysql_error());
#echo 'Connected successfully';
mysql_select_db('world') or die('Could not select database');

// Performing SQL query
// $query = 'SELECT sleep(1)';
$query = "select * from City order by ID limit 1";
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

$lines = array();
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    array_push($lines, $line);
}

echo json_encode($lines) ?>

