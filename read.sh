#!/bin/bash
## change to "bin/sh" when necessary

## Copyright timetoexpire.co.uk 2022 (MIT License) https://github.com/timetoexpire/shelltoolset

read_1_character (){
  echo "read_1_character"
  read -n1 read_input
  echo " "
  echo "You Pressed [$read_input]"
}

read_4_character (){
  echo "read_4_character"
  read -n4 read_input
  echo " "
  echo "You Pressed [$read_input]"
}

read_line (){
  echo "read_line"
  read read_input
  echo " "
  echo "You typed [$read_input]"
}

read_1_character_hidden (){
  echo "read_1_character_hidden"
  read -s -n1 read_input
  echo " "
  echo "You Pressed [$read_input]"
}

read_4_character_hidden (){
  echo "read_4_character_hidden"
  read -s -n4 read_input
  echo " "
  echo "You Pressed [$read_input]"
}

read_line_hidden (){
  echo "read_line_hidden"
  read -s read_input
  echo " "
  echo "You typed [$read_input]"
}

read_1_character_timeout (){
  echo "read_1_character_timeout (5 sec)"
  read -n1 -t5 read_input
  echo " "
  echo "You Pressed [$read_input]"
}

read_4_character_timeout (){
  echo "read_4_character (5 sec)"
  read -n4 -t5 read_input
  echo " "
  echo "You Pressed [$read_input]"
}

read_line_timeout (){
  echo "read_line_timeout  (5 sec)"
  read -t5 read_input
  echo " "
  echo "You typed [$read_input]"
}

read_1_character_timeout_hidden (){
  echo "read_1_character_timeout_hidden (5 sec)"
  read -n1 -s -t5 read_input
  echo " "
  echo "You Pressed [$read_input]"
}

read_4_character_timeout_hidden (){
  echo "read_4_character_timeout_hidden (5 sec)"
  read -n4 -s -t5 read_input
  echo " "
  echo "You Pressed [$read_input]"
}

read_line_timeout_hidden (){
  echo "read_line_hidden  (5 sec)"
  read -s -t5 read_input
  echo " "
  echo "You typed [$read_input]"
}

read_1_character_reply (){
  echo "read_1_character_reply"
  read -n1
  read_reply="$REPLY"
  echo " "
  echo "You typed [$read_reply]"
}

read_fast_scan_for_q (){
  echo "read_fast_scan_for_q"
  echo "press the q to escape"
  sleep 1
  read_fast_scan_for_q_counter=0
  read_fast_scan_for_q_bool=false
  until [ $read_fast_scan_for_q_bool == true ];
  do
    read -s -n1 -t0.1
    
    read_fast_scan_for_q_counter_string=""
    if [ $read_fast_scan_for_q_counter -gt 9999 ]; then
      read_fast_scan_for_q_counter=0
    fi
    if [ $read_fast_scan_for_q_counter -lt 1000 ]; then
      if [ $read_fast_scan_for_q_counter -lt 100 ]; then
        if [ $read_fast_scan_for_q_counter -lt 10 ]; then
          read_fast_scan_for_q_counter_string+="0"
        fi
        read_fast_scan_for_q_counter_string+="0"
      fi
      read_fast_scan_for_q_counter_string+="0"
    fi
    read_fast_scan_for_q_counter_string+="$read_fast_scan_for_q_counter"
    echo "$(date) $read_fast_scan_for_q_counter_string"
   
    if [ "$REPLY" == "q" ]; then
      read_fast_scan_for_q_bool=true
    fi
   
    if [ ! -z "$REPLY" ]; then
      echo "You press \"$REPLY\" - To exit press \"q\""
      sleep 0.4
    fi

    ((read_fast_scan_for_q_counter++))
  done
  echo "well it looks like press q, going to exit now"
}

read_flush () {
  read -s -t0
  while [ ${#REPLY} -gt 0 ]; 
  do
    read -s -t0.001 -n1
    #echo "DEBUG: RF 2 [$REPLY]"
  done
  unset $REPLY
}

while :
do
  echo "1) read_1_character"
  echo "2) read_4_character"
  echo "3) read_line"
  echo "4) read_1_character_hidden"
  echo "5) read_4_character_hidden"
  echo "6) read_line_hidden"
  echo "7) read_1_character_timeout"
  echo "8) read_4_character_timeout"
  echo "9) read_line_timeout"
  echo "a) read_1_character_timeout_hidden"
  echo "b) read_4_character_timeout_hidden"
  echo "c) read_line_timeout_hidden"
  echo "d) read_1_character_reply"
  echo "e) read_fast_scan_for_q"
  echo " "
  echo "Q) quit "

  read_flush
  read -n1 -p "? "
  echo " "
  case $REPLY in
    "1")
      read_1_character
      ;;
    "2")
      read_4_character
      ;;
    "3")
      read_line
      ;;
    "4")
      read_1_character_hidden
      ;;
    "5")
      read_4_character_hidden
      ;;
    "6")
      read_line_hidden
      ;;
    "7")
      read_1_character_timeout
      ;;
    "8")
      read_4_character_timeout
      ;;
    "9")
      read_line_timeout
      ;;
    "a")
      read_1_character_timeout_hidden
      ;;
    "b")
      read_4_character_timeout_hidden
      ;;
    "c")
      read_line_timeout_hidden
      ;;
    "d")
      read_1_character_reply
      ;;
    "e")
      read_fast_scan_for_q
      ;;
    "Q")
      echo "EXITING SCRIPT"
      exit 0
      ;;
    *)
      echo "Invaled selection [$REPLY]"
      ;;
  esac

  sleep 2
done
