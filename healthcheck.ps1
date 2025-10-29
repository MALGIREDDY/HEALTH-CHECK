
# =============================================
# System Health Check Script (Windows Version)
# Author: Sahana L
# =============================================

# Timestamp and log file
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logfile = "healthlog.txt"

function Write-Log($text) {
    Write-Host $text
    Add-Content $logfile $text
}

Write-Log "============================================="
Write-Log "System Health Report - $timestamp"
Write-Log "============================================="

# 1. System Date & Time
Write-Log "`n🕒 System Date & Time:"
$date = Get-Date
Write-Log $date

# 2. System Uptime
Write-Log "`n⏳ System Uptime:"
$uptime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$uptimeFormatted = (Get-Date) - $uptime
Write-Log ("System has been up for: {0} days, {1} hours, {2} minutes" -f $uptimeFormatted.Days, $uptimeFormatted.Hours, $uptimeFormatted.Minutes)

# 3. CPU Load
Write-Log "`n💻 CPU Load:"
$cpuLoad = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
Write-Log ("CPU Usage: {0:N2}%%" -f $cpuLoad)

# 4. Memory Usage
Write-Log "`n🧠 Memory Usage (MB):"
$mem = Get-CimInstance Win32_OperatingSystem
$totalMem = [math]::Round($mem.TotalVisibleMemorySize / 1024, 2)
$freeMem = [math]::Round($mem.FreePhysicalMemory / 1024, 2)
$usedMem = $totalMem - $freeMem
Write-Log "Total: $totalMem MB"
Write-Log "Used : $usedMem MB"
Write-Log "Free : $freeMem MB"

# 5. Disk Usage
Write-Log "`n💾 Disk Usage:"
Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {
    $used = ($_.Used / 1GB)
    $free = ($_.Free / 1GB)
    $total = $used + $free
    $usagePercent = if ($total -ne 0) { [math]::Round(($used / $total) * 100, 2) } else { 0 }
    Write-Log ("Drive {0}: Used {1:N2} GB / Total {2:N2} GB ({3}% used)" -f $_.Name, $used, $total, $usagePercent)
}

# 6. Top 5 Memory Processes
Write-Log "`n🔥 Top 5 Memory-Consuming Processes:"
Get-Process | Sort-Object -Descending WS | Select-Object -First 5 | ForEach-Object {
    $procName = $_.ProcessName
    $memUsage = [math]::Round($_.WS / 1MB, 2)
    Write-Log ("{0,-25} {1,8} MB" -f $procName, $memUsage)
}

# 7. Check Services
Write-Log "`n🔍 Service Status:"
$services = "wuauserv","Spooler"   # Add more if needed
foreach ($s in $services) {
    $status = (Get-Service -Name $s).Status
    Write-Log "$s : $status"
}

Write-Log "`n---------------------------------------------"
Write-Log ("Health check completed at: " + (Get-Date))
Write-Log "---------------------------------------------`n"

Write-Host "`n✅ Health check completed successfully! Log saved in $logfile"
