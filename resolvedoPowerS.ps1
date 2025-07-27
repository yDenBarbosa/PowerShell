$serviço = Get-Service -Name "nome do serviço" -ComputerName "nome do computador/rede"

$serviço.Status

if ($serviço.Status -eq "Runnig") {
    $serviço.Stop()
    $serviço.Start()
}
else {
    Write-Host "Serviço não estava executando!"
}