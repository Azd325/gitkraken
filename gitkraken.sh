#!/bin/sh

if [[ -f /opt/gitkraken/electron ]]; then
  /opt/gitkraken/electron /opt/gitkraken/resources/app.asar "$@"
else
  /opt/gitkraken/gitkraken "$@"
fi
