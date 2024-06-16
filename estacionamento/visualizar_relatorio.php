<?php
session_start();
if (!isset($_SESSION['user']) || $_SESSION['user']['tipo'] !== 'admin') {
    header("Location: login.php");
    exit();
}

include 'db.php';

$limit = 10; // Número de registros por página
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$offset = ($page - 1) * $limit;

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $stmt = $conn->prepare("SELECT * FROM relatorios_personalizados WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $relatorio = $result->fetch_assoc();
    $stmt->close();

    if ($relatorio) {
        $consulta = $relatorio['consulta'] . " LIMIT $limit OFFSET $offset";
        $result = $conn->query($consulta);

        // Para contar o total de registros
        $countQuery = preg_replace('/SELECT .* FROM/', 'SELECT COUNT(*) FROM', $relatorio['consulta']);
        $countResult = $conn->query($countQuery);
        $totalRegistros = $countResult->fetch_row()[0];
        $totalPaginas = ceil($totalRegistros / $limit);
    } else {
        echo "Relatório não encontrado.";
        exit();
    }
} else {
    echo "ID do relatório não especificado.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Visualizar Relatório</title>
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

    <h1><?php echo $relatorio['nome']; ?></h1>
    <p><?php echo $relatorio['descricao']; ?></p>

    <!-- Exibição dos resultados do relatório -->
    <?php if ($result): ?>
    <table>
        <thead>
            <tr>
                <?php while ($fieldinfo = $result->fetch_field()): ?>
                <th><?php echo $fieldinfo->name; ?></th>
                <?php endwhile; ?>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $result->fetch_assoc()): ?>
            <tr>
                <?php foreach ($row as $value): ?>
                <td><?php echo $value; ?></td>
                <?php endforeach; ?>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>

    <!-- Paginação -->
    <div class="pagination">
        <?php for ($i = 1; $i <= $totalPaginas; $i++): ?>
            <a href="?id=<?php echo $id; ?>&page=<?php echo $i; ?>"><?php echo $i; ?></a>
        <?php endfor; ?>
    </div>
    <?php else: ?>
    <p>Nenhum dado encontrado.</p>
    <?php endif; ?>
</body>
</html>
<a href="exportar_relatorio_pdf.php?id=<?php echo $relatorio['id']; ?>">Exportar como PDF</a>
