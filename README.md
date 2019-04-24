# evaFFF

This will provide relatively easy flashing of OpenWrt-based firmware to devices with EVA bootloader on Windows.

EVA-Scripts are taken from https://github.com/PeterPawn/YourFritz/tree/master/eva_tools


## Requirements

* PowerShell


## Usage

### FritzBox 4040

1. Set IP/subnet to 192.168.178.xxx / 255.255.255.0 (xxx != 1)

2. Connect computer to switch port 1 (do not switch on device)

3. Open PowerShell and navigate to repository folder

4. Run the following line and start device *afterwards*:

   - `.\EVA-Discover.ps1 -maxWait 120 -Debug -Verbose`

   - If connect was insuccessful, just restart the device (login will only work if the script is running during boot)

5. If connected, run the following, otherwise shut down the device and redo 4

   - `.\EVA-FTP-Client.ps1 -Verbose -Debug -ScriptBlock { UploadFlashFile <path-to-image-file> mtd1 }`

   - If flashing fails, you can retry as often as you wish (as long as the connection is still alive). But you should find your error first ;-)

6. After a successful upload, restart the device with:

   - `.\EVA-FTP-Client.ps1 -Verbose -Debug -ScriptBlock { RebootTheDevice }`

7. If everything went well, your device will now start with the Freifunk/OpenWrt firmware of your choice.
