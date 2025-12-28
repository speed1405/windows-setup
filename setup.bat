@echo off
setlocal enabledelayedexpansion

:: Windows Setup Script
:: Handles Windows updates and gaming platform installations

:MENU
cls
echo ============================================
echo         Windows Setup Script
echo ============================================
echo.
echo 1. Run Windows Updates
echo 2. Install Steam
echo 3. Install Ubisoft Connect
echo 4. Install GOG Galaxy
echo 5. Install Epic Games Launcher
echo 6. Install Battle.net
echo 7. Install All Gaming Platforms
echo 8. Exit
echo.
echo ============================================
set /p choice="Enter your choice (1-8): "

if "%choice%"=="1" goto WINDOWS_UPDATE
if "%choice%"=="2" goto INSTALL_STEAM
if "%choice%"=="3" goto INSTALL_UBISOFT
if "%choice%"=="4" goto INSTALL_GOG
if "%choice%"=="5" goto INSTALL_EPIC
if "%choice%"=="6" goto INSTALL_BATTLENET
if "%choice%"=="7" goto INSTALL_ALL
if "%choice%"=="8" goto EXIT

echo Invalid choice. Please try again.
timeout /t 2 >nul
goto MENU

:WINDOWS_UPDATE
cls
echo ============================================
echo         Running Windows Updates
echo ============================================
echo.
echo Checking for administrator privileges...

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This option requires administrator privileges.
    echo Please run this script as Administrator.
    echo.
    pause
    goto MENU
)

echo Starting Windows Update...
echo.
echo Installing PSWindowsUpdate module if not present...
powershell -Command "if (!(Get-Module -ListAvailable -Name PSWindowsUpdate)) { Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force; Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted; Install-Module -Name PSWindowsUpdate -Force }"

echo.
echo Scanning for updates...
powershell -Command "Import-Module PSWindowsUpdate; Get-WindowsUpdate"

echo.
set /p confirm="Do you want to install these updates? (Y/N): "
if /i "%confirm%"=="Y" (
    echo Installing updates... This may take a while.
    powershell -Command "Import-Module PSWindowsUpdate; Install-WindowsUpdate -AcceptAll -AutoReboot"
    echo.
    echo Updates installed successfully.
) else (
    echo Update installation cancelled.
)

echo.
pause
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
powershell -Command "Invoke-WebRequest -Uri 'https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe' -OutFile '%TEMP_DIR%\SteamSetup.exe'"

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
powershell -Command "Invoke-WebRequest -Uri 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe' -OutFile '%TEMP_DIR%\UbisoftConnectInstaller.exe'"

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
powershell -Command "Invoke-WebRequest -Uri 'https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe' -OutFile '%TEMP_DIR%\GOGGalaxySetup.exe'"

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
powershell -Command "Invoke-WebRequest -Uri 'https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi' -OutFile '%TEMP_DIR%\EpicGamesLauncherInstaller.msi'"

if exist "%TEMP_DIR%\EpicGamesLauncherInstaller.msi" (
    echo.
    echo Running Epic Games Launcher installer...
    start /wait msiexec /i "%TEMP_DIR%\EpicGamesLauncherInstaller.msi" /quiet
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
powershell -Command "Invoke-WebRequest -Uri 'https://downloader.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live' -OutFile '%TEMP_DIR%\BattleNetSetup.exe'"

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

:INSTALL_ALL
cls
echo ============================================
echo     Installing All Gaming Platforms
echo ============================================
echo.
echo This will install Steam, Ubisoft Connect, GOG Galaxy,
echo Epic Games Launcher, and Battle.net.
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

echo.
echo All gaming platforms have been queued for installation.
echo.
pause
goto MENU

:INSTALL_STEAM_SILENT
echo [1/5] Installing Steam...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "Invoke-WebRequest -Uri 'https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe' -OutFile '%TEMP_DIR%\SteamSetup.exe'" 2>nul
if exist "%TEMP_DIR%\SteamSetup.exe" start "%TEMP_DIR%\SteamSetup.exe"
goto :eof

:INSTALL_UBISOFT_SILENT
echo [2/5] Installing Ubisoft Connect...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "Invoke-WebRequest -Uri 'https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe' -OutFile '%TEMP_DIR%\UbisoftConnectInstaller.exe'" 2>nul
if exist "%TEMP_DIR%\UbisoftConnectInstaller.exe" start "%TEMP_DIR%\UbisoftConnectInstaller.exe"
goto :eof

:INSTALL_GOG_SILENT
echo [3/5] Installing GOG Galaxy...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "Invoke-WebRequest -Uri 'https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe' -OutFile '%TEMP_DIR%\GOGGalaxySetup.exe'" 2>nul
if exist "%TEMP_DIR%\GOGGalaxySetup.exe" start "%TEMP_DIR%\GOGGalaxySetup.exe"
goto :eof

:INSTALL_EPIC_SILENT
echo [4/5] Installing Epic Games Launcher...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "Invoke-WebRequest -Uri 'https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi' -OutFile '%TEMP_DIR%\EpicGamesLauncherInstaller.msi'" 2>nul
if exist "%TEMP_DIR%\EpicGamesLauncherInstaller.msi" start msiexec /i "%TEMP_DIR%\EpicGamesLauncherInstaller.msi"
goto :eof

:INSTALL_BATTLENET_SILENT
echo [5/5] Installing Battle.net...
set "TEMP_DIR=%TEMP%\WindowsSetup"
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
powershell -Command "Invoke-WebRequest -Uri 'https://downloader.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live' -OutFile '%TEMP_DIR%\BattleNetSetup.exe'" 2>nul
if exist "%TEMP_DIR%\BattleNetSetup.exe" start "%TEMP_DIR%\BattleNetSetup.exe"
goto :eof

:EXIT
cls
echo.
echo Thank you for using Windows Setup Script!
echo.
timeout /t 2 >nul
exit /b 0
