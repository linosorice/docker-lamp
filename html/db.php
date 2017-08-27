<?php
$dsn = 'mysql:dbname=phpapp;host=db';
$user = 'root';
$password = 'phpapptest';

try {
    $dbh = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}