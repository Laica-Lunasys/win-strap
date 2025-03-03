#=================
# Explorer
#=================
Write-Output "-> Disable Frequency files..."
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t "REG_DWORD" /d "0" /f

Write-Output "-> Disable Recent files..."
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t "REG_DWORD" /d "0" /f

Write-Output "-> Show hidden files"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t "REG_DWORD" /d "1" /f

Write-Output "-> Show files Extension"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t "REG_DWORD" /d "0" /f

#==================
# Snap (Multitask)
#==================
Write-Output "-> Disable Auto Resize"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapFill" /t "REG_DWORD" /d "0" /f

Write-Output "-> Disable Snap Assist (Suggestion)"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t "REG_DWORD" /d "0" /f

Write-Output "-> Disable Joint resize"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "JointResize" /t "REG_DWORD" /d "0" /f

#=======================
# Suggest
#=======================
Write-Output "-> Disable LockScreen Suggestion"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t "REG_DWORD" /d "0" /f

Write-Output "-> Disable App Suggest"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t "REG_DWORD" /d "0" /f

Write-Output "-> Disable Windows Hint"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t "REG_DWORD" /d "0" /f

# Write-Output "-> Disable Windows Hint (New features)"
# reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t "REG_DWORD" /d "0" /f

# Write-Output "-> Disable Recommend in Timeline"
# reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t "REG_DWORD" /d "0" /f

Write-Output "-> Disable Recommend Apps in Start"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t "REG_DWORD" /d "0" /f

# =====================
# Consumer feature
# =====================
# Write-Output "-> Disable Consumer Features"
# reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t "REG_DWORD" /d "1" /f

# reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t "REG_DWORD" /d "0" /f
# reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled " /t "REG_DWORD" /d "0" /f
# reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled " /t "REG_DWORD" /d "0" /f
# reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled " /t "REG_DWORD" /d "0" /f
# reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled " /t "REG_DWORD" /d "0" /f
# reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled " /t "REG_DWORD" /d "0" /f

#=======================
# Keyboard
#=======================
Write-Output "-> Disable Language HotKey (Change IME etc.)"
reg add "HKEY_CURRENT_USER\Keyboard Layout\Toggle" /v "Hotkey" /t "REG_SZ" /d 3 /f
reg add "HKEY_CURRENT_USER\Keyboard Layout\Toggle" /v "Language Hotkey" /t "REG_SZ" /d 3 /f
reg add "HKEY_CURRENT_USER\Keyboard Layout\Toggle" /v "Layout Hotkey" /t "REG_SZ" /d 3 /f

# ==================
# Windows Update
# ==================
# Write-Output "-> Disable Auto reboot after Scheduled Windows Update"
# reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AlwaysAutoRebootAtScheduledTime" /t "REG_DWORD" /d "0" /f
# reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t "REG_DWORD" /d "1" /f

# ============
# System
# ============
# Write-Output "-> Clean shutdown"
# reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shutdown" /v "CleanShutdown" /t "REG_DWORD" /d "1" /f

# ============
# Taskbar
# ============
# Write-Output "-> Search box -> Icon"
# reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t "REG_DWORD" /d "1" /f

## ===
Write-Output ":: Restarting Explorer..."
taskkill /f /im explorer.exe
Start-Sleep 1
Start-Process explorer.exe