#/bin/bash
/usr/bin/httrack $WEBSITE
/usr/bin/azcopy sync ${WEBSITE#*//} $AZBLOBCONTAINERSAS
