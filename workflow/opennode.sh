#!/bin/bash

echo "move to working directory"
cd ./data\ engine/workflow/
pwd
read -p "Press any key to continue..."

npm install fastify
# %2 for env
# call conda activate %2

echo "start host node.."
# %3 for domain IP
node route ./hosts-data-collector.js "$3.170"

# ugly but fine: openode.bat {working dir} {conda env} 192.168.0 " 30001
for ((A=180; A<=240; A+=10)); do
    echo "start host$A node.."
    node ./host-raw-data.js "$3.$A" 30001 "$3.170"
done

node  ./host-raw-data.js %3.182 30001 %3.170
node  ./host-raw-data.js %3.193 30001 %3.170
# node  host-raw-data.js %3.196 30001 %3.170
# node  host-raw-data.js %3.201 30001 %3.170
# node  host-raw-data.js %3.202 30001 %3.170
# node  host-raw-data.js %3.218 30001 %3.170
# node  host-raw-data.js %3.226 30001 %3.170
# node  host-raw-data.js %3.236 30001 %3.170
# node  host-raw-data.js %3.241 30001 %3.170
# node  host-raw-data.js %3.242 30001 %3.170

echo "Prepare to kill host process"
read -p "Press any key to continue..."
# for ((A=180; A<=240; A+=10)); do
#     taskkill /FI "WindowTitle eq host$A" /T /F
# done
# taskkill /FI "WindowTitle eq host182" /T /F
# taskkill /FI "WindowTitle eq host193" /T /F
# taskkill /FI "WindowTitle eq host196" /T /F
# taskkill /FI "WindowTitle eq host201" /T /F
# taskkill /FI "WindowTitle eq host202" /T /F
# taskkill /FI "WindowTitle eq host218" /T /F
# taskkill /FI "WindowTitle eq host226" /T /F
# taskkill /FI "WindowTitle eq host236" /T /F
# taskkill /FI "WindowTitle eq host241" /T /F
# taskkill /FI "WindowTitle eq host242" /T /F

echo "Prepare to kill collector process"
read -p "Press any key to continue..."
# taskkill /FI "WindowTitle eq collector" /T /F

echo "done."
read -p "Press any key to continue..."
