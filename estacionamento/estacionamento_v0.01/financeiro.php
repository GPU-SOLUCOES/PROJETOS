<?php
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit();
}

// Verificar se o usuário tem permissão de financeiro ou administrador
if ($_SESSION['user']['role'] !== 'financeiro' && $_SESSION['user']['role'] !== 'admin') {
    header("Location: dashboard.php");
    exit();
}

// Conexão com o banco de dados
$conn = new mysqli("localhost", "root", "", "estacionamento");

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Obter dados financeiros do banco de dados
// ...

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Financeiro</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- Menu de navegação -->
    <nav class="menu">
        <a href="dashboard.php">Home</a>
        <a href="admin.php">Administração</a>
        <a href="financeiro.php">Financeiro</a>
        <a href="logout.php">Sair</a>
    </nav>

    <h1>Financeiro</h1>

    <h2>Resumo Financeiro</h2>
    <!-- Adicionar gráficos aqui -->
    <canvas id="financeChart" width="400" height="200"></canvas>

    <script>
        var ctx = document.getElementById('financeChart').getContext('2d');
        var financeChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho'],
                datasets: [{
                    label: 'Receitas',
                    data: [1200, 1500, 1700, 1400, 1800, 1600],
                    backgroundColor: 'rgba(0, 123, 255, 0.2)',
                    borderColor: 'rgba(0, 123, 255, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

</body>
</html>
