#!/bin/bash
#example: ./integrity.sh https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js
#output: <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js" integrity="sha256-ivk71nXhz9nsyFDoYoGf2sbjrR9ddh+XDkCcfZxjvcM= sha512-7aMbXH03HUs6zO1R+pLyekF1FTF89Deq4JpHw6zIo2vbtaXnDw+/2C03Je30WFDd6MpSwg+aLW4Di46qzu488Q=="></script>
slashes=$(echo $1 | awk -F'/' '{ print NF }')
file=$(echo $1 | cut -d / -f $slashes)
checked=false
count=0
while ! [ $count -gt 3 ] && ! $checked
do
	let "count++"
	if [ -f $file ] 
	then 
		rm $file
	fi
	wget $1
	firstSHA256=$(openssl dgst -sha256 -binary $file | openssl base64 -A) #openssl dgst - outputs the file digest in binary form.
	firstSHA512=$(openssl dgst -sha512 -binary $file | openssl base64 -A)
	rm $file
	wget $1
	secondSHA256=$(openssl dgst -sha256 -binary $file | openssl base64 -A)
	secondSHA512=$(openssl dgst -sha512 -binary $file | openssl base64 -A)
	rm $file
	if [ $firstSHA256 == $secondSHA256 ] && [ $firstSHA512 == $secondSHA512 ]
	then
		checked=true
		clear
		printf "Success!\n\nCopy the following html snippet:\n\n"
		printf "<script src=\""$1"\" integrity=\"sha256-"$firstSHA256" sha512-"$firstSHA512"\"></script>\n\n"
	else
		if [ $count -gt 3 ]
		then
			clear
			echo "Sorry, the maximum amount of attempts has been reached, please check your connection."
		else		
			clear
			echo "Attempt no." $count "digests did not match, trying again in 3 seconds." 
			sleep 3
		fi
	fi
done