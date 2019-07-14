#
# Flexget Dockerfile
#
# https://github.com/kmb32123/flexget-dockerfile
#

# Pull base image.
FROM python:3.7-alpine

COPY requirements.txt /
RUN pip install --upgrade pip six>=1.10.0 && \
    pip install -r /requirements.txt && \
    rm /requirements.txt

VOLUME ["/flexget"]
VOLUME ["/input"]
VOLUME ["/output"]

WORKDIR /flexget

CMD rm -f /flexget/.config-lock && flexget daemon start
