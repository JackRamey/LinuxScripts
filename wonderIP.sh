#!/bin/bash
FILE=/home/funk/bin/var/ip.address
ipAddr=`wget www.jackramey.com/php/index.php -O - -o /dev/null | grep '<title>' | sed -r 's/<title>//g' | sed -r 's/<\/title>//g'`
echo $ipAddr > $FILE
scp -p 2222 $FILE jack@174.122.7.66
exit 0
