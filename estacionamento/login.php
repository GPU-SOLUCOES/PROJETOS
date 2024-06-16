<?php
session_start();
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $stmt = $conn->prepare("SELECT * FROM usuarios WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $resultado = $stmt->get_result();
    $usuario = $resultado->fetch_assoc();

    if ($usuario && password_verify($senha, $usuario['senha'])) {
        $_SESSION['user'] = $usuario;
        header("Location: dashboard.php");
        exit();
    } else {
        $erro = "Email ou senha inválidos.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('imagens/background.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        .login-container h1 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .login-container p {
            color: red;
        }
        .login-container form {
            display: flex;
            flex-direction: column;
        }
        .login-container label {
            margin: 10px 0 5px;
            text-align: left;
        }
        .login-container input {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-container button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #5cb85c;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .login-container button:hover {
            background-color: #4cae4c;
        }
        .info-box {
            margin-top: 20px;
            text-align: left;
            font-size: 14px;
            color: #555;
        }
        .info-box ul {
            list-style-type: none;
            padding: 0;
        }
        .info-box li {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <?php if (isset($erro)): ?>
        <p><?php echo $erro; ?></p>
        <?php endif; ?>
        <form method="post">
            <label for="email">Email:</label>
            <input type="email" name="email" required>
            <label for="senha">Senha:</label>
            <input type="password" name="senha" required>
            <button type="submit">Entrar</button>
        </form>
        <div class="info-box">
            <h3>Bem-vindo ao Sistema de Gestão de Estacionamento</h3>
            <ul>
                <li>Gerencie entradas e saídas de veículos com facilidade.</li>
                <li>Acesse relatórios financeiros detalhados.</li>
                <li>Administre usuários e serviços de maneira eficiente.</li>
            </ul>
        </div>
    </div>
</body>
</html>
