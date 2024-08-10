#!/bin/bash

## Copyright timetoexpire.co.uk 2024 (MIT License) https://github.com/timetoexpire/shelltoolset

function AryInfo() {
  local arrayName="$1"

  echo "AryInfo arrayName [$arrayName]"

  local evalStr="echo \"AryInfo data [\${$arrayName[@]}]\""
#  echo $evalStr
  eval $evalStr

  evalStr="echo \"ArrInfo length [\${#$arrayName[@]}]\""
#  echo $evalStr
  eval $evalStr

   evalStr="for (( index=0; index<\${#$arrayName[@]}; index++ )); do "
   evalStr+="echo \"\$index: [\${$arrayName[\$index]}]\"; "
   evalStr+="done"
#   echo "evalStr[$evalStr]"
   eval $evalStr
}

function AryAppend() {
  local arrayName="$1"
  local arrayData=()
  local evalStr

  for (( index=2; index<=$#; index++ )); do
    evalStr="$arrayName+=(\"\$$index\")"
#    echo "evalStr[$evalStr]"
    eval $evalStr
  done
}

AryAppend TestME "THE HUNCHBACK OF NOTRE DAME" alex
AryAppend TestME "PETER PAN" alice "JACK PUMPKINHEAD"
AryAppend TestME jane
AryAppend TestME mike

AryAppend cat "Siamese cat" "British Shorthair" "Maine Coon" "Persian cat" "Ragdoll" "Sphynx cat"
AryAppend cat Abyssinian
AryAppend cat "American Shorthair" "Exotic Shorthair" "Burmese cat" Birman "Scottish Fold"

AryAppend dog "German Shepherd" Bulldog "Labrador Retriever" "French Bulldog"
AryAppend dog "Siberian Husky" Beagle "Alaskan Malamute" "Poodle" "Chihuahua"
AryAppend dog "Australian Cattle Dog" Dachshund "Bernese Mountain Dog"

AryInfo TestME
AryInfo dog
AryInfo cat
