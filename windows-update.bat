@echo off
setlocal enabledelayedexpansion

:: Windows Update Script
:: Automated Windows Update using PSWindowsUpdate module

cls
echo ============================================
echo         Windows Update Script
echo ============================================
echo.
echo Checking for administrator privileges...

:: Check for admin rights and auto-elevate if needed (skip if called from elevated setup.bat)
if /i "%1"=="ALREADY_ELEVATED" (
    echo Running in already-elevated context...
) else (
    net session >nul 2>&1
    if %errorlevel% neq 0 (
        echo This script requires administrator privileges.
        echo Requesting elevation...
        echo.
        
        :: Re-launch the script with admin rights
        powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
        exit /b 0
    )
)

echo Starting Windows Update...
echo.
echo [Step 1/3] Installing PSWindowsUpdate module if not present...
powershell -ExecutionPolicy Bypass -Command ^
"try { ^
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; ^
  if (!(Get-Module -ListAvailable -Name PSWindowsUpdate)) { ^
    Write-Host 'Installing module...' -ForegroundColor Yellow; ^
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -ErrorAction Stop | Out-Null; ^
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted -ErrorAction Stop; ^
    Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser -AllowClobber -SkipPublisherCheck -ErrorAction Stop; ^
    Write-Host 'Module installed successfully!' -ForegroundColor Green ^
  } else { ^
    Write-Host 'Module already installed' -ForegroundColor Green ^
  } ^
} catch { ^
  Write-Host \"ERROR: Failed to install PSWindowsUpdate module: $_\" -ForegroundColor Red; ^
  exit 1 ^
}"

if %errorlevel% neq 0 (
    echo.
    echo Module installation failed. Please check your internet connection and try again.
    echo You may need to run PowerShell as Administrator and manually install the module:
    echo   Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser
    echo.
    pause
    exit /b 1
)

echo.
echo [Step 2/3] Scanning for updates...
powershell -ExecutionPolicy Bypass -Command "Import-Module PSWindowsUpdate; Get-WindowsUpdate"

echo.
set /p confirm="Do you want to install these updates? (Y/N): "
if /i "%confirm%"=="Y" (
    echo [Step 3/3] Installing updates... This may take a while.
    powershell -ExecutionPolicy Bypass -Command "Import-Module PSWindowsUpdate; Install-WindowsUpdate -AcceptAll -AutoReboot"
    echo.
    echo Updates installed successfully.
) else (
    echo Update installation cancelled.
)

echo.
pause
exit /b 0
