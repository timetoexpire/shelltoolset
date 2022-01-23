#!/bin/bash

## Copyright timetoexpire.co.uk 2022 (MIT License) https://github.com/timetoexpire/shelltoolset
## Returns result using $CheckFor_WSL 
## "" (NULL) is not using WSL, 
## "0" is unknown version of WSL
## "1" is WSL1
## "2" is WSL2

CheckFor_WSL="/proc/sys/fs/binfmt_misc/WSLInterop"
if [ -f "$CheckFor_WSL" ]; then
  CheckFor_WSL="/proc/version"
  case "$(cat $CheckFor_WSL)" in
    *"-Microsoft ("*)
      CheckFor_WSL="1" # This is value for WSL1
      ;;
    *"-microsoft-standard-WSL2 ("*)
      CheckFor_WSL="2" # This is value for WSL2
      ;;
    *)
      CheckFor_WSL="0" # This is value if WSL version in unknown
      ;;
  esac
else
  CheckFor_WSL="" # This value NULL if WSLInterop dosnt exists
fi

## That all is need to test for WSL, below is example of how to use it

echo "CheckFor_WSL result [$CheckFor_WSL]"

echo "TEST 1 (case)"
case "$CheckFor_WSL" in
  "")
    echo "File (WSLInterop) dosnt exist so it not WSL!"
    ;;
  "0")
    echo "Unknown version of WSL?????"
    ;;
  "1")
    echo "WSL1"
    ;;
  "2")
    echo "WSL2"
    ;;
esac

echo " - -"

echo "TEST 2 (if)"
if [ -z "$CheckFor_WSL" ]; then
  echo "File (WSLInterop) dosnt exist so it not WSL!"
fi
if [ ! -z "CheckFor_WSL" ]; then
  echo "The system is using WSL, not showing version"
fi
if [ "$CheckFor_WSL" = "0" ]; then
   echo "Unknown version of WSL?????"
fi
if [ "$CheckFor_WSL" = "1" ]; then
   echo "WSL1"
fi
if [ "$CheckFor_WSL" = "2" ]; then
   echo "WSL2"
fi

