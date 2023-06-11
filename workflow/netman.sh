#!/bin/bash

for A in $(seq 170 10 240); do
  sudo route  $1 add 192.168.0.$A 255.255.255.0
done

sudo route   $1 add 192.168.0.182 255.255.255.0
sudo route   $1 add 192.168.0.193 255.255.255.0
sudo route   $1 add 192.168.0.196 255.255.255.0
sudo route   $1 add 192.168.0.201 255.255.255.0
sudo route   $1 add 192.168.0.202 255.255.255.0
sudo route   $1 add 192.168.0.218 255.255.255.0
sudo route   $1 add 192.168.0.226 255.255.255.0
sudo route   $1 add 192.168.0.236 255.255.255.0
sudo route   $1 add 192.168.0.241 255.255.255.0
sudo route   $1 add 192.168.0.242 255.255.255.0

read -p "Press Enter to continue..."
