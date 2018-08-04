#!/bin/sh

if [ ! -e /opt/fastnetmon/assets/etc/fastnetmon.conf ]; then
  echo "# Bootstrapping fastnetmon config"
  mkdir -vp /opt/fastnetmon/assets/etc/ /opt/fastnetmon/assets/lib/

  # copy config file
  cp -v /opt/fastnetmon/_assets/fastnetmon.conf /opt/fastnetmon/assets/etc/

  # touch network list files
  touch /opt/fastnetmon/assets/etc/networks_list /opt/fastnetmon/assets/etc/networks_whitelist

  # copy notification script
  cp -v /opt/fastnetmon/_assets/notify.sh /opt/fastnetmon/assets/etc/
  echo "# DONE"
fi

exec $@
