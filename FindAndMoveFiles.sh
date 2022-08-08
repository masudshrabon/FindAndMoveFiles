#!/bin/sh
# This script is used to parse the (class) file names from the ClassList.txt file
# and move it to a pre-defined directory.

# Just change the directory links as you needed.
srcFile="E:/Dataset/Test/ClassList.txt"
sourceCodeFolder="E:/Dataset/Test/tomcat"
outputFolder="E:/Dataset/Test/TomcatOutput"
# To solve the problem of the input file (apparently created in Windows) 
#that has CRLF line endings.
sed -i 's/\r//' $srcFile

counter=0
while read -r classNameAsPath
do
	counter=$[$counter +1]
	
	# split the full class path and get the last item (class name only without extension)
	#splitted_array=(${classNameAsPath//./ }) # split string on . 
	#className=${splitted_array[-1]}  # get the last item from the splitted array
	
	#Alternative split the last item
	className=${classNameAsPath##*.}
 
	javaExtension=".java"
	className=$className$javaExtension 	# append the extension .java
	 
	sleep 0.5	# 0.5 sec sleep
	
	# find the class from the sourceCodeFolder and move it into the outputFolder
	find ${sourceCodeFolder} -name $className -exec mv "{}" ${outputFolder} \;
	
	echo "Moved $counter ${className}"
	echo "----------------------------"
	
done <$srcFile

echo "####### Finished #########"

# How To Run The Script : 
# 1. Open the git bash (cmd) and
# 2. Run the FindAndMoveFiles.sh script using this command (according to the directory of the script):  
# 		"E:/Dataset/Test/FindAndMoveFiles.sh"

