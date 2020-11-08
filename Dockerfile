FROM python:3.7-alpine
LABEL maintainer="Arjun"

ENV PYTHONUNBUFFRED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deops \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deops


RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
