#!/bin/bash

# Author: SuNjACk
# Source: http://crunchbang.org/forums/viewtopic.php?pid=135226#p135226

xdef="$HOME/.Xresources"
colors=( $( sed -re '/^!/d; /^$/d; /^#/d; s/(\*color)([0-9]):/\10\2:/g;' $xdef | grep 'color[01][0-9]:' | sort | sed  's/^.*: *//g' ) )

echo -e "\e[1;37m 
 Black    Red      Green    Yellow   Blue     Magenta   Cyan    White   
 ──────────────────────────────────────────────────────────────────────\e[0m"
for i in {0..7}; do echo -en "\e[$((30+$i))m ${colors[i]} \e[0m"; done
echo
for i in {8..15}; do echo -en "\e[1;$((22+$i))m ${colors[i]} \e[0m"; done
echo -e "\n"
