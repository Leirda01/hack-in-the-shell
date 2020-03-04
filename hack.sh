#!/usr/bin/env bash

function try { echo -en "$1\n"; }
function treasy { try $1 | tr $2 $3; }

function looooower { treasy $1 [:upper:] [:lower:]; }
function UUUUUPPER { treasy $1 [:lower:] [:upper:]; }
function inversion { treasy $1 [:lower:][:upper:] [:upper:][:lower:]; }

function LoWeRUpPeR {
  looooower $1
  UUUUUPPER $1
  inversion $1
  UUUUUPPER $1 | sed -r 's/(.)(.)/\l\1\2/g' # BaSh…
  UUUUUPPER $1 | sed -r 's/(.)(.)/\1\l\2/g' # bAsH…
  looooower $1 | sed -r 's/./\u&/' # Bash…
}

function l33t {
  for many in $(LoWeRUpPeR $1); do
    treasy $many oieasgtOIEASGT 01345670134567
  done
}

function express {
  for many in $(LoWeRUpPeR $1; l33t $1); do
    echo $many | sed -r 's/$/:)/'
    echo $many | sed -r 's/$/!/'
  done
}

for pass in $(cat $1); do
  try $pass
  LoWeRUpPeR $pass;
  l33t $pass;
  express $pass;
done
