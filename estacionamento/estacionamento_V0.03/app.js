document.addEventListener('DOMContentLoaded', function () {
    loadVeiculos();

    document.getElementById('entrada-form').addEventListener('submit', function (e) {
        e.preventDefault();

        const placa = document.getElementById('placa').value;
        const tipo = document.getElementById('tipo').value;

        fetch('entrada.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `placa=${placa}&tipo=${tipo}`
        })
        .then(response => response.text())
        .then(data => {
            alert(data);
            loadVeiculos();
        });
    });
});

function loadVeiculos() {
    fetch('veiculos.php')
    .then(response => response.json())
    .then(data => {
        const veiculosDiv = document.getElementById('veiculos');
        veiculosDiv.innerHTML = `
            <table>
                <thead>
                    <tr>
                        <th>Placa</th>
                        <th>Tipo</th>
                        <th>Modelo</th>
                        <th>Cor</th>
                        <th>Data de Entrada</th>
                        <th>Data de Saída</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    ${data.map(veiculo => `
                        <tr>
                            <td>${veiculo.placa}</td>
                            <td>${veiculo.tipo}</td>
                            <td>${veiculo.modelo || ''}</td>
                            <td>${veiculo.cor || ''}</td>
                            <td>${veiculo.data_entrada}</td>
                            <td>${veiculo.data_saida || ''}</td>
                            <td>
                                ${!veiculo.data_saida ? `<button onclick="registrarSaida('${veiculo.placa}')">Registrar Saída</button>` : ''}
                            </td>
                        </tr>
                    `).join('')}
                </tbody>
            </table>
        `;
    });
}

function registrarSaida(placa) {
    fetch('saida.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `placa=${placa}`
    })
    .then(response => response.text())
    .then(data => {
        alert(data);
        loadVeiculos();
    });
}
