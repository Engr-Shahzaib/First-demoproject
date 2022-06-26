#!/bin/bash

#first clone repo from the git
git clone https://github.com/Engr-Shahzaib/First-demoproject.git

#Enter into the directory where all the files saved
cd First-demoproject

#remove readme fileclear
rm README.md

#This command will remove space from the File name
for f in *\ *; do mv "$f" "${f// /_}"; done     

#For adding blank line before the text line in the file
Count=1

for FILE in ./*
do
   FILE_NAME="output"$count

   #this command will add blank line before the text line 
sed '1i\\' $FILE > $FILE_NAME.srt

#this will delete old files after creating new one
rm $FILE        

((count=count+1))
done

#this is for the delete Subtile line that are divisble by 4 and store in the new file 
count=1

for FILE in ./*
do 
    FILE_NAME="result"$count
    #this command will delete line that are divisible by 4 and store in the new file
    awk ' NR % 4 == 0 ' $FILE > $FILE_NAME.srt
    rm $FILE
((count=count+1))
done

#this for loop is used to make the para
count=1

for FILE in ./*
do 
    FILE_NAME="fresult"$count
    #this command will make para after inserting text lines into the new one 
    fmt -w $(tput cols) $FILE > $FILE_NAME.srt
    rm $FILE
((count=count+1))
done



#this command will merge all srt files and make final result
cat *.srt >> one.srt

#this command will complete old srt files.
rm fresult1.srt fresult2.srt fresult3.srt

echo "Script Complete"





