#!/bin/bash

CheckFor_WSL=$(grep "microsoft-standard-WSL" /proc/version)

echo "cat /proc/version [$(cat /proc/version)]"
echo "String output for \$CheckFor_WSL [$CheckFor_WSL]"

# If want to check WSL is not true, else it is using WSL
if [ -z "$CheckFor_WSL" ]; then
  echo "[-z] Not using WSL"
else
  echo "[-z] WSL in use"
fi

# If want to check WSL is true, else it not using WSL
if [ ! -z "$CheckFor_WSL" ]; then
  echo "[! -z] WSL in use"
else
  echo "[! -z] Not using WSL"
fi
