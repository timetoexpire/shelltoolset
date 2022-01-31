#!/bin/bash

## Copyright timetoexpire.co.uk 2022 (MIT License) https://github.com/timetoexpire/shelltoolset
## https://www.alice-in-wonderland.net/resources/chapters-script/alices-adventures-in-wonderland/chapter-1/
## "Alices Adventures In Wonderland" have expired there copyight protection

alice="very"
was="tired"
beginning="of"
to="sitting"
get="by"

partone="alice was beginning to get\n"

echo "1. alice [$alice]"
echo "1. was [$was]"
echo "1. beginning [$beginning]"
echo "1. to [$to]"
echo "1. get [$get]"

parttwo="$alice $was $beginning $to $get\n"

very="her"
tired="sister"
of="on"
sitting="the"
by="bank"

echo "2. alice [$(eval echo \"\$$alice\")]"
echo "2. was [$(eval echo \"\$$was\")]"
echo "2. beginning [$(eval echo \"\$$beginning\")]"
echo "2. to [$(eval echo \"\$$to\")]"
echo "2. get [$(eval echo \"\$$get\")]"

partthree="$(eval echo \"\$$alice\") $(eval echo \"\$$was\") $(eval echo \"\$$beginning\") $(eval echo \"\$$to\") $(eval echo \"\$$get\")"

echo -e "(1) $partone(2) $parttwo(3) $partthree"
