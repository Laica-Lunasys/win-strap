Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteChar