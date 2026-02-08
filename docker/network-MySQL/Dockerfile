FROM debian:stretch-slim
RUN apt-get update && apt-get install -y mysql-client
ENTRYPOINT mysql -uroot -p -h 172.77.1.2
