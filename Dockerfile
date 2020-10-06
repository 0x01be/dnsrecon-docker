FROM alpine as build

RUN apk add --no-cache --virtual theharvester-docker-0x01 \
    git \
    build-base \
    python3-dev \
    py3-pip

ENV DNSRECON_REVISION master
RUN git clone --depth 1 --branch ${DNSRECON_REVISION} https://github.com/darkoperator/dnsrecon.git /dnsrecon

WORKDIR /dnsrecon
RUN pip3 install --prefix=/opt/dnsrecon .
RUN python3 setup.py install --prefix=/opt/dnsrecon

