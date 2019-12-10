#!/bin/sh

# This script will get following params:
#  $1 client_ip_as_string
#  $2 data_direction
#  $3 pps_as_string
#  $4 action (ban or unban)

if [ "$4" = "unban" ]; then
  echo
  echo "UNBAN - $1"
  echo
  cat
  echo

  exit 0
fi

if [ "$4" = "ban" ]; then
  echo
  echo "BAN - $1 for $2 attack with ${3}pps"
  echo
  cat
  echo

  exit 0
fi

if [ "$4" == "attack_details" ]; then
  echo
  echo "BAN - $1 for $2 attack with ${3}pps"
  echo
  cat
  echo

  exit 0
fi
