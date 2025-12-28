@echo off
setlocal enabledelayedexpansion

:: Gaming Platforms Setup Script
:: Handles installation of popular gaming platforms

:: Check for admin rights and auto-elevate if needed
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    echo.
    
    :: Re-launch the script with admin rights
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b 0
)

:MENU
cls
echo ============================================
echo    Gaming Platforms Setup Script
echo ============================================
echo.
echo 1. Install Steam
echo 2. Install Ubisoft Connect
echo 3. Install GOG Galaxy
echo 4. Install Epic Games Launcher
echo 5. Install Battle.net
echo 6. Install EA App
echo 7. Install All Gaming Platforms
echo 8. Exit
echo.
echo ============================================
set /p choice="Enter your choice (1-8): "

if "%choice%"=="1" goto INSTALL_STEAM
if "%choice%"=="2" goto INSTALL_UBISOFT
if "%choice%"=="3" goto INSTALL_GOG
if "%choice%"=="4" goto INSTALL_EPIC
if "%choice%"=="5" goto INSTALL_BATTLENET
if "%choice%"=="6" goto INSTALL_EA
if "%choice%"=="7" goto INSTALL_ALL
if "%choice%"=="8" goto EXIT

echo Invalid choice. Please try again.
timeout /t 2 >nul
goto MENU

:INSTALL_STEAM
cls
echo ============================================
echo         Installing Steam
echo ============================================
echo.
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

echo Downloading Steam installer...
powershell -Command "& {$url='https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe'; $output='%TEMP_DIR%\SteamSetup.exe'; Write-Host ''; $wc=New-Object System.Net.WebClient; $wc.DownloadProgressChanged={param($s,$e) Write-Progress -Activity 'Downloading Steam' -Status ('{0:N0} KB / {1:N0} KB' -f ($e.BytesReceived/1KB),($e.TotalBytesToReceive/1KB)) -PercentComplete $e.ProgressPercentage}; $wc.DownloadFileCompleted={param($s,$e) Write-Progress -Activity 'Downloading Steam' -Completed}; $wc.DownloadFileAsync($url,$output); while($wc.IsBusy){Start-Sleep -Milliseconds 100}; Write-Host 'Download complete!' -ForegroundColor Green}"

if exist "%TEMP_DIR%\SteamSetup.exe" (
    echo.
    echo Running Steam installer...
    start /wait "%TEMP_DIR%\SteamSetup.exe"
    echo.
    echo Steam installation completed.
) else (
    echo ERROR: Failed to download Steam installer.
)

echo.
pause
goto MENU

:INSTALL_UBISOFT
cls
echo ============================================
echo      Installing Ubisoft Connect
echo ============================================
echo.
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

echo Downloading Ubisoft Connect installer...
powershell -Command "& {$url='https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'; $output='%TEMP_DIR%\UbisoftConnectInstaller.exe'; Write-Host ''; $wc=New-Object System.Net.WebClient; $wc.DownloadProgressChanged={param($s,$e) Write-Progress -Activity 'Downloading Ubisoft Connect' -Status ('{0:N0} KB / {1:N0} KB' -f ($e.BytesReceived/1KB),($e.TotalBytesToReceive/1KB)) -PercentComplete $e.ProgressPercentage}; $wc.DownloadFileCompleted={param($s,$e) Write-Progress -Activity 'Downloading Ubisoft Connect' -Completed}; $wc.DownloadFileAsync($url,$output); while($wc.IsBusy){Start-Sleep -Milliseconds 100}; Write-Host 'Download complete!' -ForegroundColor Green}"

if exist "%TEMP_DIR%\UbisoftConnectInstaller.exe" (
    echo.
    echo Running Ubisoft Connect installer...
    start /wait "%TEMP_DIR%\UbisoftConnectInstaller.exe"
    echo.
    echo Ubisoft Connect installation completed.
) else (
    echo ERROR: Failed to download Ubisoft Connect installer.
)

echo.
pause
goto MENU

:INSTALL_GOG
cls
echo ============================================
echo         Installing GOG Galaxy
echo ============================================
echo.
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

echo Downloading GOG Galaxy installer...
powershell -Command "& {$url='https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe'; $output='%TEMP_DIR%\GOGGalaxySetup.exe'; Write-Host ''; $wc=New-Object System.Net.WebClient; $wc.DownloadProgressChanged={param($s,$e) Write-Progress -Activity 'Downloading GOG Galaxy' -Status ('{0:N0} KB / {1:N0} KB' -f ($e.BytesReceived/1KB),($e.TotalBytesToReceive/1KB)) -PercentComplete $e.ProgressPercentage}; $wc.DownloadFileCompleted={param($s,$e) Write-Progress -Activity 'Downloading GOG Galaxy' -Completed}; $wc.DownloadFileAsync($url,$output); while($wc.IsBusy){Start-Sleep -Milliseconds 100}; Write-Host 'Download complete!' -ForegroundColor Green}"

