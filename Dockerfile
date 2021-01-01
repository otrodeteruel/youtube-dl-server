#
# youtube-dl Server Dockerfile
#
# https://github.com/otrodeteruel/youtube-dl-server
#

FROM python:alpine

RUN apk add --no-cache \
  ffmpeg \
  tzdata

ARG USER=myuser
RUN adduser  --disabled-login --gecos '' ${USER}
USER ${USER}
RUN mkdir -p /home/${USER}/app
WORKDIR /home/${USER}/app

COPY requirements.txt /home/${USER}/app
RUN apk --update-cache add --virtual build-dependencies gcc libc-dev make \
  && pip install --no-cache-dir -r requirements.txt \
  && apk del build-dependencies

COPY . /home/${USER}/app

EXPOSE 8080

VOLUME ["/youtube-dl"]

CMD [ "python", "-u", "./youtube-dl-server.py" ]
