<?php
require('fpdf.php');

session_start();
if (!isset($_SESSION['user']) || $_SESSION['user']['tipo'] !== 'admin') {
    header("Location: login.php");
    exit();
}

include 'db.php';

class PDF extends FPDF
{
    function Header()
    {
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, 'Relatório', 0, 1, 'C');
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, 'Page ' . $this->PageNo(), 0, 0, 'C');
    }
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $stmt = $conn->prepare("SELECT * FROM relatorios_personalizados WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $relatorio = $result->fetch_assoc();
    $stmt->close();

    if ($relatorio) {
        $consulta = $relatorio['consulta'];
        $result = $conn->query($consulta);

        $pdf = new PDF();
        $pdf->AddPage();
        $pdf->SetFont('Arial', 'B', 12);

        $fieldinfo = $result->fetch_fields();
        foreach ($fieldinfo as $val) {
            $pdf->Cell(40, 10, $val->name, 1);
        }
        $pdf->Ln();

        $pdf->SetFont('Arial', '', 12);
        while ($row = $result->fetch_assoc()) {
            foreach ($row as $value) {
                $pdf->Cell(40, 10, $value, 1);
            }
            $pdf->Ln();
        }

        $pdf->Output();
        exit();
    } else {
        echo "Relatório não encontrado.";
        exit();
    }
} else {
    echo "ID do relatório não especificado.";
    exit();
}
?>
