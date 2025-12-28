# Windows Setup Script

A unified batch script for Windows that provides automated Windows updates and gaming platform installations in one convenient menu.

## Features

- **Windows Updates**: Automatically check and install Windows updates using PowerShell
- **Gaming Platform Installation**: Easy installation of popular gaming platforms:
  - Steam
  - Ubisoft Connect
  - GOG Galaxy
  - Epic Games Launcher
  - Battle.net
  - EA App
- **Batch Installation**: Install all gaming platforms at once
- **User-friendly Menu**: Simple numbered menu system with all options in one place
- **Unified Design**: Single script with organized sections for system updates and gaming platforms

## Files

- **`setup.bat`** - Unified script containing Windows Update and Gaming Platform installation options

## ⚠️ Important: Antivirus False Positives

**This script may be flagged by some antivirus software as a false positive.** This is a common issue with automation scripts that:
- Request administrator privileges
- Download executable files
- Use PowerShell for automation

**The script is completely safe and open-source.** All code is transparent and visible in this repository. It only downloads official installers from verified vendor websites (Steam, Ubisoft, GOG, Epic Games, Battle.net, EA).

**For detailed information about why this happens and how to verify the script's safety**, please read [SECURITY.md](SECURITY.md).

### Quick Safety Verification
✅ **Open Source**: All code is visible and reviewable  
✅ **Official Sources**: Downloads only from vendor CDNs  
✅ **No Data Collection**: No telemetry or data transmission  
✅ **User Control**: Interactive menu with confirmation prompts  

If your antivirus blocks the script, you can:
1. Review the source code yourself
2. Add an exception for this script in your antivirus
3. Submit to [VirusTotal](https://www.virustotal.com) for multi-engine analysis

## Requirements

- Windows 10 or later
- Internet connection for downloading installers
- Administrator privileges will be automatically requested when needed

## Usage

1. Download `setup.bat`
2. Double-click `setup.bat` (will automatically request admin privileges)
3. Select from the menu:
   - System updates (Windows Update)
   - Individual gaming platform installations
   - Install all gaming platforms at once

## Menu Options

```
SYSTEM UPDATES:
1. Run Windows Updates         - Check and install Windows updates

GAMING PLATFORMS:
2. Install Steam               - Download and install Steam client
3. Install Ubisoft Connect     - Download and install Ubisoft Connect
4. Install GOG Galaxy          - Download and install GOG Galaxy
5. Install Epic Games Launcher - Download and install Epic Games Launcher
6. Install Battle.net          - Download and install Battle.net
7. Install EA App              - Download and install EA App
8. Install All Gaming Platforms - Install all gaming platforms at once

9. Exit                        - Exit the script
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

- The script automatically requests administrator privileges when needed
- Gaming platform installers will open and require user interaction to complete
- Windows Updates may require a system restart
- Internet connection is required for all downloads
- **Antivirus Warning**: Some antivirus software may flag this script or downloaded installers as suspicious. This is a **false positive**. All installers are downloaded directly from official vendor websites. See [SECURITY.md](SECURITY.md) for detailed information about why this happens and how to verify safety.

## License

MIT License - Feel free to use and modify as needed.