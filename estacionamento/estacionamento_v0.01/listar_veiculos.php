<?php
session_start();
header('Content-Type: application/json');

$conn = new mysqli("localhost", "root", "", "estacionamento");

if ($conn->connect_error) {
    die(json_encode(['success' => false, 'message' => 'Falha na conexão com o banco de dados.']));
}

$result = $conn->query("SELECT placa, tipo, plano FROM veiculos WHERE saida IS NULL");

$veiculos = [];

while ($row = $result->fetch_assoc()) {
    $veiculos[] = $row;
}

echo json_encode($veiculos);

$conn->close();
?>
