#!/bin/bash

#DESTINATION FOLDER
DEST="root@localhost:/root/test_rsync/"

#DESTINATION PORT
PORT=22

# Search + Rsync function
find_rsync () {
#	find . -name $1 
	find . -name $1 | while read file; do rsync -e "ssh -p $PORT" "$file" $DEST ; done	
}


# At least 1 file to look for
if test "$#" -lt 1;then
	echo "Illegal number of parameters"
fi

# For each file
for i in "$@"
do
	find_rsync $i
done

#rsync test/.bashrc root@localhost:/root/test_rsync/
