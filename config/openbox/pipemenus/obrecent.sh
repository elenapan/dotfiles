#!/bin/sh
echo "<openbox_pipe_menu>"
files=$(
cat ~/.local/share/recently-used.xbel | grep file:///  | tail -n15 |  cut -d "\"" -f 2 | tac | while read line; 
do
file=$(echo "$line")
name=$(echo -en "$file" | sed 's,.*/,,' | sed 's/%20/ /g' | sed 's/%/\\x/g' | sed 's/_/__/g')
echo -e "<item label=\"$name\">
\t<action name=\"Execute\"><command>xdg-open $line</command></action>
</item>"
done);
echo "$files"
echo "<separator />"
echo "<item label=\"Clear Recent Documents\">
	<action name=\"Execute\"><command>rm ~/.local/share/recently-used.xbel</command></action>
</item>"
echo "</openbox_pipe_menu>"
