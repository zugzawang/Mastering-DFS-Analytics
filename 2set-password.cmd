docker run --interactive --tty --user=root --name=dfstools docker.io/znmeb/mastering-dfs-analytics:latest passwd dfstools
docker commit dfstools docker.io/znmeb/mastering-dfs-analytics:latest
docker rm dfstools
docker images
