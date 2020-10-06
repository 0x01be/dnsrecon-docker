FROM 0x01be/dnsrecon:build as build

FROM alpine

COPY --from=build /opt/dnsrecon/ /opt/dnsrecon/

RUN apk add --no-cache --virtual dnsrecon-runtime-dependencies \
    python3

RUN adduser -D -u 1000 dnsrecon

USER dnsrecon

ENV PATH ${PATH}:/opt/dnsrecon/bin/
ENV PYTHONPATH /usr/lib/python3.8/site-packages/:/opt/dnsrecon/lib/python3.8/site-packages/

CMD ["dnsrecon", "--help"]

