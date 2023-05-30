#! /bin/bash
# LOG_LOCATION=/var/www/html/MylogFile.log
# # exec 3>&1 1>>${LOG_LOCATION} 2>&1
# exec >  >(tee -ia $LOG_LOCATION)
# exec 2> >(tee -ia $LOG_LOCATION >&2)


# echo "Log Location should be: [ $LOG_LOCATION ]"
echo "v0.9.4"
# lighttpd -D -f /etc/lighttpd/lighttpd.conf  &

# echo "Lighttpd started"


while true
do
    FILES=/input_music/*
    for f in $FILES; do 
        echo "$f"; 
        if [ $f = "/input_music/*" ]
        then
            echo "No files to process"
            break
        fi
        mp3splt -q -s -p th=-50,nt=20 -d /output_music -o @f/@f_@n $f
        rm $f
    done
    echo "Keep running 300 seconds"
    sleep 300
done