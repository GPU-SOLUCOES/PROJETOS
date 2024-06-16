<?php
$servername = "localhost";
$username = "administrador";
$password = "senha_administrador";
$dbname = "estacionamento";

// Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}
?>
