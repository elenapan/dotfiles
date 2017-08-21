#!/usr/bin/env bash

# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after 
#    colors (f = foreground, b = background), and use the 'off'
#    feature for anything you turn on.

initializeANSI()
{
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackb="${esc}[1;30m";   redb="${esc}[1;31m";    greenb="${esc}[1;32m"
  yellowb="${esc}[1;33m"   blueb="${esc}[1;34m";   purpleb="${esc}[1;35m"
  cyanb="${esc}[1;36m";    whiteb="${esc}[1;37m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

numbers (){

initializeANSI

cat << EOF

${blackf}11111111${reset} ${redf}22222222${reset} ${greenf}33333333${reset} ${yellowf}44444444${reset} ${bluef}55555555${reset} ${purplef}66666666${reset} ${cyanf}77777777${reset} ${whitef}88888888${reset}
${blackb}11111111${reset} ${redb}22222222${reset} ${greenb}33333333${reset} ${yellowb}44444444${reset} ${blueb}55555555${reset} ${purpleb}66666666${reset} ${cyanb}77777777${reset} ${whiteb}88888888${reset}

EOF

}

blocks (){

initializeANSI

cat << EOF

${blackf}████${reset}${blackb}████${reset} ${redf}████${reset}${redb}████${reset} ${greenf}████${reset}${greenb}████${reset} ${yellowf}████${reset}${yellowb}████${reset} ${bluef}████${reset}${blueb}████${reset} ${purplef}████${reset}${purpleb}████${reset} ${cyanf}████${reset}${cyanb}████${reset} ${whitef}████${reset}${whiteb}████${reset}
${blackf}████${reset}${blackb}████${reset} ${redf}████${reset}${redb}████${reset} ${greenf}████${reset}${greenb}████${reset} ${yellowf}████${reset}${yellowb}████${reset} ${bluef}████${reset}${blueb}████${reset} ${purplef}████${reset}${purpleb}████${reset} ${cyanf}████${reset}${cyanb}████${reset} ${whitef}████${reset}${whiteb}████${reset}
${blackf}████${reset}${blackb}████${reset} ${redf}████${reset}${redb}████${reset} ${greenf}████${reset}${greenb}████${reset} ${yellowf}████${reset}${yellowb}████${reset} ${bluef}████${reset}${blueb}████${reset} ${purplef}████${reset}${purpleb}████${reset} ${cyanf}████${reset}${cyanb}████${reset} ${whitef}████${reset}${whiteb}████${reset}

EOF

}

case $1 in
	b)	blocks;;
	n)	numbers;;
	a)	blocks && numbers;;
	*)  blocks && numbers;;
esac
