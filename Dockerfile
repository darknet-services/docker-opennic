FROM debian:testing
MAINTAINER alessio@linux.com

ENV BIND_USER=bind \
    DATA_DIR=/data

RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y stunnel prometheus-bind-exporter openssl wget bind9* bind9-host* dnsutils \
 && rm -rf /var/lib/apt/lists/*

COPY srvzone /srvzone 
RUN chown bind.bind /srvzone \
 && chmod 700 /srvzone

COPY named.conf /etc/bind/named.conf
COPY srvzone.conf /srvzone.conf
COPY caching.conf /etc/bind/caching.conf
COPY root.hints /etc/bind/root.hints
COPY entrypoint.sh /sbin/entrypoint.sh
COPY stunnel/dnstls.conf /etc/stunnel
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 53/udp 53/tcp 853/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/sbin/named"]
