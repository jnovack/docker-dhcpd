FROM alpine
MAINTAINER Justin J. Novack <jnovack@gmail.com>

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name="jnovack/docker-dhcp" \
      org.label-schema.url="https://hub.docker.com/r/jnovack/dhcp/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/jnovack/docker-dhcp"

ENTRYPOINT ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]

EXPOSE 67/udp 67/tcp

VOLUME ["/etc/dhcp"]

RUN set -xe \
	&& apk add --update dhcp \
	&& rm -rf /var/cache/apk/*

RUN ["touch", "/var/lib/dhcp/dhcpd.leases"]

