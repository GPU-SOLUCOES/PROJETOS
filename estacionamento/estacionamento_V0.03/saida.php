<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $placa = $_POST['placa'];
    $sql = "UPDATE veiculos SET data_saida = NOW() WHERE placa = '$placa' AND data_saida IS NULL";
    if ($conn->query($sql) === TRUE) {
        echo "Veículo saiu com sucesso!";
    } else {
        echo "Erro: " . $conn->error;
    }
}
?>
