az login
$SUBSCRIPTIONID = (az account show --query id -o tsv)

$WEBSITE="Full URL of site to copy, incl. http(s)"

$SA_RG= "Resource Group of storage account to write into"
$SA_NAME="Name of storage account to write into"

$ACI_RG="Resource Group Name or Container Instance" 
$ACI_NAME="Name to use for container instance, all lowercase"
$ACI_ID_SCOPE="/subscriptions/$SUBSCRIPTIONID/resourceGroups/$SA_RG/providers/Microsoft.Storage/storageAccounts/$SA_NAME"

az container create `
    --resource-group $ACI_RG `
    --name $ACI_NAME `
    --image "sjambor/httrack:latest" `
    --restart-policy OnFailure `
    --assign-identity `
    --scope $ACI_ID_SCOPE `
    --role "Storage Blob Data Contributor" `
    --environment-variables AZCOPY_AUTO_LOGIN_TYPE=MSI WEBSITE=$WEBSITE AZ_BLOB_SA=$SA_NAME
