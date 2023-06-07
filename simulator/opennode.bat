@ECHO off
rem ECHO "add ipv4 into interface"
rem FOR /L %A IN (100,10,120) DO netsh interface ipv4 add address "區域連線* 2" 192.168.137.%A 255.255.255.0
ECHO "move to working directory"
PAUSE
cd C:\Users\Wayne-NB\Desktop\MASTER.InService\DistributedSystem\etcd_data\simulator
call conda activate etcd_data
ECHO "start host node.."
start "collector" node host-data-collector.js 192.168.137.100
start "host1" node host-data.js 192.168.137.110 30001 192.168.137.100
start "host2" node host-data.js 192.168.137.120 30001 192.168.137.100
ECHO "Prepare to kill host process"
PAUSE
taskkill /FI "WindowTitle eq host1" /T /F
taskkill /FI "WindowTitle eq host2" /T /F
ECHO "Prepare to kill collector process"
PAUSE
taskkill /FI "WindowTitle eq collector" /T /F
rem ECHO "delete ipv4 from interface"
PAUSE
rem FOR /L %A IN (100,10,120) DO netsh interface ipv4 delete address "區域連線* 2" 192.168.137.%A
ECHO "done."
PAUSE