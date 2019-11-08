Param(
    # api docker Image Tag
    [Parameter(Mandatory=$false)][string]$aksNamespace,
    [Parameter(Mandatory=$false)][string]$eywebImageTag,
    [Parameter(Mandatory=$false)][string]$eyapiImageTag,
    [Parameter(Mandatory=$false)][string]$helmPackageFolderPath,
    [Parameter(Mandatory=$false)][string]$helmPackageName,
    [Parameter(Mandatory=$false)][string]$helmReleaseName
)
#helm init --upgrade
$helmPackageName = $(Get-ChildItem -Path *.tgz -Recurse -Force).Name 
Write-Host "Deploying package $helmPackageName" -ForegroundColor White
helm upgrade  $helmReleaseName $helmPackageFolderPath/$helmPackageName --set image.tag=$eywebImageTag --set eyapi.image.tag=$eyapiImageTag  --namespace $aksNamespace --install --force 