﻿$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'cpu-z.install'
  fileType       = 'exe'
  url            = 'https://download.cpuid.com/cpu-z/cpu-z_2.04-en.exe'
  checksum       = 'fb3737f517226f0e73e6a5c3009b37586e7c052f30838f6c74a0466d66d02b4b'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
  validExitCodes = @(0)
  softwareName   = 'cpu-z'
}
Install-ChocolateyPackage @packageArgs

$packageName = $packageArgs.packageName
$installLocation = Get-AppInstallLocation $packageArgs.softwareName
if ($installLocation)  {
    Write-Host "$packageName installed to '$installLocation'"
    Register-Application "$installLocation\cpuz.exe"
    Write-Host "$packageName registered as cpuz"
}
else { Write-Warning "Can't find $packageName install location" }
