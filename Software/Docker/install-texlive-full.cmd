docker run --interactive --tty --user=root --name=dfstools docker.io/znmeb/mastering-dfs-analytics:latest /usr/local/src/install-texlive-full.bash
docker commit dfstools docker.io/znmeb/mastering-dfs-analytics:latest
docker rm dfstools
docker images
