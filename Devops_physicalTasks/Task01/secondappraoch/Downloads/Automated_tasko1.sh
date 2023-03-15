#! /usr/bin/bash

############################################
# Convert pdf to txt, Rename files & Backup.
############################################

#Getting all pdf files from the current dir
date
echo
FILES=./*.pdf
echo $FILES
echo

#Converting one file at a time with for loop
s=1
for u in $FILES
do
	echo "Processing $s file for conversion..."
	echo
	pdftotext -enc UTF-8 $u
	s=$(( s + 1 ))
	echo "File convert successful!"
	echo
done

#Renaming all converted files...
NEWFILES=./*.txt

k=1
for n in $NEWFILES
do
	mv $n "convertedfile$k.txt"
	echo "$k file renamed..."
	echo
	k=$(( k + 1 ))
done

#Moving renamed files to a new folder
mkdir converts_files
mv ./*.txt ./converts_files

#Creating the backup...
mkdir backup_files

files=./converts_files    #file to backed up
dest=./backup_files       #backup destination

archive_file="$(hostname -s)-$(date +%A).tgz"

echo
echo "Backing up $files to $dest/$archive_file"
echo
echo


tar czf $dest/$archive_file $files

echo
echo "Backup completed Successfully!"
date
echo
