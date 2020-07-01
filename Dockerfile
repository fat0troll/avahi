FROM alpine
MAINTAINER Vladimir Hodakov <vladimir@hodakov.me>

RUN apk add --no-cache bash avahi avahi-tools

VOLUME /etc/avahi

CMD ["avahi-daemon"]
