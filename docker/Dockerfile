FROM ubuntu:latest
FROM python:3

RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y vim

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip3 install -r requirements.txt
RUN pip3 install BeautifulSoup4

COPY scraping_example.py ./
COPY fibb.py ./

CMD [ "python3", "./scraping_example.py" ]

CMD /bin/bash
