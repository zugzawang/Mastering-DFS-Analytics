docker run --interactive --tty --user=dfstools --name=dfstools --publish=7777:7777 znmeb/mastering-dfs-analytics:latest /home/dfstools/Scripts/start-jupyter.bash
docker commit dfstools docker.io/znmeb/mastering-dfs-analytics:latest
docker rm dfstools
docker images
