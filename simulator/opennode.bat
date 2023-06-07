@ECHO off
rem ECHO "add ipv4 into interface"
rem FOR /L %A IN (170,10,190) DO netsh interface ipv4 add address "乙太網路" 192.168.0.%A 255.255.255.0
ECHO "move to working directory"
PAUSE
rem pass working path to %1
rem "D:\Wayne\DSys\etcd"
cd %1
call conda activate dsys_lab
ECHO "start host node.."
start "collector" node host-data-collector.js 192.168.0.170
start "host1" node host-data.js 192.168.0.180 30001 192.168.0.170
start "host2" node host-data.js 192.168.0.190 30001 192.168.0.170
ECHO "Prepare to kill host process"
PAUSE
taskkill /FI "WindowTitle eq host1" /T /F
taskkill /FI "WindowTitle eq host2" /T /F
ECHO "Prepare to kill collector process"
PAUSE
taskkill /FI "WindowTitle eq collector" /T /F
rem ECHO "delete ipv4 from interface"
PAUSE
rem FOR /L %A IN (170,10,190) DO netsh interface ipv4 delete address "乙太網路" 192.168.0.%A
ECHO "done."
PAUSE
