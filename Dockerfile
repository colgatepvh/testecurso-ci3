FROM ubuntu:latest

EXPOSE 8000

WORKDIR /app

ENV HOST=localhost DBPORT=5432

ENV USER=root PASSWORD=root DBNAME=root

COPY ./main main

RUN apt-get update
RUN apt-get install golang-go -y
RUN go build -v main.go
RUN chmod +x main
CMD nohup ./main > nohup.out 2> nohup.err < /dev/null &
