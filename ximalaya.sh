#!/bin/bash


ALBUMID=([0]='18135886' [1]='3595841' [2]='16957024' )
RSSFILE=([0]='18jdxs.xml' [1]='yinyue.xml' [2]='jdxs.xml')
GRABBER="ximalaya_linux_amd64"

wget -q https://github.com/cxuauto/podcast-rss/releases/download/3jia/$GRABBER
chmod +x ./$GRABBER

len=${#ALBUMID[@]}

for ((i=0;i<$len;i++));do
        ./$GRABBER ${ALBUMID[$i]} > ${RSSFILE[$i]}
done

ls

for ((i=0;i<$len;i++));do
        UUID=PBUUID${i}
        eval tmp=\$$UUID
        curl -X PUT -F c=@${RSSFILE[i]} http://fars.ee/$tmp
done
