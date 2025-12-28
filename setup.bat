@echo off
setlocal enabledelayedexpansion

:: Windows Setup Script - Main Launcher
:: Launches Windows Update or Gaming Platform installation scripts

:MENU
cls
echo ============================================
echo         Windows Setup Script
echo ============================================
echo.
echo 1. Run Windows Updates
echo 2. Install Gaming Platforms
echo 3. Exit
echo.
echo ============================================
set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" goto WINDOWS_UPDATE
if "%choice%"=="2" goto GAMING_SETUP
if "%choice%"=="3" goto EXIT

echo Invalid choice. Please try again.
timeout /t 2 >nul
goto MENU

:WINDOWS_UPDATE
cls
echo Launching Windows Update script...
echo.
if exist "%~dp0windows-update.bat" (
    call "%~dp0windows-update.bat"
) else (
    echo ERROR: windows-update.bat not found in the same directory.
    echo.
    pause
)
goto MENU

:GAMING_SETUP
cls
echo Launching Gaming Platforms Setup script...
echo.
if exist "%~dp0gaming-setup.bat" (
    call "%~dp0gaming-setup.bat"
) else (
    echo ERROR: gaming-setup.bat not found in the same directory.
    echo.
    pause
)
goto MENU

:EXIT
cls
echo.
echo Thank you for using Windows Setup Script!
echo.
timeout /t 2 >nul
exit /b 0