if exist "%TEMP_DIR%\GOGGalaxySetup.exe" (
    echo.
    echo Running GOG Galaxy installer...
    start /wait "%TEMP_DIR%\GOGGalaxySetup.exe"
    echo.
    echo GOG Galaxy installation completed.
) else (
    echo ERROR: Failed to download GOG Galaxy installer.
)

echo.
pause
goto MENU

:INSTALL_EPIC
cls
echo ============================================
echo     Installing Epic Games Launcher
echo ============================================
echo.
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

echo Downloading Epic Games Launcher installer...
powershell -Command "& {$url='https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi'; $output='%TEMP_DIR%\EpicGamesLauncherInstaller.msi'; Write-Host ''; $wc=New-Object System.Net.WebClient; $wc.DownloadProgressChanged={param($s,$e) Write-Progress -Activity 'Downloading Epic Games Launcher' -Status ('{0:N0} KB / {1:N0} KB' -f ($e.BytesReceived/1KB),($e.TotalBytesToReceive/1KB)) -PercentComplete $e.ProgressPercentage}; $wc.DownloadFileCompleted={param($s,$e) Write-Progress -Activity 'Downloading Epic Games Launcher' -Completed}; $wc.DownloadFileAsync($url,$output); while($wc.IsBusy){Start-Sleep -Milliseconds 100}; Write-Host 'Download complete!' -ForegroundColor Green}"

if exist "%TEMP_DIR%\EpicGamesLauncherInstaller.msi" (
    echo.
    echo Running Epic Games Launcher installer...
    start /wait msiexec /i "%TEMP_DIR%\EpicGamesLauncherInstaller.msi"
    echo.
    echo Epic Games Launcher installation completed.
) else (
    echo ERROR: Failed to download Epic Games Launcher installer.
)

echo.
pause
goto MENU

:INSTALL_BATTLENET
cls
echo ============================================
echo         Installing Battle.net
echo ============================================
echo.
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

echo Downloading Battle.net installer...
powershell -Command "& {$url='https://downloader.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live'; $output='%TEMP_DIR%\BattleNetSetup.exe'; Write-Host ''; $wc=New-Object System.Net.WebClient; $wc.DownloadProgressChanged={param($s,$e) Write-Progress -Activity 'Downloading Battle.net' -Status ('{0:N0} KB / {1:N0} KB' -f ($e.BytesReceived/1KB),($e.TotalBytesToReceive/1KB)) -PercentComplete $e.ProgressPercentage}; $wc.DownloadFileCompleted={param($s,$e) Write-Progress -Activity 'Downloading Battle.net' -Completed}; $wc.DownloadFileAsync($url,$output); while($wc.IsBusy){Start-Sleep -Milliseconds 100}; Write-Host 'Download complete!' -ForegroundColor Green}"

if exist "%TEMP_DIR%\BattleNetSetup.exe" (
    echo.
    echo Running Battle.net installer...
    start /wait "%TEMP_DIR%\BattleNetSetup.exe"
    echo.
    echo Battle.net installation completed.
) else (
    echo ERROR: Failed to download Battle.net installer.
)

echo.
pause
goto MENU

:INSTALL_EA
cls
echo ============================================
echo         Installing EA App
echo ============================================
echo.
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"

echo Downloading EA App installer...
powershell -Command "& {$url='https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe'; $output='%TEMP_DIR%\EAappInstaller.exe'; Write-Host ''; $wc=New-Object System.Net.WebClient; $wc.DownloadProgressChanged={param($s,$e) Write-Progress -Activity 'Downloading EA App' -Status ('{0:N0} KB / {1:N0} KB' -f ($e.BytesReceived/1KB),($e.TotalBytesToReceive/1KB)) -PercentComplete $e.ProgressPercentage}; $wc.DownloadFileCompleted={param($s,$e) Write-Progress -Activity 'Downloading EA App' -Completed}; $wc.DownloadFileAsync($url,$output); while($wc.IsBusy){Start-Sleep -Milliseconds 100}; Write-Host 'Download complete!' -ForegroundColor Green}"

if exist "%TEMP_DIR%\EAappInstaller.exe" (
    echo.
    echo Running EA App installer...
    start /wait "%TEMP_DIR%\EAappInstaller.exe"
    echo.
    echo EA App installation completed.
) else (
    echo ERROR: Failed to download EA App installer.
)

