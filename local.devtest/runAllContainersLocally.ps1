Param(
    # api docker Image Tag
    [Parameter(Mandatory=$false)][string]$eyapiImageTag,
    [Parameter(Mandatory=$false)][string]$eywebImageTag
)

if ([string]::IsNullOrEmpty($eyapiImageTag)) {
    $eyapiImageTag = 'latest'
}
Write-Host "Docker eyapi container will be run with image tag: $eyapiImageTag" -ForegroundColor White

if ([string]::IsNullOrEmpty($eywebImageTag)) {
    $eywebImageTag = 'latest'
}
Write-Host "Docker eyweb container will be run with image tag: $eywebImageTag" -ForegroundColor White

$eyapiContainerLabel = $eyapiImageTag
if($eyapiImageTag -eq 'latest') {$eyapiContainerLabel = $eyapiImageTag.replace(":","_")}
$eywebContainerLabel = $eywebImageTag
if($eywebImageTag -eq 'latest') {$eywebContainerLabel = $eywebImageTag.replace(":","_")}

docker run -d --rm -p 8001:80 --name eyapi_$eyapiContainerLabel eyapi:$eyapiImageTag
docker run -d --rm -p 8000:80 --name eyweb_$eywebContainerLabel eyweb:$eywebImageTag