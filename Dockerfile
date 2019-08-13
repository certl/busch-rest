FROM ubuntu


RUN apt-get update
RUN apt-get install -y nodejs npm git

RUN mkdir /opt/sstadlberger
RUN cd /opt/sstadlberger && git clone https://github.com/sstadlberger/home.git
RUN cd /opt/sstadlberger/home && npm install

COPY ../config.js /opt/sstadlberger/home/config/config.js
COPY ../data.json /opt/sstadlberger/home/config/data.json
COPY ../structure.json /opt/sstadlberger/home/config/structure.json

WORKDIR /opt/sstadlberger/home

CMD ["node", "home.js", "--logLevel=debug"]