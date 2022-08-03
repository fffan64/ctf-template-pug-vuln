#! /bin/bash
filecount=0
while [ $filecount -lt 100 ] ; do
    if [ $filecount -eq 64 ]; then
      echo $FLAG > /tmp/.file${filecount}.'32738'
      ((filecount++))
    else
      filesize=$RANDOM
      filesize=$(($filesize+1024))
      base64 /dev/urandom | 
      head -c "$filesize" > /tmp/.file${filecount}.$RANDOM
      ((filecount++))
    fi
done