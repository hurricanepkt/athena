#!/usr/bin/env sh
LOG_LOCATION=/var/www/html/MylogFile.log
[ "$1" = "update" ] || exec "$@" || exit $?

printf "Starting v1.0.02\n"  >> $LOG_LOCATION; 
lighttpd -D -f /etc/lighttpd/lighttpd.conf  &

while [ : ]
do
    FILES=/input_music/*
    for f in $FILES; do 
        printf "$f\n"  >> $LOG_LOCATION; 
        if [ $f = "/input_music/*" ]
        then
            printf "No files to process\n" >> $LOG_LOCATION;
            break
        fi
        printf "Splitting\n" >> $LOG_LOCATION;
        mp3splt -q -s -p th=-50,nt=20 -d /output_music -o @f/@f_@n $f;
        printf "Removing $f\n" >> $LOG_LOCATION;
        rm $f
    done
    printf "Sleeping for  $SLEEP_DELAY\n" >> $LOG_LOCATION;
    sleep $SLEEP_DELAY
done