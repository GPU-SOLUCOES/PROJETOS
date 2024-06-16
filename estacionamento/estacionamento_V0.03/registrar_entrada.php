<?php
session_start();
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $placa = $data['placa'];
    $tipo = $data['tipo'];
    $plano = $data['plano'];

    $conn = new mysqli("localhost", "root", "", "estacionamento");

    if ($conn->connect_error) {
        die(json_encode(['success' => false, 'message' => 'Falha na conexão com o banco de dados.']));
    }

    $stmt = $conn->prepare("INSERT INTO veiculos (placa, tipo, plano) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $placa, $tipo, $plano);

    if ($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erro ao registrar a entrada.']);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Método não suportado.']);
}
?>
