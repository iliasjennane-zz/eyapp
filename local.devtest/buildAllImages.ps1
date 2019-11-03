Param(
    # api docker Image Tag
    [Parameter(Mandatory=$false)][string]$eyapiImageTag,
    [Parameter(Mandatory=$false)][string]$eywebImageTag
)

if ([string]::IsNullOrEmpty($eyapiImageTag)) {
    $eyapiImageTag = 'latest'
}
Write-Host "Docker eyapi image will be build with tag: $eyapiImageTag" -ForegroundColor White


if ([string]::IsNullOrEmpty($eywebImageTag)) {
    $eywebImageTag = 'latest'
}
Write-Host "Docker eyweb image will be build with tag: $eywebImageTag" -ForegroundColor White

docker build -t eyapi:$eyapiImageTag ../eyapi
docker build -t eyweb:$eywebImageTag ../eyweb

docker image ls "ey*"