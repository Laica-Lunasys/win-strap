$WindowsPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-Not($WindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
    Write-Output "Must be Administrator."
    Exit
}
$ErrorActionPreference = "stop"

#$Apps = @(
#    "gerardog.gsudo"
#    "Git.Git"
#    "Microsoft.VisualStudioCode"
#    "Microsoft.WindowsTerminal"
#    "Google.Chrome"
#    "Google.JapaneseIME"
#    "valinet.ExplorerPatcher"
#    "Waterfox.Waterfox"
#    "Neovim.Neovim"
#)
$Apps = @(
    "Microsoft.VisualStudioCode"
    # "Microsoft.WindowsTerminal"
    "Microsoft.PowerShell"
    "Google.Chrome"
    "Google.JapaneseIME"
    "valinet.ExplorerPatcher"
    #"Waterfox.Waterfox"
    "Neovim.Neovim"
    "wez.wezterm"
    "gerardog.gsudo"
)

# Optional
$Apps += @(
    # "Twilio.Authy"
    "VideoLAN.VLC"
    "XnSoft.XnViewMP"
    "mcmilk.7zip-zstd"
    "Microsoft.PowerToys"
    #"OliverSchwendener.ueli"
)

# Communication
$Apps += @(
    "SlackTechnologies.Slack"
    "Discord.Discord"
)

# WSL
$Apps += @(
    # "Docker.DockerDesktop"
    "marha.VcXsrv"
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
    winget install --force --id $TargetApp --accept-source-agreements --accept-package-agreements
}

$Host.UI.RawUI.WindowTitle = $DefaultTitle