$RESOURCEGROUP="RG_xxxxxx"
$CONTAINERNAME="alllowercase"
$WEBSITE="https://dynamicontentsite.fullurl.com"

az container create `
    --resource-group $RESOURCEGROUP `
    --name $CONTAINERNAME `
    --image "sjambor/httrack:latest" `
    --dns-name-label $CONTAINERNAME `
    --restart-policy Never `
    --environment-variables WEBSITE=$WEBSITE `
    --secure-environment-variables AZBLOBCONTAINERSAS='https://xxxxxxxxxx.blob.core.windows.net/$web/?sv=2019-12-12.......k%3D'
