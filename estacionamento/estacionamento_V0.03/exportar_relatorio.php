<?php
require('fpdf.php');
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit();
}

include 'db.php';

function executarConsulta($conn, $consulta) {
    if (preg_match('/^\s*SELECT/i', $consulta)) {
        return $conn->query($consulta);
    } else {
        return false;
    }
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $stmt = $conn->prepare("SELECT * FROM relatorios_personalizados WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $relatorio = $stmt->get_result()->fetch_assoc();

    if ($relatorio) {
        $resultado = executarConsulta($conn, $relatorio['consulta']);
    } else {
        echo "Relatório não encontrado.";
        exit();
    }
} else {
    echo "ID do relatório não fornecido.";
    exit();
}

class PDF extends FPDF
{
    function Header()
    {
        $this->SetFont('Arial','B',12);
        $this->Cell(0,10,'Relatorio Financeiro',0,1,'C');
        $this->Ln(10);
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial','I',8);
        $this->Cell(0,10,'Page '.$this->PageNo(),0,0,'C');
    }
}

$pdf = new PDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',12);

$fields = $resultado->fetch_fields();
foreach ($fields as $field) {
    $pdf->Cell(40,10,$field->name,1);
}
$pdf->Ln();

$pdf->SetFont('Arial','',12);
while ($row = $resultado->fetch_assoc()) {
    foreach ($row as $data) {
        $pdf->Cell(40,10,$data,1);
    }
    $pdf->Ln();
}

$pdf->Output();
?>
