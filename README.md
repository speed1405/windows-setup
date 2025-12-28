# Windows Setup Script

A comprehensive set of batch scripts for Windows that provides automated Windows updates and gaming platform installations, now separated for better organization.

## Features

- **Windows Updates**: Automatically check and install Windows updates using PowerShell (in `windows-update.bat`)
- **Gaming Platform Installation**: Easy installation of popular gaming platforms (in `gaming-setup.bat`):
  - Steam
  - Ubisoft Connect
  - GOG Galaxy
  - Epic Games Launcher
  - Battle.net
  - EA App
- **Batch Installation**: Install all gaming platforms at once
- **User-friendly Menu**: Simple numbered menu system for easy navigation
- **Modular Design**: Separate scripts for different purposes - run them independently or through the main launcher

## Files

- **`setup.bat`** - Main launcher that provides a menu to run Windows Update or Gaming Platform setup
- **`windows-update.bat`** - Standalone script for Windows updates (can be run directly)
- **`gaming-setup.bat`** - Standalone script for gaming platform installations (can be run directly)

## Requirements

- Windows 10 or later
- Internet connection for downloading installers
- Administrator privileges (required for Windows Updates only)

## Usage

### Option 1: Using the Main Launcher
1. Download all three files: `setup.bat`, `windows-update.bat`, and `gaming-setup.bat`
2. Place them in the same directory
3. Run `setup.bat`:
   - Simply double-click `setup.bat`
   - Choose option 1 for Windows Updates or option 2 for Gaming Platforms

### Option 2: Running Scripts Directly
- **For Windows Updates**: Right-click `windows-update.bat` and select "Run as administrator"
- **For Gaming Platforms**: Double-click `gaming-setup.bat` (no admin required)

## Menu Options

### Main Launcher (setup.bat)
```
1. Run Windows Updates     - Launch Windows Update script
2. Install Gaming Platforms - Launch Gaming Platforms setup
3. Exit                     - Exit the launcher
```

### Windows Update (windows-update.bat)
- Automatically installs PSWindowsUpdate module if needed
- Scans for available updates
- Allows you to review updates before installing
- Supports automatic reboot if required

### Gaming Platforms (gaming-setup.bat)
```
1. Install Steam              - Download and install Steam client
2. Install Ubisoft Connect    - Download and install Ubisoft Connect
3. Install GOG Galaxy         - Download and install GOG Galaxy
4. Install Epic Games Launcher - Download and install Epic Games Launcher
5. Install Battle.net         - Download and install Battle.net
6. Install EA App             - Download and install EA App
7. Install All Gaming Platforms - Install all gaming platforms at once
8. Exit                       - Exit the script
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

- Scripts can be run independently or through the main launcher
- Gaming platform installers will open and require user interaction to complete
- Windows Updates may require a system restart
- Internet connection is required for all downloads
- Some antivirus software may flag downloads - these are official installers from vendors

## License

MIT License - Feel free to use and modify as needed.