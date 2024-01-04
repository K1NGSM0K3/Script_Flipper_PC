# Obter informações do sistema
$processador = Get-CimInstance Win32_Processor | Select-Object Name
$ram = Get-CimInstance Win32_ComputerSystem | Select-Object TotalPhysicalMemory
$armazenamento = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID = 'C:'" | Select-Object Size, FreeSpace
$sistema_operacional = Get-CimInstance Win32_OperatingSystem | Select-Object Caption

# Criar o bloco de notas com as informações
Add-Content "$env:USERPROFILE\Desktop\Especificacoes_Do_PC.txt" -Value @"
Especificações do PC:

Processador: $($processador.Name)
Memória RAM: $($ram.TotalPhysicalMemory / 1GB) GB
Armazenamento Total: $($armazenamento.Size / 1GB) GB
Armazenamento Livre: $($armazenamento.FreeSpace / 1GB) GB
Sistema Operacional: $($sistema_operacional.Caption)
"@
