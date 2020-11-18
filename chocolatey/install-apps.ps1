$WindowsPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-Not($WindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))){
    Write-Output "Must be Administrator."
    Exit
}

# Install Basic Apps, for WSL Apps, Development...
choco install -y gsudo git vscode microsoft-windows-terminal docker-desktop wsltty vcxsrv