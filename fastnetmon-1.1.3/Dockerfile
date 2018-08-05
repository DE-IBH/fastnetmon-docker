# fetch sources
FROM debian:stretch-slim AS build

ARG branch=v1.1.3

RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates perl

WORKDIR /
RUN wget https://raw.githubusercontent.com/pavel-odintsov/fastnetmon/${branch}/src/fastnetmon_install.pl -Ofastnetmon_install.pl
RUN echo build@example.com | perl fastnetmon_install.pl --do-not-track-me

#RUN cp /usr/src/fastnetmon/src/fastnetmon.conf /etc/
#RUN cp /usr/src/fastnetmon/src/build/fastnetmon /usr/bin/
#RUN cp /usr/src/fastnetmon/src/build/fastnetmon_client /usr/bin/
#RUN touch /etc/networks_list


# final image
FROM debian:stretch-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
  libboost-atomic1.62.0 \
  libboost-chrono1.62.0 \
  libboost-date-time1.62.0 \
  libboost-regex1.62.0 \
  libboost-thread1.62.0 \
  liblog4cpp5v5 \
  libnuma1 \
  libpcap0.8 \
  libncurses5 \
  ssmtp

COPY --from=build /opt /opt

ADD ./assets /opt/fastnetmon/_assets

RUN ln -s /opt/fastnetmon/assets/etc/fastnetmon.conf /etc/fastnetmon.conf

EXPOSE 2055/udp
EXPOSE 6343/udp
EXPOSE 179/tcp

ENTRYPOINT ["/opt/fastnetmon/_assets/entrypoint.sh"]
CMD ["/opt/fastnetmon/fastnetmon"]
