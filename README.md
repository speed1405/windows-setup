# Windows Setup Script

A comprehensive batch script for Windows that provides a menu-driven interface to perform Windows updates and install popular gaming platforms.

## Features

- **Windows Updates**: Automatically check and install Windows updates using PowerShell
- **Gaming Platform Installation**: Easy installation of:
  - Steam
  - Ubisoft Connect
  - GOG Galaxy
  - Epic Games Launcher
  - Battle.net
  - EA App
- **Batch Installation**: Install all gaming platforms at once
- **User-friendly Menu**: Simple numbered menu system for easy navigation

## Requirements

- Windows 10 or later
- Internet connection for downloading installers
- Administrator privileges (required for Windows Updates)

## Usage

1. Download the `setup.bat` file
2. Run the script:
   - For gaming platform installations: Simply double-click `setup.bat`
   - For Windows Updates: Right-click `setup.bat` and select "Run as administrator"

3. Follow the on-screen menu:
   - Enter the number corresponding to your choice
   - Follow prompts for each installation

## Menu Options

```
1. Run Windows Updates        - Check and install Windows updates
2. Install Steam              - Download and install Steam client
3. Install Ubisoft Connect    - Download and install Ubisoft Connect
4. Install GOG Galaxy         - Download and install GOG Galaxy
5. Install Epic Games Launcher - Download and install Epic Games Launcher
6. Install Battle.net         - Download and install Battle.net
7. Install EA App             - Download and install EA App
8. Install All Gaming Platforms - Install all gaming platforms at once
9. Exit                       - Exit the script
```

## How It Works

### Windows Updates
- Uses PowerShell and the PSWindowsUpdate module
- Automatically installs the module if not present with enhanced reliability:
  - Uses TLS 1.2 for secure downloads
  - Bypasses execution policy restrictions
  - Installs to current user scope (no admin needed for module installation)
  - Includes comprehensive error handling
- Scans for available updates and allows you to review before installing
- Supports automatic reboot if required
- Shows step-by-step progress (Step 1/3, Step 2/3, Step 3/3)

### Gaming Platform Installations
- Downloads official installers from vendor websites
- **Real-time progress bars** showing download progress with file sizes
- Stores installers temporarily in `%TEMP%\WindowsSetup`
- Launches installers for user to complete
- Provides feedback on download and installation status
- Color-coded status messages (Green for success, Yellow for in-progress)

## Notes

- Gaming platform installers will open and require user interaction to complete
- Windows Updates may require a system restart
- Internet connection is required for all downloads
- Some antivirus software may flag downloads - these are official installers from vendors

## License

MIT License - Feel free to use and modify as needed.