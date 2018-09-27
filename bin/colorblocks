#!/bin/bash

# Show the terminal colourscheme as blocks
# Inspired by u/dkeg
# Cheers! Addy

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
d=$'\e[1m'
t=$'\e[0m'
v=$'\e[7m'

cat << EOF
 
 $f1██████$d██$t $f2██████$d██$t $f3██████$d██$t $f4██████$d██$t $f5██████$d██$t $f6██████$d██$t 
 $f1██████$d██$t $f2██████$d██$t $f3██████$d██$t $f4██████$d██$t $f5██████$d██$t $f6██████$d██$t 
 $f1██████$d██$t $f2██████$d██$t $f3██████$d██$t $f4██████$d██$t $f5██████$d██$t $f6██████$d██$t 
 $ft██████$d$f7██$t $ft██████$d$f7██$t $ft██████$d$f7██$t $ft██████$d$f7██$t $ft██████$d$f7██$t $ft██████$d$f7██$t 
 
EOF
