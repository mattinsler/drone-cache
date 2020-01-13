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

  echo "[$path] Rebuild cache to /cache/$key.tgz"
  ls -la "$path"
  if [ -e "$path" ]; then
    tar c -z -f "/cache/$key.tgz" -C "$path"
    echo "[$path] Rebuilt"
  else
    echo "[$path] Path does not exist"
  fi
done
