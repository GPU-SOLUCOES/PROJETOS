<?php
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
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
    
    <h1>Bem-vindo, <?php echo $_SESSION['user']['nome']; ?></h1>
    <h2>Entrada e Saída de Veículos</h2>
    <form id="entrada-form">
        <label for="placa">Placa:</label>
        <input type="text" name="placa" id="placa" required>
        <label for="tipo">Tipo:</label>
        <select name="tipo" id="tipo">
            <option value="carro">Carro</option>
            <option value="moto">Moto</option>
            <option value="caminhao">Caminhão</option>
        </select>
        <label for="plano">Plano:</label>
        <select name="plano" id="plano">
            <option value="diario">Diário</option>
            <option value="mensalista">Mensalista</option>
        </select>
        <button type="submit">Registrar Entrada</button>
    </form>

    <h2>Veículos no Pátio</h2>
    <div id="veiculos"></div>

    <script src="app.js"></script>
</body>
</html>
