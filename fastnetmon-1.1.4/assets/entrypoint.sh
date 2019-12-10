#!/bin/sh

if [ ! -e /opt/fastnetmon/etc/fastnetmon.conf ]; then
  echo "# Bootstrapping fastnetmon config"

  # copy config file
  cp -v /opt/fastnetmon/assets/fastnetmon.conf /opt/fastnetmon/etc/

  # touch network list files
  touch /opt/fastnetmon/etc/networks_list /opt/fastnetmon/etc/networks_whitelist

  # copy notification script
  cp -v /opt/fastnetmon/assets/notify.sh /opt/fastnetmon/etc/

  echo
fi

exec $@
