docker run --interactive --tty --user=root --name=dfstools --publish=7878:7878 docker.io/znmeb/mastering-dfs-analytics:latest /usr/local/src/start-rstudio-server.bash
docker commit dfstools docker.io/znmeb/mastering-dfs-analytics:latest
docker rm dfstools
docker images
