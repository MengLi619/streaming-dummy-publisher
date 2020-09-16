#!/usr/bin/env sh
set -e

SOURCE_COUNT=${SOURCE_COUNT:-8}
RTMP_SERVER=${RTMP_SERVER:-rtmp://host.docker.internal/live}
RESOLUTION=${RESOLUTION:-640x360}
FRAME_RATE=${FRAME_RATE:-25}
AUDIO_START_FREQUENCY=${AUDIO_START_FREQUENCY:-400}
AUDIO_FREQUENCY_INTERVAL=${AUDIO_FREQUENCY_INTERVAL:-100}

for i in $(seq 1 $SOURCE_COUNT); do
  echo "publishing source$i"
  ffmpeg \
    -re \
    -r 24 \
    -f lavfi -i testsrc=size=${RESOLUTION}:rate=${FRAME_RATE} \
    -f lavfi -i sine=f=$((AUDIO_START_FREQUENCY + i * AUDIO_FREQUENCY_INTERVAL)) \
    -vf drawtext="SourceCodePro-Regular.ttf:text=source$i:x=(w-tw)/2:y=(2*lh):fontsize=40" \
    -vcodec libx264 \
    -preset ultrafast \
    -tune zerolatency \
    -pix_fmt yuv420p \
    -x264opts "keyint=25:min-keyint=25:no-scenecut" \
    -acodec aac \
    -f flv \
    ${RTMP_SERVER}/source$i &
done

echo "wait for streaming completed..."
wait
