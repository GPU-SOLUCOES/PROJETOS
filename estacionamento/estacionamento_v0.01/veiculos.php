<?php
include 'db.php';

$sql = "SELECT * FROM veiculos WHERE data_saida IS NULL";
$result = $conn->query($sql);

$veiculos = [];
while ($row = $result->fetch_assoc()) {
    $veiculos[] = $row;
}

echo json_encode($veiculos);
?>
