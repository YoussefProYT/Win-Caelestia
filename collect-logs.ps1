[CmdletBinding()]
param([string]$Output = (Join-Path $env:LOCALAPPDATA 'caelestia-win\logs\tester-diagnostics.zip'))
$ErrorActionPreference = 'Continue'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$LogDir = Join-Path $env:LOCALAPPDATA 'caelestia-win\logs'
New-Item -ItemType Directory -Force -Path $LogDir | Out-Null
cmd /c ver 2>&1 | Out-File -Encoding utf8 (Join-Path $LogDir 'windows-version.txt')
try { Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsBuildNumber, OsArchitecture | Format-List | Out-File -Encoding utf8 (Join-Path $LogDir 'windows-info.txt') } catch {}
$Report = Join-Path $LogDir 'qml-import-scan.txt'
$QmlRoot = Join-Path $Root 'caelestia'
if (Test-Path $QmlRoot) {
  Get-ChildItem $QmlRoot -Recurse -File -Include *.qml | Select-String -Pattern '^\s*import\s+(Quickshell[^\s]*|Caelestia[^\s]*)' | ForEach-Object { '{0}:{1}: {2}' -f $_.Path,$_.LineNumber,$_.Line.Trim() } | Set-Content -Encoding utf8 $Report
} else { 'Caelestia source not staged beside this script.' | Set-Content -Encoding utf8 $Report }
$Files = @()
if (Test-Path $LogDir) { $Files += Get-ChildItem $LogDir -File | Where-Object { $_.FullName -ne $Output } | ForEach-Object FullName }
if (Test-Path (Join-Path $Root 'caelestia')) { $Files += $Report }
if ($Files.Count) { Compress-Archive -Path $Files -DestinationPath $Output -Force }
Write-Host "Collected diagnostics: $Output"
