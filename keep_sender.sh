#!/bin/sh

echo "0" > /path/to/sender_alive.txt

while true
do
  isAlive=`ps -ef | grep "node sender.js" | \
  grep -v grep | wc -l`
  if [ $isAlive -ge 1 ]; then
    echo "プロセスは生きています。"
    prev=`cat /path/to/sender_alive.txt`
    if [ $prev -eq 0 ]; then
      echo "iBeacon is up." | mail -s "iBeacon" foo@gmail.com
      echo "1" > /path/to/sender_alive.txt
    fi
  else
    echo "プロセスは死んでいます。"
    prev=`cat /path/to/sender_alive.txt`
    if [ $prev -eq 1 ]; then
      echo "iBeacon is down." | mail -s "iBeacon" foo@gmail.com
      echo "0" > /path/to/sender_alive.txt
    fi
    cd /path/to/dir
    sudo node sender.js &
  fi
  sleep 10
done
