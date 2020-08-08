FROM jrottenberg/ffmpeg:4.1-ubuntu

RUN apt-get install -y wget

COPY sources.txt download.sh entrypoint.sh ./
RUN sh download.sh

ENTRYPOINT ["sh", "entrypoint.sh"]
