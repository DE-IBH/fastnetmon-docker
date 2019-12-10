# fetch sources
FROM debian:bullseye-slim

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL

RUN apt-get update && apt-get install -y --no-install-recommends \
  fastnetmon \
  ssmtp

ADD ./assets /opt/fastnetmon/assets

LABEL org.label-schema.name="FastNetMon" \
      org.label-schema.description="DDoS detection tool" \
      org.label-schema.url="https://fastnetmon.com/" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.vcs-url="$VCS_URL" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.schema-version="1.0.0-rc.1"

EXPOSE 2055/udp
EXPOSE 6343/udp
EXPOSE 179/tcp

VOLUME ["/opt/fastnetmon/etc", "/var/log/fastnetmon_attacks"]

ENTRYPOINT ["/opt/fastnetmon/assets/entrypoint.sh"]
CMD ["/usr/sbin/fastnetmon", "--log_file", "/dev/stdout", "--configuration_file", "/opt/fastnetmon/etc/fastnetmon.conf"]
