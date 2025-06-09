#!/bin/bash

echo "Moving to Documents directory"
cd ~
cd Documents
echo "Current directory: $(pwd)"

file="dummy.txt"
folder="Assignment2_$1"

mkdir $folder
echo "Created folder: $folder"

touch $folder/$file
echo "Created file: $file in folder $folder"

date >>$folder/$file
whoami >>$folder/$file
uptime >>$folder/$file
hostname -I >>$folder/$file
echo "Adding information to file"

cp $folder/$file $folder/backup_dummyfile.txt
echo "Backup created as backup_file.txt"

chmod 700 $folder/backup_dummyfile.txt
echo "Made backup dummy file readable, writiable, and executable only by myself/ the owner"

grade1=$2
grade2=$3
grade3=$4
grade4=$5
grade5=$6

touch $folder/unsorted_grades.txt
touch $folder/highestscore.txt
touch $folder/lowestscore.txt
echo "Creating the temp grades file and the files for highest and lowest score"

echo $grade1 >>$folder/unsorted_grades.txt
echo $grade2 >>$folder/unsorted_grades.txt
echo $grade3 >>$folder/unsorted_grades.txt
echo $grade4 >>$folder/unsorted_grades.txt
echo $grade5 >>$folder/unsorted_grades.txt

sort -nr $folder/unsorted_grades.txt | head -n 1 >$folder/highestscore.txt
echo "Highest score saved to highestscore.txt"

sort -n $folder/unsorted_grades.txt | head -n 1 >$folder/lowestscore.txt
echo "Lowest score saved to lowestscore.txt"

rm $folder/unsorted_grades.txt
echo "Cleaned up temp grades file"
