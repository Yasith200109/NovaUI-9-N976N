$ErrorActionPreference = "Stop"

Write-Host "NovaUI 9 N976N - non-destructive host check"
Write-Host "OS:"
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, OSArchitecture
Write-Host "CPU:"
Get-CimInstance Win32_Processor | Select-Object -First 1 Name, NumberOfCores, NumberOfLogicalProcessors
Write-Host "Memory (GB):"
$computer = Get-CimInstance Win32_ComputerSystem
[math]::Round($computer.TotalPhysicalMemory / 1GB, 2)
Write-Host "System drive free space (GB):"
$drive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$env:SystemDrive'"
[math]::Round($drive.FreeSpace / 1GB, 2)
Write-Host "Tools:"
foreach ($tool in @("git", "python", "adb", "fastboot")) {
    $cmd = Get-Command $tool -ErrorAction SilentlyContinue
    if ($cmd) { Write-Host "$tool : $($cmd.Source)" } else { Write-Host "$tool : not found" }
}
Write-Host "This script only reports host information; it does not modify devices."
