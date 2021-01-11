#/bin/sh
/usr/bin/httrack $WEBSITE
/usr/bin/azcopy copy ${WEBSITE#*//} $AZBLOBCONTAINERSAS
