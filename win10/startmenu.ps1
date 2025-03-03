Param(
    [parameter(mandatory=$true)]$Action
)

$ErrorActionPreference = "stop"
$WindowsPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-Not($WindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
    Write-Output "Must be Administrator."
    Exit
}
Set-Location "$PSScriptRoot\.."

if ($Action -eq "set") {
    Import-StartLayout -LayoutPath $PWD\template\start\Minimal.xml -MountPath 'C:\'
    Remove-Item 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\*$start.tilegrid$windows.data.curatedtilecollection.tilecollection' -Force -Recurse
    Stop-Process -Name explorer
} elseif ($Action -eq "unset") {
    Remove-Item -Force -Recurse "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml"
    Remove-Item 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\*$start.tilegrid$windows.data.curatedtilecollection.tilecollection' -Force -Recurse
    Stop-Process -Name explorer
} else {
    Write-Error("E: Unknown ation")
}