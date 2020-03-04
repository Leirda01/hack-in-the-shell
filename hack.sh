#!/usr/bin/env bash

function treasy {
  echo -en "$1\t" | tr $2 $3
}

function LoWeRUpPeR {
  treasy $1 [:lower:] [:upper:] # hands up!
  treasy $1 [:upper:] [:lower:] # hands down!
  treasy $1 [:lower:][:upper:] [:upper:][:lower:] # invert
  treasy $1 [:lower:] [:upper:] | sed -r 's/(.)(.)/\l\1\2/g' # alternate
  treasy $1 [:lower:] [:upper:] | sed -r 's/(.)(.)/\1\l\2/g' # the other way
}

for pass in $(cat $1); do
  echo -en "$pass\t"
  LoWeRUpPeR $pass;
  echo
done
