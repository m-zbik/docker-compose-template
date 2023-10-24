FROM python:3.11.4-alpine

ARG EXPOSE_PORT_ARG
ARG DEBUG_ARG
ARG GUNICORN_WORKERS_NO_ARG
ARG ROUTE_TO_ARG
ARG UI_NAME_ARG

WORKDIR /src/main
EXPOSE $EXPOSE_PORT_ARG

ENV DEBUG=$DEBUG_ARG
ENV EXPOSE_PORT=$EXPOSE_PORT_ARG
ENV GUNICORN_WORKERS_NO=$GUNICORN_WORKERS_NO_ARG
ENV ROUTE_TO=$ROUTE_TO_ARG
ENV UI_NAME=$UI_NAME_ARG

RUN apk --update --upgrade add --no-cache  gcc musl-dev jpeg-dev zlib-dev libffi-dev cairo-dev pango-dev gdk-pixbuf-dev

RUN python -m pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn --workers=$GUNICORN_WORKERS_NO --bind=0.0.0.0:$EXPOSE_PORT run:app
