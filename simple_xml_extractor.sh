#!/bin/bash
## change to "bin/sh" when necessary

## Copyright timetoexpire.co.uk 2022 (MIT License) https://github.com/timetoexpire/shelltoolset

Simple_XML_testdata () {
  simple_XML_testdata=$'<?xml version=\"1.0\"?>\n'
  simple_XML_testdata+=$'<ocs>\n'
  simple_XML_testdata+=$' <meta>\n'
  simple_XML_testdata+=$'  <status>ok</status>\n'
  simple_XML_testdata+=$'  <statuscode>1066</statuscode>\n'
  simple_XML_testdata+=$'  <message>OK</message>\n'
  simple_XML_testdata+=$' </meta>\n'
  simple_XML_testdata+=$' <data>\n'
  simple_XML_testdata+=$'   <greenscreen>James</greenscreen = "BBC">\n'
  simple_XML_testdata+=$'   <bluescreen>Sam</bluescreen>\n'
  simple_XML_testdata+=$'   <greenscreen>Alice</greenscreen>\n'
  simple_XML_testdata+=$'  </data>\n'
  simple_XML_testdata+=$' </ocs>\n'
  simple_XML_testdata+=$'}'
}

Simple_XML_extractor () {
  # $1=is XML data
  # $2=is XML element processing

  # $simple_XML_result is result if found element

    if [ -z "$1" ]; then
    echo "Simple_XML_extractor unset XML data in \$1 [\$simple_XML_data]"
    exit 1
  fi
  if [ -z "$2" ]; then
    echo "Simple_XML_extractor defined element in \$2 [\$simple_XML_object]"
    exit 1
  fi
  
  simple_XML_data=$1
  simple_XML_object=$2

  # This will find up <$simple_XML_object>
  simple_XML_remaining=${simple_XML_data#*<$simple_XML_object>}
  # This is result you looking for
  simple_XML_result=${simple_XML_remaining%%</$simple_XML_object*}
  if [ "$simple_XML_result" == "$simple_XML_data" ]; then
    # if the element is not available it will return $simple_XML_result=NULL
    simple_XML_result=""
    #exit
  fi
  # Some tidding up, will anything before </$simple_XML_object> give the remain XML data
  simple_XML_remaining=${simple_XML_remaining#*</$simple_XML_object}
  simple_XML_remaining=${simple_XML_remaining#*>}
}

Simple_XML_testdata

echo "XML DATA [$simple_XML_testdata]"

Simple_XML_extractor "$simple_XML_testdata" "status" && echo "Status is reporting that it [$simple_XML_result]"

Simple_XML_extractor "$simple_XML_testdata" "bluescreen" && echo "Today blue stage [$simple_XML_result]"

Simple_XML_extractor "$simple_XML_testdata" "greenscreen" && echo "Tommorow green stage [$simple_XML_result]"
Simple_XML_extractor "$simple_XML_remaining" "greenscreen" && echo "also on green stage [$simple_XML_result]"

Simple_XML_extractor "$simple_XML_testdata" "bluescreen" && echo "Next week on blue stage [$simple_XML_result]"
Simple_XML_extractor "$simple_XML_remaining" "greenscreen" && echo "also with green stage [$simple_XML_result]"
Simple_XML_extractor "$simple_XML_remaining" "greenscreen" && echo "also with green stage [$simple_XML_result]"

