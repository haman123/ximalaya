#!/bin/bash

ALBUMID="63048"
RSSFILE="daming.xml"
# export PBUUID=""
./qingting_linux_amd64 $ALBUMID > $RSSFILE
ls
curl -X PUT -F c=@$RSSFILE http://fars.ee/$PBUUID
