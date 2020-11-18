$WindowsPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-Not($WindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))){
    Write-Output "Must be Administrator."
    Exit
}

$Host.UI.RawUI.WindowTitle = ":: Install / Chocolatey"
Write-Output $Host.UI.RawUI.WindowTitle
.\chocolatey\init.ps1
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

$Host.UI.RawUI.WindowTitle = ":: Install / Applications"
Write-Output $Host.UI.RawUI.WindowTitle
.\chocolatey\install-apps.ps1

$Host.UI.RawUI.WindowTitle = ":: Install / Applications / Optional"
Write-Output $Host.UI.RawUI.WindowTitle
.\chocolatey\install-optional.ps1

$Host.UI.RawUI.WindowTitle = ":: Remove / Pre Install Applications"
Write-Output $Host.UI.RawUI.WindowTitle
.\windows\remove-pre.ps1

$Host.UI.RawUI.WindowTitle = ":: Tuning Windows Settings"
Write-Output $Host.UI.RawUI.WindowTitle
.\windows\tuning.ps1

$Host.UI.RawUI.WindowTitle = ":: All operations completed!"
Write-Output "============================================================"
Write-Output "All operations completed! You can now close this window."
Write-Output "============================================================"
pause