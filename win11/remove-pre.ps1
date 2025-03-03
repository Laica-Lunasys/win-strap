$WindowsPrincipal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-Not($WindowsPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
    Write-Output "Must be Administrator."
    Exit
}

$RemoveTarget = @()

# $RemoveTarget += @(
#     "Microsoft.BingNews"
#     "Microsoft.GetHelp"
#     "Microsoft.Getstarted"
#     "Microsoft.Messaging"
#     "Microsoft.MicrosoftOfficeHub"
#     "Microsoft.MicrosoftSolitaireCollection"
#     "Microsoft.NetworkSpeedTest"
#     "Microsoft.News"
#     "Microsoft.Office.Lens"
#     "Microsoft.Office.OneNote"
#     "Microsoft.Office.Sway"
#     "Microsoft.OneConnect"
#     "Microsoft.People"
#     "Microsoft.SkypeApp"
#     "Microsoft.StorePurchaseApp"
#     "Microsoft.Office.Todo.List"
#     "Microsoft.Whiteboard"
#     "Microsoft.WindowsAlarms"
#     "microsoft.WindowsCommunicationsApps"
#     "Microsoft.WindowsMaps"
# )

$RemoveTarget += @(
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
    "*Speed Test*"
    "*Dolby*"
    "*Netflix*"
    "flaregamesGmbH.*"
    "ThumbmunkeysLtd.*"
)

$RemoveTarget += @(
    "Microsoft.Advertising.Xaml"
)

# 3rd party Apps
# https://github.com/LeDragoX/Win-10-Smart-Debloat-Tools/blob/main/src/scripts/remove-bloatware-apps.ps1#L57
$RemoveTarget += @(
    "*ACGMediaPlayer*"
    "*ActiproSoftwareLLC*"
    "*AdobePhotoshopExpress*"                # Adobe Photoshop Express
    "*Amazon.com.Amazon*"                    # Amazon Shop
    "*Asphalt8Airborne*"                     # Asphalt 8 Airbone
    "*AutodeskSketchBook*"
    "*BubbleWitch3Saga*"                     # Bubble Witch 3 Saga
    "*CaesarsSlotsFreeCasino*"
    "*CandyCrush*"                           # Candy Crush
    "*COOKINGFEVER*"
    "*CyberLinkMediaSuiteEssentials*"
    "*DisneyMagicKingdoms*"
    "*Dolby*"                                # Dolby Products (Like Atmos)
    "*DrawboardPDF*"
    "*Duolingo-LearnLanguagesforFree*"       # Duolingo
    "*EclipseManager*"
    "*Facebook*"                             # Facebook
    "*FarmVille2CountryEscape*"
    "*FitbitCoach*"
    "*Flipboard*"                            # Flipboard
    "*HiddenCity*"
    "*Hulu*"
    "*iHeartRadio*"
    "*Keeper*"
    "*LinkedInforWindows*"
    "*MarchofEmpires*"
    "*NYTCrossword*"
    "*OneCalendar*"
    "*PandoraMediaInc*"
    "*PhototasticCollage*"
    "*PicsArt-PhotoStudio*"
    "*Plex*"                                 # Plex
    "*PolarrPhotoEditorAcademicEdition*"
    "*RoyalRevolt*"                          # Royal Revolt
    "*Shazam*"
    "*Sidia.LiveWallpaper*"                  # Live Wallpaper
    "*SlingTV*"
    "*Speed Test*"
    "*Sway*"
    "*TuneInRadio*"
    "*Twitter*"                              # Twitter
    "*Viber*"
    "*WinZipUniversal*"
    "*Wunderlist*"
    "*XING*"
)

$Progress = 0
$Length = $RemoveTarget.Length
$DefaultTitle = $Host.UI.RawUI.WindowTitle

foreach ($TargetApp in $RemoveTarget) {
    $Progress += 1
    $Host.UI.RawUI.WindowTitle = ":: [$Progress/$Length] Remove $TargetApp..."
    Write-Output $Host.UI.RawUI.WindowTitle

    Write-Output ":: Remove $TargetApp..."
    Get-AppxPackage -Name $TargetApp | Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $TargetApp | Remove-AppxProvisionedPackage -Online
}

$Host.UI.RawUI.WindowTitle = $DefaultTitle