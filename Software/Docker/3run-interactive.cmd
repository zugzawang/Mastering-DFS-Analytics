docker run --interactive --tty --user=dfstools --name=dfstools --publish=7557:7557 --publish=7777:7777 docker.io/znmeb/mastering-dfs-analytics:latest /home/dfstools/Scripts/start-jupyter.bash
docker commit dfstools docker.io/znmeb/mastering-dfs-analytics:latest
docker rm dfstools
docker images
