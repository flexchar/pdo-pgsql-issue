<?php
$dsn = 'pgsql:host=host.docker.internal;port=5430;dbname=testdb';
try {
    $pdo = new PDO($dsn, 'postgres', 'password');
    echo "Connected successfully";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}