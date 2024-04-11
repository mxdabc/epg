#!/bin/bash
 
while true
do
    if pgrep /usr/local/bin/uwsgi --ini /mxdyeah/epg/uwsgi.ini >/dev/null
    then
        sleep 10
    else
        echo "EPG service is not running, restarting"
        /usr/local/bin/uwsgi --ini /mxdyeah/epg/uwsgi.ini
        sleep 1
    fi
done