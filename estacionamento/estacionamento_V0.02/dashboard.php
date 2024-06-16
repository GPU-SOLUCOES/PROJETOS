<?php
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit();
}

include 'db.php';

// Simulação de dias e horário de funcionamento
$diasFuncionamento = [
    'segunda' => ['aberto' => true, 'hora_abertura' => '08:00', 'hora_fechamento' => '18:00'],
    'terca' => ['aberto' => true, 'hora_abertura' => '08:00', 'hora_fechamento' => '18:00'],
    'quarta' => ['aberto' => true, 'hora_abertura' => '08:00', 'hora_fechamento' => '18:00'],
    'quinta' => ['aberto' => true, 'hora_abertura' => '08:00', 'hora_fechamento' => '18:00'],
    'sexta' => ['aberto' => true, 'hora_abertura' => '08:00', 'hora_fechamento' => '18:00'],
    'sabado' => ['aberto' => false], // Simulando fechado aos sábados
    'domingo' => ['aberto' => false], // Simulando fechado aos domingos
];

// Função para verificar se está aberto hoje
function estaAbertoHoje($diasFuncionamento) {
    $diaSemana = strtolower(date('l')); // Obtém o dia da semana em inglês completo (ex: Monday)
    return isset($diasFuncionamento[$diaSemana]) && $diasFuncionamento[$diaSemana]['aberto'];
}

// Função para obter o horário de funcionamento de hoje
function horarioFuncionamentoHoje($diasFuncionamento) {
    $diaSemana = strtolower(date('l')); // Obtém o dia da semana em inglês completo (ex: Monday)
    if (isset($diasFuncionamento[$diaSemana])) {
        if ($diasFuncionamento[$diaSemana]['aberto']) {
            return $diasFuncionamento[$diaSemana]['hora_abertura'] . ' às ' . $diasFuncionamento[$diaSemana]['hora_fechamento'];
        } else {
            return 'Fechado hoje';
        }
    } else {
        return 'Não definido';
    }
}

// Exemplo de dados para veículos no pátio
$veiculosNoPatio = [
    ['entrada' => '2024-06-15 08:30', 'veiculo' => 'Carro', 'proprietario' => 'João da Silva', 'placa' => 'ABC1234', 'tipo' => 'carro', 'plano' => 'diario'],
    ['entrada' => '2024-06-15 09:15', 'veiculo' => 'Moto', 'proprietario' => 'Maria Souza', 'placa' => 'XYZ5678', 'tipo' => 'moto', 'plano' => 'mensalista'],
];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            background-color: #f0f5f9;
            color: #333;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .login-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .menu {
            background-color: #4a90e2;
            padding: 10px 0;
            text-align: center;
            margin-bottom: 20px;
        }

        .menu a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            font-size: 18px;
        }

        .menu a:hover {
            background-color: #357bd8;
            border-radius: 4px;
        }

        h1, h2, h3 {
            color: #4a90e2;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4a90e2;
            color: #fff;
        }

        td {
            background-color: #e7f0f7;
        }

        .btn-sair {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-sair:hover {
            background-color: #cc0000;
        }

        /* Animação simples */
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        .btn-sair.animated {
            animation: pulse 1s infinite;
        }
    </style>
</head>
<body>
    <!-- Menu de navegação -->
    <nav class="menu">
        <a href="dashboard.php">Home</a>
        <a href="admin.php">Administração</a>
        <a href="financeiro.php">Financeiro</a>
        <a href="logout.php">Sair</a>
    </nav>
    
    <div class="login-container">
        <h1>Bem-vindo, <?php echo $_SESSION['user']['nome']; ?></h1>
        <p>Hoje é <?php echo date('d/m/Y'); ?> e estamos abertos das <?php echo horarioFuncionamentoHoje($diasFuncionamento); ?>.</p>
        
        <h2>Registro de Entrada de Veículos</h2>
        <form id="entrada-form">
            <label for="veiculo">Veículo:</label>
            <input type="text" name="veiculo" id="veiculo" required>
            <label for="proprietario">Nome do Proprietário:</label>
            <input type="text" name="proprietario" id="proprietario" required>
            <label for="placa">Placa:</label>
            <input type="text" name="placa" id="placa" required>
            <label for="tipo">Tipo:</label>
            <select name="tipo" id="tipo" required>
                <option value="carro">Carro</option>
                <option value="moto">Moto</option>
                <option value="caminhao">SUV</option>
            </select>
            <label for="plano">Plano:</label>
            <select name="plano" id="plano" required>
            <option value="Hora">Hora</option>
                <option value="diario">Diário</option>
                <option value="mensalista">Mensalista</option>
            </select>
            <button type="submit">Registrar Entrada</button>
        </form>

        <h2>Veículos no Pátio</h2>
        <div id="veiculos">
            <table>
                <thead>
                    <tr>
                        <th>Entrada</th>
                        <th>Veículo</th>
                        <th>Proprietário</th>
                        <th>Placa</th>
                        <th>Tipo</th>
                        <th>Plano</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($veiculosNoPatio as $veiculo): ?>
                    <tr>
                        <td><?php echo $veiculo['entrada']; ?></td>
                        <td><?php echo $veiculo['veiculo']; ?></td>
                        <td><?php echo $veiculo['proprietario']; ?></td>
                        <td><?php echo $veiculo['placa']; ?></td>
                        <td><?php echo ucfirst($veiculo['tipo']); ?></td>
                        <td><?php echo ucfirst($veiculo['plano']); ?></td>
                        <td><button class="btn-sair animated">Sair</button></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <script src="app.js"></script>
</body>
</html>