echo.
pause
goto MENU

:INSTALL_ALL
cls
echo ============================================
echo     Installing All Gaming Platforms
echo ============================================
echo.
echo This will install Steam, Ubisoft Connect, GOG Galaxy,
echo Epic Games Launcher, Battle.net, and EA App.
echo.
set /p confirm="Do you want to continue? (Y/N): "

if /i not "%confirm%"=="Y" (
    echo Installation cancelled.
    pause
    goto MENU
)

echo.
echo Starting installations...
echo.

call :INSTALL_STEAM_SILENT
call :INSTALL_UBISOFT_SILENT
call :INSTALL_GOG_SILENT
call :INSTALL_EPIC_SILENT
call :INSTALL_BATTLENET_SILENT
call :INSTALL_EA_SILENT

echo.
echo All gaming platforms have been queued for installation.
echo.
pause
goto MENU

:INSTALL_STEAM_SILENT
echo [1/6] Installing Steam...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "& {$ProgressPreference='SilentlyContinue'; $url='https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe'; $output='%TEMP_DIR%\SteamSetup.exe'; $wc=New-Object System.Net.WebClient; $wc.DownloadFile($url,$output); Write-Host 'Steam download complete' -ForegroundColor Green}"
if exist "%TEMP_DIR%\SteamSetup.exe" (start "%TEMP_DIR%\SteamSetup.exe") else (echo Failed to download Steam installer.)
goto :eof

:INSTALL_UBISOFT_SILENT
echo [2/6] Installing Ubisoft Connect...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "& {$ProgressPreference='SilentlyContinue'; $url='https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe'; $output='%TEMP_DIR%\UbisoftConnectInstaller.exe'; $wc=New-Object System.Net.WebClient; $wc.DownloadFile($url,$output); Write-Host 'Ubisoft Connect download complete' -ForegroundColor Green}"
if exist "%TEMP_DIR%\UbisoftConnectInstaller.exe" (start "%TEMP_DIR%\UbisoftConnectInstaller.exe") else (echo Failed to download Ubisoft Connect installer.)
goto :eof

:INSTALL_GOG_SILENT
echo [3/6] Installing GOG Galaxy...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "& {$ProgressPreference='SilentlyContinue'; $url='https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe'; $output='%TEMP_DIR%\GOGGalaxySetup.exe'; $wc=New-Object System.Net.WebClient; $wc.DownloadFile($url,$output); Write-Host 'GOG Galaxy download complete' -ForegroundColor Green}"
if exist "%TEMP_DIR%\GOGGalaxySetup.exe" (start "%TEMP_DIR%\GOGGalaxySetup.exe") else (echo Failed to download GOG Galaxy installer.)
goto :eof

:INSTALL_EPIC_SILENT
echo [4/6] Installing Epic Games Launcher...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "& {$ProgressPreference='SilentlyContinue'; $url='https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi'; $output='%TEMP_DIR%\EpicGamesLauncherInstaller.msi'; $wc=New-Object System.Net.WebClient; $wc.DownloadFile($url,$output); Write-Host 'Epic Games Launcher download complete' -ForegroundColor Green}"
if exist "%TEMP_DIR%\EpicGamesLauncherInstaller.msi" (start msiexec /i "%TEMP_DIR%\EpicGamesLauncherInstaller.msi") else (echo Failed to download Epic Games Launcher installer.)
goto :eof

:INSTALL_BATTLENET_SILENT
echo [5/6] Installing Battle.net...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "& {$ProgressPreference='SilentlyContinue'; $url='https://downloader.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live'; $output='%TEMP_DIR%\BattleNetSetup.exe'; $wc=New-Object System.Net.WebClient; $wc.DownloadFile($url,$output); Write-Host 'Battle.net download complete' -ForegroundColor Green}"
if exist "%TEMP_DIR%\BattleNetSetup.exe" (start "%TEMP_DIR%\BattleNetSetup.exe") else (echo Failed to download Battle.net installer.)
goto :eof

:INSTALL_EA_SILENT
echo [6/6] Installing EA App...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "& {$ProgressPreference='SilentlyContinue'; $url='https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe'; $output='%TEMP_DIR%\EAappInstaller.exe'; $wc=New-Object System.Net.WebClient; $wc.DownloadFile($url,$output); Write-Host 'EA App download complete' -ForegroundColor Green}"
if exist "%TEMP_DIR%\EAappInstaller.exe" (start "%TEMP_DIR%\EAappInstaller.exe") else (echo Failed to download EA App installer.)
goto :eof

:EXIT
cls
echo.
echo Thank you for using Gaming Platforms Setup Script!
echo.
timeout /t 2 >nul
exit /b 0
