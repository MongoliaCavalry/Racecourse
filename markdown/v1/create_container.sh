docker run -d \
  --name=dillinger \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 8080:8080 \
  --restart unless-stopped \
  lscr.io/linuxserver/dillinger:latest
