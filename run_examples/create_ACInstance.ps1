az login



$RESOURCEGROUP="RG_xxxxxx"
$CONTAINERNAME="alllowercase"
$WEBSITE="https://dynamicontentsite.fullurl.com"

az container create `
    --resource-group $RESOURCEGROUP `
    --name $CONTAINERNAME `
    --image "sjambor/httrack:latest" `
    --dns-name-label $CONTAINERNAME `
    --restart-policy Never `
    --assign-identity `
    --environment-variables WEBSITE=$WEBSITE `
    --secure-environment-variables AZBLOBCONTAINERSAS='https://xxxxxxxxxx.blob.core.windows.net/$web/?sv=2019-12-12.......k%3D'


--scope /subscriptions/99999999-1bf0-4dda-aec3-cb9272f09590/MyResourceGroup/myRG/providers/Microsoft.Storage/storageAccounts/storage1