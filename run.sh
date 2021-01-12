#/bin/sh
/usr/bin/httrack $WEBSITE

#check for AZCOPY_AUTO_LOGIN_TYPE=MSI to see if we're on Azure; build something else for Docker later
/usr/bin/azcopy login
/usr/bin/azcopy copy "${WEBSITE#*//}/*" "https://$AZ_BLOB_SA.blob.core.windows.net/$AZ_BLOB_CONTAINER" --recursive
