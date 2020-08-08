## streaming-dummy-publisher
A dummy stream publisher run in the docker.

1. ENVs
    - STREAM_COUNT: how many streams to publish, default and at most 8.
    - RTMP_SERVER: RTMP server url, default: `rtmp://host.docker.internal/live`

2. Build docker
    ```shell
    docker build -t local/streaming-dummy-publisher:dev .
    ```
   Or use a prebuild image: **registry.cn-beijing.aliyuncs.com/mengli/streaming-dummy-publisher:latest**
  
3. Run docker to push streams
    ```shell
    docker run local/streaming-dummy-publisher:dev
    ```
   Or
    ```shell
   docker run registry.cn-beijing.aliyuncs.com/mengli/streaming-dummy-publisher:latest
   ```
