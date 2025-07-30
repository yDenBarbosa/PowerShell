# Obtém o serviço especificado em um computador remoto
$serviço = Get-Service -Name "nome do serviço" -ComputerName "nome do computador/rede"

# Exibe o status atual do serviço (Running, Stopped, etc.)
$serviço.Status

# Verifica se o serviço está em execução
if ($serviço.Status -eq "Running") {
    # Para o serviço
    $serviço.Stop()
    
    # Inicia o serviço novamente (reinício)
    $serviço.Start()
}
else {
    # Mensagem exibida se o serviço não estava em execução
    Write-Host "Serviço não estava executando!"
}