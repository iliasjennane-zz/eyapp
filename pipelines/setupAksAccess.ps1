Param(
    # api docker Image Tag
    [Parameter(Mandatory=$false)][string]$rgName,
    [Parameter(Mandatory=$false)][string]$aksClusterName,
    [Parameter(Mandatory=$false)][string]$servicePrincipal,
    [Parameter(Mandatory=$false)][string]$clientSecret,
    [Parameter(Mandatory=$false)][string]$tenantDomain
    #[Parameter(Mandatory=$false)][string]$acrName
)
Write-Host "loging in into the azure target subscription" -ForegroundColor White
az login --service-principal -u $servicePrincipal -p $clientSecret --tenant $tenantDomain
Write-Host "Getting the aks credentials" -ForegroundColor White
az aks get-credentials --resource-group $rgName --name $aksClusterName

#Write-Host "Authenticating to ACR" -ForegroundColor White: only needed if not attaching acr initially
#kubectl create secret docker-registry $acrName --docker-server=$acrName.azurecr.io --docker-username=eyappsacr --docker-password=SG7m/igqnshlDsxWtnsN2WM8TsoKXqBV --docker-email=iliasjennane@outlook.com
