#!/bin/bash

## Copyright timetoexpire.co.uk 2022 (MIT License) https://github.com/timetoexpire/shelltoolset

check_install_command () {
  ## This is use to make shore for commands are install that are not part of POSIX
  check_installCommand=$1
  if [[ -z $check_installCommand ]]; then
    logger -s "$0 [[check_install_command]]: NullReferenceException; nothing defined [$check_install_command]"
    exit 1
  fi
  if ! command -v "$check_installCommand" &> /dev/null; then
    check_installCommandMessage="$check_installCommand"$' is required for this to run.\n'
    check_installCommandMessage+='(Debian)# apt install '"$check_installCommand"$'\n'
    check_installCommandMessage+='(RHEL)# yum install '"$check_installCommand"$'\n'
    check_installCommandMessage+='(OpenSUSE)# zypper install '"$check_installCommand"$'\n'
    check_installCommandMessage+='(ArchLinux)# pacman -Sy '"$check_installCommand"$'\n'
    echo "$check_installCommandMessage"
    exit 1
  fi
  
  # check_install_command curl
  # check_install_command wget
  # check_install_command jq
  # check_install_command htop
  
