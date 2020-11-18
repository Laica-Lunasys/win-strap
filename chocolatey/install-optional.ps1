$WindowsPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-Not($WindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))){
    Write-Output "Must be Administrator."
    Exit
}

# Install Optional Apps
choco install -y vlc XnviewMP 7zip-zstd