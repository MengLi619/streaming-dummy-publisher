## streaming-dummy-publisher
A dummy stream publisher run in the docker.

1. Build docker
    ```shell
    docker build -t local/streaming-dummy-publisher:dev .
    ```

2. Run docker to publish streams
    ```shell
    docker run streaming-dummy-publisher:dev
    ```
