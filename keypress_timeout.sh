#!/bin/bash
## change to "bin/sh" when necessary

## Copyright timetoexpire.co.uk 2022 (MIT License) https://github.com/timetoexpire/shelltoolset

char_timeout=0.2
timeout_amount=10

function input_keypressed (){
  read -n1 -s -t$char_timeout input_result
}

function input_notice (){
  if [ ! -z "$input_echo" ];
  then
    echo "$input_echo"
  fi
  input_output=""
}

function input_isnull (){
  if [ -z "$input_result" ];
  then
    echo "the silent treatment"
  else
    echo "You press [$input_result]"
  fi
}

function input_check (){
  # Input [input_echo]
  # Output [input_result]
  input_notice
  input_keypressed
#  input_isnull
}


function get_date (){
  # Output [date_unix]
  date_unix=$(date '+%s')
}

function set_timeout (){
  # Input [timeout_amount]
  # Output [timeout_result]
  get_date
  timeout_result=$(( $date_unix + $timeout_amount ))
}

function hold_timeout_key (){
  # Input [timout_amount]
  # Output [input_result]
  set_timeout
  input_result=""
  until [[ $timeout_result -lt $date_unix ]] || [[ ! -z "$input_result" ]]
  do
    input_check
    get_date
  done
}

echo "You have maxmum of $timeout_amount second to press a key"
hold_timeout_key
input_isnull
timeout_amount=5
echo "You have maxmum of $timeout_amount second to press a key"
hold_timeout_key
input_isnull
