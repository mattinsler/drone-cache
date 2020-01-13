#!/bin/sh

if [ ! -z "$PLUGIN_RESTORE" ]; then
  /restore.sh
elif [ ! -z "$PLUGIN_REBUILD" ]; then
  /rebuild.sh
fi
