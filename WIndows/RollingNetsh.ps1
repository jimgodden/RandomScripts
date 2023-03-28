# This script was created to take multiple small packet captures using the built in Windows tool netsh
# The biggest benefit of this script is that it can be used on servers with high utilization as the multiple small captures
#   will stop the memory from filling up.
# Note: this script stops and starts the trace on the intervals specified below.  There is a good chance that a 
#   very small amount of packets will be lost between each stop and start.

# Location that you want the resulting packet capture to be saved
$logFilePath = "C:\Users\$env:USERNAME\Desktop\Trace_"
# Please specify how long you want the capture to run
$totalTimeInHours = 24
$totalTimeInSeconds = $totalTimeInHours * 3600
# Specify how often you want to stop the capture and start a new one
$cadenceOfCapturesInSeconds = 3600
$currentCount = 0
# This will ensure the capture does not run for longer than desired
$maxCount = $totalTimeInSeconds / $cadenceOfCapturesInSeconds
while ($currentCount -lt $maxCount) {
    $Logfile = "${logFilePath}$(Get-Date -Format HH-mm_dd-MM-yyyy).etl"
    netsh trace start capture=yes report=disabled filemode=single maxSize=2048 PacketTruncateBytes=100 tracefile=$Logfile
    Start-Sleep -Seconds $cadenceOfCapturesInSeconds
    netsh trace stop
    $currentCount = $currentCount + 1
}