#!/bin/bash

## Copyright timetoexpire.co.uk 2022 (MIT License) https://github.com/timetoexpire/shelltoolset

function Get_CurrentUser()
{
; Output $_USER
  local _TEMPUSER=("$USER" "$USERNAME" "$(id -u -n)" "$(whoami)" "$USERNAME")

  for _TEMPI in ${!_TEMPUSER[@]};
  do
    if [ ! -z "${_TEMPUSER[$_TEMPI]}" ];
    then
      _USER="${_TEMPUSER[$_TEMPI]}"
    fi
  done
}

Get_CurrentUser


echo "Current user is $_USER"
