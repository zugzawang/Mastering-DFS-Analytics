docker run --interactive --tty --user=dfstools --name=dfstools docker.io/znmeb/mastering-dfs-analytics:latest /home/dfstools/Scripts/install-jupyter.bash
docker commit dfstools docker.io/znmeb/mastering-dfs-analytics:latest
docker rm dfstools
docker images
