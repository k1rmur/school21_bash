#! /bin/bash
read -p "File:"  path
read -p "Line for replace:"  oldline
read -p "New line:"  newline
doubletest=$(shasum -a 256 "$path" | cut -d ' ' -f 1)
if [ -r "$path" ] &&  [ -w "$path" ] && [ -e "$path" ] &&  [ ! -z "$oldline" ] && [ ! -z "$newline" ] && [ $oldline -ne  $newline ] ; then
        sed -i '' "s/$oldline/$newline/g" $path
	doubletest2=$(shasum -a 256 "$path" | cut -d ' ' -f 1)
       	if [[ $doubletest != $doubletest2 ]] ; then
	sum=$(shasum -a 256 $path | cut -d  ' ' -f 1) 
	data=$(date +"%Y-%m-%d %H:%M")
	size=$(stat -f %z "$path")
	echo "$path - $size - $data - $sum - sha256" >> files.log
	else
	echo "Error"
	fi
else
	echo "Check if the data entered is correct"	 
fi
