Param(
    # api docker Image Tag
    [Parameter(Mandatory=$false)][string]$aksNamespace,
    [Parameter(Mandatory=$false)][string]$eywebImageTag,
    [Parameter(Mandatory=$false)][string]$eyapiImageTag,
    [Parameter(Mandatory=$false)][string]$helmPackagePath,
    [Parameter(Mandatory=$false)][string]$helmReleaseName
)
helm upgrade  $helmReleaseName $helmPackagePath --set image.tag=$eywebImageTag --set eyapi.image.tag=$eyapiImageTag  --namespace $aksNamespace --install --force 