#!/bin/bash

echo "move to working directory"
read -p "Press Enter to continue..."
cd "$1"

echo "start host node.."
start "collector" node hosts-data-collector.js "$3.170"
for ((A=180; A<=240; A+=10)); do
  start "host$A" node host-raw-data.js "$3.$A" "$4" "$3.170"
done

read -p "Press Enter to continue..."
start "host182" node host-raw-data.js "$3.182" 30001 "$3.170"
start "host193" node host-raw-data.js "$3.193" 30001 "$3.170"
start "host196" node host-raw-data.js "$3.196" 30001 "$3.170"
start "host201" node host-raw-data.js "$3.201" 30001 "$3.170"
start "host202" node host-raw-data.js "$3.202" 30001 "$3.170"
start "host218" node host-raw-data.js "$3.218" 30001 "$3.170"
start "host226" node host-raw-data.js "$3.226" 30001 "$3.170"
start "host236" node host-raw-data.js "$3.236" 30001 "$3.170"
start "host241" node host-raw-data.js "$3.241" 30001 "$3.170"
start "host242" node host-raw-data.js "$3.242" 30001 "$3.170"

echo "Prepare to kill host process"
read -p "Press Enter to continue..."
for ((A=180; A<=240; A+=10)); do
  pkill -f "host$A"
done
pkill -f "host182"
pkill -f "host193"
pkill -f "host196"
pkill -f "host201"
pkill -f "host202"
pkill -f "host218"
pkill -f "host226"
pkill -f "host236"
pkill -f "host241"
pkill -f "host242"

echo "Prepare to kill collector process"
read -p "Press Enter to continue..."
pkill -f "collector"

echo "done."
read -p "Press Enter to continue..."
