$WindowsPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-Not($WindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
    Write-Output "Must be Administrator."
    Exit
}
$ErrorActionPreference = "stop"

$InstallLocation = "Q:\Applications"

# Game
$Apps = @(
    # "Valve.Steam"
    # "Ubisoft.Connect"
    # "ElectronicArts.EADesktop"
)

# Streaming
$Apps += @(
    "OBSProject.OBSStudio"
)

# Game-Dev / Modeling
$Apps += @(
    "UnityTechnologies.UnityHub"
    "BlenderFoundation.Blender"
)

$Progress = 0
$Length = $Apps.Length
$DefaultTitle = $Host.UI.RawUI.WindowTitle

foreach ($TargetApp in $Apps) {
    $Progress += 1
    $Host.UI.RawUI.WindowTitle = ":: [$Progress/$Length] Install $TargetApp..."
    Write-Output $Host.UI.RawUI.WindowTitle

    if (winget list --id $TargetApp | Select-String $TargetApp) {
        Write-Warning "$TargetApp is already installed. skipping..."
        continue
    }
    winget install --silent --force --location "$InstallLocation" --id $TargetApp
    # winget uninstall --silent --id $TargetApp
}

$Host.UI.RawUI.WindowTitle = $DefaultTitle