#!/bin/sh

# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after 
#    colors (f = foreground, b = background), and use the 'off'
#    feature for anything you turn on.
# Author: thevdude
# Source: http://crunchbang.org/forums/viewtopic.php?pid=144700#p144700

initializeANSI()
{
 esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

clear 

initializeANSI

cat << EOF

 ${boldon}${whitef}    ▄▄▄${reset}
 ${boldon}${whitef} ▄█████▄▄ ${reset}
 ${boldon}${whitef}███${cyanb}▀▀▀▀${blackb}▀${cyanb}▀${blackb}▀${cyanb}▀${reset}
 ${boldon}${whitef}███${cyanb}▄   ${boldoff}${blackf}▀ ▀${reset}${cyanf}▀${reset}
 ${boldon}${whitef} ▄${cyanb}  ${reset}${boldon}${whitef}█████▄ ${boldoff}${redf}█▄${reset}
 ${boldoff}${redf}▀▀${reset}${boldon}${redb}${whitef}▄${cyanb}▄   ${redb}▄▄▄${reset}${boldoff}${redf}▀██▀${reset}
 ${boldon}${whitef} ██▀▀▀██▀  ${boldoff}${redf}▀${reset}
 ${boldon}${whitef} ▀▀▀▀ ▀▀▀▀${reset}
 
EOF
