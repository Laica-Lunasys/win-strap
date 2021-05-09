$WindowsPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-Not($WindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
    Write-Output "Must be Administrator."
    Exit
}

# Install Optional Apps
$Host.UI.RawUI.WindowTitle = ":: Install / Applications / Optional / Utils, Browser"
Write-Output $Host.UI.RawUI.WindowTitle
choco install -y vlc XnviewMP 7zip-zstd powertoys GoogleChrome Firefox GoogleJapaneseInput etcher

$Host.UI.RawUI.WindowTitle = ":: Install / Applications / Optional / Gaming"
Write-Output $Host.UI.RawUI.WindowTitle
choco install -y steam origin ubisoft-connect minecraft-launcher

$Host.UI.RawUI.WindowTitle = ":: Install / Applications / Optional / Casting"
Write-Output $Host.UI.RawUI.WindowTitle
choco install -y obs-studio

$Host.UI.RawUI.WindowTitle = ":: Install / Applications / Optional / Modeling "
Write-Output $Host.UI.RawUI.WindowTitle
choco install -y unity-hub blender