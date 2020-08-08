#!/usr/bin/env sh
set -e

SOURCE_COUNT=${SOURCE_COUNT:-8}
RTMP_SERVER=${RTMP_SERVER:-rtmp://host.docker.internal/live}

for i in $(seq 1 $SOURCE_COUNT); do
  echo "publish source$i"
  ffmpeg -re -stream_loop -1 -i sources/source$i.mp4 -c copy -f flv ${RTMP_SERVER}/source$i </dev/null > /dev/null 2>&1 &
done

echo "wait for streaming completed..."
wait
