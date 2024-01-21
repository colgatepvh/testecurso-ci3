FROM ubuntu:latest

EXPOSE 8000

WORKDIR /app

ENV HOST=localhost DBPORT=5432

ENV USER=root PASSWORD=root DBNAME=root

COPY ./main main

RUN sudo apt-get update
RUN sudo apt-get install golang-go -y
RUN sudo go build -v main.go
RUN sudo chmod +x main
CMD nohup ./main > nohup.out 2> nohup.err < /dev/null &
