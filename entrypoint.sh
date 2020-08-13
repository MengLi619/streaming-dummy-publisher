#!/usr/bin/env sh
set -e

SOURCE_COUNT=${SOURCE_COUNT:-8}
RTMP_SERVER=${RTMP_SERVER:-rtmp://host.docker.internal/live}
RESOLUTION=${RESOLUTION-640x360}
FRAME_RATE=${FRAME_RATE-25}

for i in $(seq 1 $SOURCE_COUNT); do
  echo "publish source$i"
  ffmpeg \
    -re \
    -f lavfi \
    -i testsrc=size=${RESOLUTION}:rate=${FRAME_RATE} \
    -vf drawtext="SourceCodePro-Regular.ttf:text=source$i:x=(w-tw)/2:y=(2*lh):fontsize=40" \
    -f flv \
    ${RTMP_SERVER}/source$i &
done

echo "wait for streaming completed..."
wait
