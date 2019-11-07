Param(
    # api docker Image Tag
    [Parameter(Mandatory=$false)][string]$aksClusterName
)
az aks get-credentials --resource-group $rgName --name $aksClusterName
