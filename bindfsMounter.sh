#!/bin/bash

## Copyright timetoexpire.co.uk 2022 (MIT License) https://github.com/timetoexpire/shelltoolset

function IsMounted() {
  local checking="$1"
  local basePath
  if [ $# -eq 1 ]; then
    basePath="$PWD"
  else
    basePath="$2"
  fi
  local checkingPath="$basePath""/""$checking"
#  echo "Checking '$checking' Path '$checkingPath'"

  if mount | grep -q "$checkingPath"; then
#    echo "True"
    return 0
  else
#    echo "False"
    return 1
  fi
}

if [ $# -lt 2 ]; then
  echo "Error No Pars [$*]"
  echo "[BindMap] [BindName]"
  echo "[BindMap] [BindName] [BindPath]"
  echo "sudo bindfs --map=root/${USER}:@root/@$(id -gn) \"\$BindMap\" \"\$BindPath/\$BindName\""
#sudo bindfs --map=root/${USER}:@root/@$(id -gn) "$bindMap" "$bindFullPath"
  exit 1
fi

if [ $# -lt 3 ]; then
  bindPath="/home/$USER/.bind-mounts"
else
  bindPath="$3"
  if [[ "$bindPath" == */ ]]; then
#    echo -n "Found bindPath [$bindPath]"
    bindPath="${bindPath%/}"
#    echo " fixed [$bindPath]"
  fi
fi

bindName="$2"

bindMap="$1"

if [[ "$bindMap" == */ ]]; then
#  echo -n "Found bindMap [$bindMap] "
  bindMap="${bindMap%/}"
#  echo "Fixed [$bindMap]"
fi

if [ ! -d "$bindMap" ]; then
  echo "BindMap dosn't exists [$bindMap]"
  exit 1
fi

bindFullPath="$bindPath""/""$bindName"

#echo "BindMap = $bindMap"
#echo "BindName = $bindName"
#echo "BindPath = $bindPath"
#echo "BindFullPath = $bindFullPath"

IsMounted "$bindName" "$bindPath"

if [ $? -eq 1 ]; then
#  echo "Seting up"
  if [ -d "$bindFullPath" ]; then
    echo "Remove all contents in directory $bindFullPath"
    sudo rm -R -v "$bindFullPath"
  fi
  mkdir -p "$bindFullPath"
  if [ ! -d "$bindFullPath" ]; then
    echo "Not able to create folder [$bindFullPath]"
    exit 1
  fi
  sudo bindfs --map=root/${USER}:@root/@$(id -gn) "$bindMap" "$bindFullPath"
  echo -n "bindfs set up as "
else
  echo -n "Already exists "
fi

echo "BindMap=$bindMap BindName=$bindName BindFullPath=$bindFullPath"


