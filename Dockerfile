FROM jrottenberg/ffmpeg:4.1-ubuntu

RUN apt-get install -y wget

COPY SourceCodePro-Regular.ttf entrypoint.sh ./

ENTRYPOINT ["sh", "entrypoint.sh"]
