#!/bin/bash

## Copyright timetoexpire.co.uk 2022 (MIT License) https://github.com/timetoexpire/shelltoolset

# > masquerade.sh -D : To remove NAT"
# > masquerade.sh -I : To add NAT"

#Change network device names in $_devices array as you need
_devices=("eth0" "eth1" "wlan0" "wlan1")

# _switch as "-I" is add
# _switch as "-D" is delete, also can be ""
if [ -z $1 ];
then
  _switch="-D"
else
  _switch="$1"
fi

echo "MASQUERADE devices ${#_devices[@]}: ${_devices[@]} using switch of $_switch"

for i in ${!_devices[@]};
do
#  echo "> iptables -t nat $_switch POSTROUTING -o ${_devices[i]} -j MASQUERADE"
  sudo iptables -t nat $_switch POSTROUTING -o ${_devices[i]} -j MASQUERADE
#  echo "> ip6tables -t nat $_switch POSTROUTING -o ${_devices[i]} -j MASQUERADE"
  sudo iptables -t nat $_switch POSTROUTING -o ${_devices[i]} -j MASQUERADE
done
