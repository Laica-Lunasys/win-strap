$WindowsPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-Not($WindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
    Write-Output "Must be Administrator."
    Exit
}

$RemoveTarget = @(
    "Microsoft.BingNews"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.News"
    "Microsoft.Office.Lens"
    "Microsoft.Office.OneNote"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.RemoteDesktop"
    "Microsoft.SkypeApp"
    "Microsoft.StorePurchaseApp"
    "Microsoft.Office.Todo.List"
    "Microsoft.Whiteboard"
    "Microsoft.WindowsAlarms"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "king.com.*"
    "KeeperSecurityInc.Keeper"
    "NAVER.LINE*"
    "A278AB0D.*"
    "*AdobePhotoshop*"
    "*EclipseManager*"
    "*ActiproSoftwareLLC*"
    "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
    "*Duolingo-LearnLanguagesforFree*"
    "*PandoraMediaInc*"
    "*CandyCrush*"
    "*BubbleWitch3Saga*"
    "*Wunderlist*"
    "*Flipboard*"
    "*Twitter*"
    "*Facebook*"
    "*Spotify*"
    "*Minecraft*"
    "*Royal Revolt*"
    "*Sway*"
    "*Speed Test*"
    "*Dolby*"
    "flaregamesGmbH.*"
    "ThumbmunkeysLtd.*"
)

foreach ($TargetApp in $RemoveTarget) {
    Write-Output ":: Remove $TargetApp..."
    Get-AppxPackage -Name $TargetApp| Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $TargetApp | Remove-AppxProvisionedPackage -Online
}