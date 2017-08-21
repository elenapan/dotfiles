#!/usr/bin/env bash

declare -i f=75 s=13 r=2000 t=0 c=1 n=0 l=0
declare -ir w=$(tput cols) h=$(tput lines)
declare -i x=$((w/2)) y=$((h/2))

declare -ar v=( [00]="\x82" [01]="\x8c" [03]="\x90"	####
	[10]="\x98" [11]="\x80" [12]="\x90"	#  Normal UTF-8 box characters.
	[21]="\x94" [22]="\x82" [23]="\x98"	#  (These are the default for they are supported almost everywhere.)
	[30]="\x94" [32]="\x8c" [33]="\x80" )  ####

# declare -ar v=( [00]="\x83" [01]="\x8f" [03]="\x93"	####
#	 [10]="\x9b" [11]="\x81" [12]="\x93"	#  Heavy UTF-8 box characters.
#	 [21]="\x97" [22]="\x83" [23]="\x9b"	#  (Uncomment only if your terminal supports it)
#	 [30]="\x97" [32]="\x8f" [33]="\x81" )  ####

OPTIND=1
while getopts "f:s:r:h" arg; do
	case $arg in
		f) ((f=($OPTARG>19 && $OPTARG<101)?$OPTARG:$f));;
		s) ((s=($OPTARG>4 && $OPTARG<16 )?$OPTARG:$s));;
		r) ((r=($OPTARG>0)?$OPTARG:$r));;
		h) echo -e "Usage: pipes [OPTION]..."
			echo -e "Animated pipes terminal screensaver.\n"
			echo -e " -f [20-100]\tframerate (D=75)."
			echo -e " -s [5-15]\tprobability of a straight fitting (D=13)."
			echo -e " -r LIMIT\treset after x characters (D=2000)."
			echo -e " -h\t\thelp (this screen).\n"
			exit 0;;
		esac
	done

tput smcup
tput reset
tput civis

trap "tput rmcup; tput reset; exit" SIGINT

while true; do
	# New position:
	(($l%2)) && ((x+=($l==1)?1:-1))
	((!($l%2))) && ((y+=($l==2)?1:-1))

	# Loop on edges (change color on loop):
	((c=($x>$w || $x<0 || $y>$h || $y<0)?($RANDOM%7):$c))
	((x=($x>$w)?0:(($x<0)?$w:$x)))
	((y=($y>$h)?0:(($y<0)?$h:$y)))

	# New random direction:
	((n=$RANDOM%$s-1))
	((n=($n>1||$n==0)?$l:$l+$n))
	((n=($n<0)?3:$n%4))

	# Print:
	tput cup $y $x
	printf "\033[1;3${c}m\xe2\x94${v[$l$n]}"
	(($t>$r)) && tput reset && tput civis && t=0 || ((t++))
	l=$n
	sleep $(echo "scale=5;1/$f"|bc)
done
