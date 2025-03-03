# Turn-off Virtual Based Security (VBS)
# Fix of reduce gaming performance issue...
Write-Output "-> Disable Virtual Based Security"
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t "REG_DWORD" /d "0" /f