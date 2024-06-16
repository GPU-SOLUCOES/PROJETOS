<?php
$servername = "localhost";
$username = "administrador";
$password = "senha_administrador";
$dbname = "estacionamento";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
