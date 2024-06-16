<?php
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit();
}

include 'db.php';

// Função para validar e executar consultas SQL personalizadas
function executarConsulta($conn, $consulta) {
    if (preg_match('/^\s*SELECT/i', $consulta)) {
        return $conn->query($consulta);
    } else {
        return false;
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['consulta_personalizada'])) {
    $consulta = $_POST['consulta_sql'];
    $resultado = executarConsulta($conn, $consulta);
}

// Fetch data for financial dashboard
$veiculos_patio = $conn->query("SELECT * FROM veiculos WHERE saida IS NULL");
$veiculos_count = $veiculos_patio->num_rows;
$receita_diaria = $conn->query("SELECT SUM(valor_pago) AS receita FROM veiculos WHERE DATE(entrada) = CURDATE()")->fetch_assoc()['receita'];
$receita_mensal = $conn->query("SELECT SUM(valor_pago) AS receita FROM veiculos WHERE MONTH(entrada) = MONTH(CURDATE())")->fetch_assoc()['receita'];

$entradas_saidas = $conn->query("SELECT * FROM entradas_saidas");
$pagamentos = $conn->query("SELECT * FROM pagamentos");
$relatorios = $conn->query("SELECT * FROM relatorios_personalizados");
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
    
    <h1>Relatórios Financeiros</h1>
    <a href="logout.php">Logout</a>
    
    <div class="dashboard-container">
        <!-- Widget: Total de Veículos no Pátio -->
        <div class="widget">
            <h2>Total de Veículos no Pátio</h2>
            <p><?php echo $veiculos_count; ?></p>
        </div>
        <!-- Widget: Receita Diária -->
        <div class="widget">
            <h2>Receita Diária</h2>
            <p>R$ <?php echo number_format($receita_diaria, 2, ',', '.'); ?></p>
        </div>
        <!-- Widget: Receita Mensal -->
        <div class="widget">
            <h2>Receita Mensal</h2>
            <p>R$ <?php echo number_format($receita_mensal, 2, ',', '.'); ?></p>
        </div>
    </div>

    <div class="charts-container">
        <!-- Gráfico de Barras: Receita Mensal -->
        <canvas id="receitaMensalChart"></canvas>
    </div>

    <h2>Entradas e Saídas</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Placa</th>
                <th>Tipo</th>
                <th>Hora de Entrada</th>
                <th>Hora de Saída</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($registro = $entradas_saidas->fetch_assoc()): ?>
            <tr>
                <td><?php echo $registro['id']; ?></td>
                <td><?php echo $registro['placa']; ?></td>
                <td><?php echo $registro['tipo']; ?></td>
                <td><?php echo $registro['hora_entrada']; ?></td>
                <td><?php echo $registro['hora_saida']; ?></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <h2>Pagamentos</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Placa</th>
                <th>Valor</th>
                <th>Data</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($pagamento = $pagamentos->fetch_assoc()): ?>
            <tr>
                <td><?php echo $pagamento['id']; ?></td>
                <td><?php echo $pagamento['placa']; ?></td>
                <td>R$ <?php echo number_format($pagamento['valor'], 2, ',', '.'); ?></td>
                <td><?php echo $pagamento['data']; ?></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <h2>Relatórios Personalizados</h2>
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($relatorio = $relatorios->fetch_assoc()): ?>
            <tr>
                <td><?php echo $relatorio['nome']; ?></td>
                <td><?php echo $relatorio['descricao']; ?></td>
                <td><a href="visualizar_relatorio.php?id=<?php echo $relatorio['id']; ?>">Visualizar</a> | <a href="exportar_relatorio.php?id=<?php echo $relatorio['id']; ?>">Exportar como PDF</a></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <h2>Consulta SQL Personalizada</h2>
    <form method="post">
        <textarea name="consulta_sql" rows="4" cols="50" placeholder="Digite sua consulta SQL aqui"></textarea>
        <button type="submit" name="consulta_personalizada">Executar Consulta</button>
    </form>

    <?php if (isset($resultado) && $resultado): ?>
        <h2>Resultado da Consulta</h2>
        <table>
            <thead>
                <tr>
                    <?php
                    $fields = $resultado->fetch_fields();
                    foreach ($fields as $field) {
                        echo "<th>{$field->name}</th>";
                    }
                    ?>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $resultado->fetch_assoc()): ?>
                <tr>
                    <?php foreach ($row as $data): ?>
                    <td><?php echo $data; ?></td>
                    <?php endforeach; ?>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php elseif (isset($resultado)): ?>
        <p>Consulta inválida ou sem resultados.</p>
    <?php endif; ?>

    <script>
        const ctx = document.getElementById('receitaMensalChart').getContext('2d');
        const receitaMensalChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                datasets: [{
                    label: 'Receita Mensal (R$)',
                    data: [1200, 1900, 3000, 5000, 2300, 4000, 3200, 2100, 4300, 3900, 3200, 4900],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
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
