#!/bin/sh

echo $PLUGIN_PATHS | tr ',' '\n' | while read path; do
  case "$path" in
    /*)
      # absolute
      ;;
    *)
      # relative
      path="$CI_WORKSPACE/$path"
      ;;
  esac

  key=$(echo "$path" | base64)

  echo "[$path] Restore cache from /cache/$key.tgz"
  if [ -e "/cache/$key.tgz" ]; then
    tar x -z -f "/cache/$key.tgz" -C "$path"
    echo "[$path] Restored"
  else
    echo "[$path] Cache does not exist"
  fi
done
