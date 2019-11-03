Write-Host "Stopping and removing all eyapp running containers" -ForegroundColor Yellow

docker stop $(docker ps -f "name=ey*" -qa)
docker rm $(docker ps -a -q)

