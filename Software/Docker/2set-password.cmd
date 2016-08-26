docker run \
  --interactive \
  --tty \
  --user=root \
  --name=dfstools \
  znmeb/mastering-dfs-analytics:latest \
  passwd dfstools
docker commit dfstools znmeb/mastering-dfs-analytics:latest
docker rm dfstools
docker images
