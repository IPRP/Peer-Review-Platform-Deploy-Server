FROM ubuntu:20.04
COPY . /app

RUN apt-get update
RUN apt-get install libmysqlclient-dev -y
RUN ls app/
CMD app/iprp-backend_amd64