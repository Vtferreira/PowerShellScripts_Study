# Função para obter a versão atual do Power BI
function Get-PowerBIVersion {
  # Substitua 'C:\Program Files\Microsoft\Power BI Desktop' pelo caminho correto para o seu sistema
  $powerBIExe = 'C:\Program Files\Microsoft Power BI Desktop\bin\PBIDesktop.exe'

  if (Test-Path $powerBIExe) {
      $versionInfo = (Get-Item $powerBIExe).VersionInfo
      return $versionInfo.FileVersion
  } else {
      Write-Warning "Power BI não encontrado no caminho padrão."
      return $null
  }
}
# Função para baixar e instalar a nova versão utilizando o Winget
function Install-LatestPowerBI {
  $latestVersion = Get-LatestPowerBIVersion
  $currentVersion = Get-PowerBIVersion

  if ($latestVersion -gt $currentVersion) {
      Write-Host "Nova versão disponível. Iniciando a instalação..."
      winget install Microsoft.PowerBI --exact --silent
  } else {
      Write-Host "Você já possui a versão mais recente do Power BI."
  }
}

# Executar o script
Install-LatestPowerBI