<?php
session_start();
if (!isset($_SESSION['user']) || $_SESSION['user']['tipo'] !== 'admin') {
    header("Location: login.php");
    exit();
}

include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['usuario'])) {
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);
        $tipo = $_POST['tipo'];

        $stmt = $conn->prepare("INSERT INTO usuarios (nome, email, senha, tipo) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $nome, $email, $senha, $tipo);
        $stmt->execute();
        $stmt->close();
    } elseif (isset($_POST['dia_funcionamento'])) {
        $dia = $_POST['dia'];
        $aberto = isset($_POST['aberto']) ? 1 : 0;
        $hora_abertura = $_POST['hora_abertura'];
        $hora_fechamento = $_POST['hora_fechamento'];

        $stmt = $conn->prepare("INSERT INTO dias_funcionamento (dia, aberto, hora_abertura, hora_fechamento) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("siss", $dia, $aberto, $hora_abertura, $hora_fechamento);
        $stmt->execute();
        $stmt->close();
    } elseif (isset($_POST['tarifa'])) {
        $tipo_veiculo = $_POST['tipo_veiculo'];
        $valor = $_POST['valor'];

        $stmt = $conn->prepare("INSERT INTO tarifas (tipo_veiculo, valor) VALUES (?, ?)");
        $stmt->bind_param("sd", $tipo_veiculo, $valor);
        $stmt->execute();
        $stmt->close();
    } elseif (isset($_POST['servico'])) {
        $nome = $_POST['nome'];
        $descricao = $_POST['descricao'];
        $valor = $_POST['valor'];

        $stmt = $conn->prepare("INSERT INTO servicos (nome, descricao, valor) VALUES (?, ?, ?)");
        $stmt->bind_param("ssd", $nome, $descricao, $valor);
        $stmt->execute();
        $stmt->close();
    }
}

$usuarios = $conn->query("SELECT * FROM usuarios");
$dias_funcionamento = $conn->query("SELECT * FROM dias_funcionamento");
$tarifas = $conn->query("SELECT * FROM tarifas");
$servicos = $conn->query("SELECT * FROM servicos");

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Administração</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Menu de navegação -->
    <nav class="menu">
        <a href="dashboard.php">Home</a>
        <a href="admin.php">Administração</a>
        <a href="financeiro.php">Financeiro</a>
        <a href="logout.php">Sair</a>
    </nav>

    <h1>Página Administrativa</h1>
    <a href="logout.php">Logout</a>

    <!-- Formulário para adicionar usuário -->
    <h2>Usuários</h2>
    <form method="post">
        <input type="hidden" name="usuario" value="1">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" required>
        <label for="email">Email:</label>
        <input type="email" name="email" required>
        <label for="senha">Senha:</label>
        <input type="password" name="senha" required>
        <label for="tipo">Tipo:</label>
        <select name="tipo">
            <option value="admin">Admin</option>
            <option value="funcionario">Funcionário</option>
        </select>
        <button type="submit">Salvar Usuário</button>
    </form>

    <!-- Formulário para adicionar dias de funcionamento -->
    <h2>Dias de Funcionamento</h2>
    <form method="post">
        <input type="hidden" name="dia_funcionamento" value="1">
        <label for="dia">Dia:</label>
        <select name="dia">
            <option value="segunda">Segunda</option>
            <option value="terça">Terça</option>
            <option value="quarta">Quarta</option>
            <option value="quinta">Quinta</option>
            <option value="sexta">Sexta</option>
            <option value="sábado">Sábado</option>
            <option value="domingo">Domingo</option>
        </select>
        <label for="aberto">Aberto:</label>
        <input type="checkbox" name="aberto" checked>
        <label for="hora_abertura">Hora de Abertura:</label>
        <input type="time" name="hora_abertura" required>
        <label for="hora_fechamento">Hora de Fechamento:</label>
        <input type="time" name="hora_fechamento" required>
        <button type="submit">Salvar Dia</button>
    </form>

    <!-- Formulário para adicionar tarifas -->
    <h2>Tarifas</h2>
    <form method="post">
        <input type="hidden" name="tarifa" value="1">
        <label for="tipo_veiculo">Tipo de Veículo:</label>
        <select name="tipo_veiculo">
            <option value="carro">Carro</option>
            <option value="moto">Moto</option>
            <option value="caminhao">Caminhão</option>
        </select>
        <label for="valor">Valor:</label>
        <input type="number" step="0.01" name="valor" required>
        <button type="submit">Salvar Tarifa</button>
    </form>

    <!-- Formulário para adicionar serviços -->
    <h2>Serviços</h2>
    <form method="post">
        <input type="hidden" name="servico" value="1">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" required>
        <label for="descricao">Descrição:</label>
        <textarea name="descricao"></textarea>
        <label for="valor">Valor:</label>
        <input type="number" step="0.01" name="valor" required>
        <button type="submit">Salvar Serviço</button>
    </form>

    <!-- Exibição dos registros -->
    <h2>Usuários Cadastrados</h2>
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>Email</th>
                <th>Tipo</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($usuario = $usuarios->fetch_assoc()): ?>
            <tr>
                <td><?php echo $usuario['nome']; ?></td>
                <td><?php echo $usuario['email']; ?></td>
                <td><?php echo $usuario['tipo']; ?></td>
                <td><a href="editar_usuario.php?id=<?php echo $usuario['id']; ?>">Editar</a> | <a href="deletar_usuario.php?id=<?php echo $usuario['id']; ?>">Excluir</a></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <h2>Dias de Funcionamento</h2>
    <table>
        <thead>
            <tr>
                <th>Dia</th>
                <th>Aberto</th>
                <th>Hora de Abertura</th>
                <th>Hora de Fechamento</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($dia = $dias_funcionamento->fetch_assoc()): ?>
            <tr>
                <td><?php echo $dia['dia']; ?></td>
                <td><?php echo $dia['aberto'] ? 'Sim' : 'Não'; ?></td>
                <td><?php echo $dia['hora_abertura']; ?></td>
                <td><?php echo $dia['hora_fechamento']; ?></td>
                <td><a href="editar_dia_funcionamento.php?id=<?php echo $dia['id']; ?>">Editar</a> | <a href="deletar_dia_funcionamento.php?id=<?php echo $dia['id']; ?>">Excluir</a></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <h2>Tarifas Cadastradas</h2>
    <table>
        <thead>
            <tr>
                <th>Tipo de Veículo</th>
                <th>Valor</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($tarifa = $tarifas->fetch_assoc()): ?>
            <tr>
                <td><?php echo $tarifa['tipo_veiculo']; ?></td>
                <td><?php echo $tarifa['valor']; ?></td>
                <td><a href="editar_tarifa.php?id=<?php echo $tarifa['id']; ?>">Editar</a> | <a href="deletar_tarifa.php?id=<?php echo $tarifa['id']; ?>">Excluir</a></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <h2>Serviços Cadastrados</h2>
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Valor</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($servico = $servicos->fetch_assoc()): ?>
            <tr>
                <td><?php echo $servico['nome']; ?></td>
                <td><?php echo $servico['descricao']; ?></td>
                <td><?php echo $servico['valor']; ?></td>
                <td><a href="editar_servico.php?id=<?php echo $servico['id']; ?>">Editar</a> | <a href="deletar_servico.php?id=<?php echo $servico['id']; ?>">Excluir</a></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</body>
</html>
