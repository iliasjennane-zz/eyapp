docker image rm $(docker image ls "ey*" -qa) -f
docker image prune