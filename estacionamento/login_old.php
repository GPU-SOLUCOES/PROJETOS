<?php
session_start();
require 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Verifique se os campos não estão vazios
    if (empty($username) || empty($password)) {
        echo "Por favor, preencha todos os campos.";
    } else {
        // Consulta para verificar as credenciais
        $sql = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
        
        // Preparar a consulta para evitar SQL injection
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("ss", $username, $password);
            $stmt->execute();
            $result = $stmt->get_result();

            // Verifique se a consulta retornou algum resultado
            if ($result->num_rows > 0) {
                $_SESSION['user'] = $result->fetch_assoc();
                header("Location: dashboard.php");
                exit(); // Certifique-se de encerrar o script após redirecionar
            } else {
                echo "Credenciais inválidas";
            }
            $stmt->close();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Estacionamento</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        <form method="post" action="">
            <label for="username">Usuário:</label>
            <input type="text" id="username" name="username">
            
            <label for="password">Senha:</label>
            <input type="password" id="password" name="password">
            
            <button type="submit">Entrar</button>
        </form>
    </div>
</body>
</html>
