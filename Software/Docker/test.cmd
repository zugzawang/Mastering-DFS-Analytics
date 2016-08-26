docker run \
  --interactive \
  --tty \
  --user=root \
  --name=dfstools \
  --publish=7777:7777 \
  docker.io/znmeb/mastering-dfs-analytics:latest \
  /home/dfstools/Scripts/start-jupyter.bash
docker commit dfstools docker.io/znmeb/mastering-dfs-analytics:latest
docker rm dfstools
docker images
