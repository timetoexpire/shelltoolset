#!/bin/bash

## Copyright timetoexpire.co.uk 2024 (MIT License) https://github.com/timetoexpire/shelltoolset

function Truth() {
  # Truth <<ReturnString>> <<PreDefined Result>> <<Question being asked>>
  # 0=Y;T;YES;TRUE
  # 1=N;F;NO;FALSE;* # This is default if not Yes/True

  local TruthResult="$1"
  local TruthDefault="$2"
  local TruthQuestion=""
  local TruthAnswer=""
  local TruthReturn="X"

  for (( c=3; c<=$#; c++ ))
  do    
    TruthQuestion+="${!c}"

    if [ $c -ne $#  ]; then
      TruthQuestion+=" "
    else
      TruthQuestion+=": "
    fi
  done

  read -e -p "$TruthQuestion" -i "$TruthDefault" TruthAnswer
  TruthAnswer="${TruthAnswer^^}"

  case $TruthAnswer in
    "Y")
      TruthReturn="0"
      ;;
    "YES")
      TruthReturn="0"
      ;;
    "T")
      TruthReturn="0"
      ;;
    "TRUE")
      TruthReturn="0"
      ;;
    *)
      TruthReturn="1"
      ;;
  esac
  

  eval "$TruthResult=\"$TruthReturn\"" ## && echo "$TruthResult=\"$TruthReturn\" # TruthAnswer[$TruthAnswer] TruthReturn[$TruthReturn]"
}

echo "Y, YES, T, True are valid as truth [0]. Any thing else is un-true [1]"
Truth pet True The dog is best pet
Truth internet No "Do you think internet is pointless"

echo "pet:[$pet]  internet:[$internet]"
