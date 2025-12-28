# Security Information

## Why Antivirus Software May Flag This Script

This script is **safe and open-source**. However, it may be flagged by some antivirus software as a false positive. Here's why:

### Behavioral Patterns That Trigger Detection

1. **Administrator Privilege Requests**: The script automatically requests admin privileges, which is necessary for:
   - Installing Windows updates
   - Installing software to Program Files
   - Making system-level changes

2. **Downloading Executables**: The script downloads official installers from vendor websites:
   - Steam (Valve Corporation)
   - Ubisoft Connect (Ubisoft)
   - GOG Galaxy (GOG.com)
   - Epic Games Launcher (Epic Games)
   - Battle.net (Blizzard Entertainment)
   - EA App (Electronic Arts)

3. **PowerShell Execution**: The script uses PowerShell with `-ExecutionPolicy Bypass` to:
   - Install Windows updates via PSWindowsUpdate module
   - Download files with progress tracking
   - This is a standard approach for automation scripts

4. **Automated Installer Execution**: The script automatically launches downloaded installers, which some antivirus software views as potentially suspicious behavior.

## Why This Script Is Safe

### Open Source & Transparent
- **Fully Open Source**: All code is visible in this repository
- **No Obfuscation**: The script contains plain, readable batch and PowerShell commands
- **No Hidden Behavior**: Every action is documented and visible

### Official Sources Only
- **Direct Vendor Downloads**: All installers are downloaded directly from official vendor CDNs:
  - `cdn.cloudflare.steamstatic.com` (Steam)
  - `ubistatic3-a.akamaihd.net` (Ubisoft)
  - `webinstallers.gog-statics.com` (GOG)
  - `launcher-public-service-prod06.ol.epicgames.com` (Epic Games)
  - `downloader.battle.net` (Blizzard)
  - `origin-a.akamaihd.net` (EA)
- **No Third-Party Hosts**: We never download from file-sharing sites or unofficial sources
- **PSWindowsUpdate Module**: Official PowerShell module from Microsoft's PowerShell Gallery

### User Control
- **Interactive Menu**: User selects what to install
- **Confirmation Prompts**: Important actions require user confirmation
- **Standard Installers**: Official vendor installers run with their own UI for user review

### No Data Collection
- **No Telemetry**: The script does not collect or transmit any user data
- **No Network Communication**: Except for downloading official installers and Windows updates
- **No Registry Modifications**: Beyond what the official installers perform
- **Temporary Storage Only**: Downloads are stored in `%TEMP%` directory

## Verifying Script Safety

### 1. Review the Source Code
The entire script is available in `setup.bat`. You can review every command before running it.

### 2. Check Download URLs
All download URLs point to official vendor domains. You can verify these by:
- Checking each vendor's official website
- Comparing with vendor documentation
- Using VirusTotal URL scanner

### 3. Scan Downloaded Files
Before installation, you can manually scan downloaded files in `%TEMP%\WindowsSetup\` with your antivirus software.

### 4. Submit to VirusTotal
You can submit `setup.bat` to [VirusTotal](https://www.virustotal.com) for analysis by multiple antivirus engines.

### 5. Review Permissions
The script only requests admin privileges when necessary. You can decline the elevation prompt if you're uncomfortable.

## Common False Positive Indicators

Antivirus software often flags scripts with these characteristics:
- ✅ **Downloads executables** - Legitimate for software installers
- ✅ **Requests admin rights** - Required for system software installation
- ✅ **Uses PowerShell** - Standard automation tool on Windows
- ✅ **Modifies system** - Installing software requires system changes
- ✅ **Batch file automation** - Legitimate scripting approach

## What You Can Do

### If Your Antivirus Blocks the Script

1. **Review the code yourself** to verify it's safe
2. **Add an exception** in your antivirus software for this script
3. **Temporarily disable** antivirus while running (not recommended unless you trust the source)
4. **Report false positive** to your antivirus vendor with a link to this repository

### Whitelist This Script

Most antivirus software allows you to whitelist specific files or folders:

**Windows Defender**:
1. Open Windows Security
2. Go to Virus & threat protection
3. Click "Manage settings" under Virus & threat protection settings
4. Scroll down to Exclusions
5. Click "Add or remove exclusions"
6. Add the folder containing `setup.bat`

**Other Antivirus Software**:
Consult your antivirus documentation for adding exceptions or exclusions.

## Reporting Security Issues

If you discover an actual security vulnerability (not a false positive), please:

1. **Do not** open a public issue
2. Contact the repository maintainer directly
3. Provide detailed information about the vulnerability
4. Allow time for the issue to be addressed

## Best Practices When Using This Script

1. **Download from official repository only**: Always get the script from this GitHub repository
2. **Review before running**: Read through the script to understand what it does
3. **Run with caution**: Only run scripts you understand and trust
4. **Keep antivirus updated**: An updated antivirus is less likely to have false positives
5. **Check for updates**: Ensure you're using the latest version of the script

## Additional Resources

- [Microsoft: Understanding Script Security](https://docs.microsoft.com/en-us/powershell/scripting/learn/security/)
- [VirusTotal](https://www.virustotal.com) - Multi-engine malware scanner
- [Windows Defender False Positive Reporting](https://www.microsoft.com/en-us/wdsi/filesubmission)

## License

This script is released under the MIT License. See LICENSE file for details.
