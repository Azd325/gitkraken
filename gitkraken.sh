#!/bin/sh

if [[ -f /opt/gitkraken/electron ]]; then
  /opt/gitkraken/electron /opt/gitkraken/resources/app.asar "$@"
else
  LD_PRELOAD=/usr/lib/libcurl-gnutls.so.3 /opt/gitkraken/gitkraken "$@"
fi
