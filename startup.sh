#! /bin/sh
LOG_LOCATION=/var/www/localhost/htdocs/
exec > >(tee -ia $LOG_LOCATION/MylogFile.log)
exec 2>&1

echo "Log Location should be: [ $LOG_LOCATION ]"
echo "v0.9.3"
lighttpd -D -f /etc/lighttpd/lighttpd.conf  &

echo "Lighttpd started"




while true
do
    FILES=/input_music/*
    for f in $FILES; do 
        echo "$f"; 
        if [ $f == "/input_music/*" ]; then
            echo "No files to process"
            break
        fi
        mp3splt -s -p th=-50,nt=20 -d /output_music -o @f/@f_@n $f
        rm $f
    done
    echo Keep running
    sleep 300
done