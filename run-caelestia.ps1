[CmdletBinding()]
param([string]$Config = "caelestia")
$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$DataRoot = Join-Path $env:LOCALAPPDATA 'caelestia-win'
$LogDir = Join-Path $DataRoot 'logs'
New-Item -ItemType Directory -Force -Path $LogDir, (Join-Path $DataRoot 'config'), (Join-Path $DataRoot 'data'), (Join-Path $DataRoot 'cache'), (Join-Path $DataRoot 'state') | Out-Null
$env:XDG_CONFIG_HOME = Join-Path $DataRoot 'config'
$env:XDG_DATA_HOME = Join-Path $DataRoot 'data'
$env:XDG_CACHE_HOME = Join-Path $DataRoot 'cache'
$env:XDG_STATE_HOME = Join-Path $DataRoot 'state'
$env:CAELESTIA_WIN_LOG = Join-Path $LogDir 'compat.log'
$env:PATH = (Join-Path $Root 'compat\bin') + ';' + (Join-Path $Root 'port') + ';' + $env:PATH
$env:QML_IMPORT_PATH = (Join-Path $Root 'plugin\qml') + ';' + (Join-Path $Root 'port\qml')
$Qs = Join-Path $Root 'port\qs.exe'
if (!(Test-Path $Qs)) { throw "Quickshell not built/staged: $Qs. This repository does not contain a qs.exe." }
if (!(Test-Path (Join-Path $Root 'plugin\qml\Caelestia\qmldir'))) { throw 'Caelestia plugin QML module is not built/staged. See README.md; this harness is not a runnable package.' }
$Log = Join-Path $LogDir 'caelestia-console.log'
& $Qs -c $Config 2>&1 | Tee-Object -FilePath $Log
exit $LASTEXITCODE
