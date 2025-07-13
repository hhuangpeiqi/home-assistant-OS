#!/bin/bash
set -e

# Proxy
# export http_proxy=http://192.168.4.55:7897
# export https_proxy=http://192.168.4.55:7897
export http_proxy=http://192.168.1.5:7897
export https_proxy=http://192.168.1.5:7897
export no_proxy=localhost,127.0.0.1
# export HTTP_PROXY=http://192.168.4.55:7897
# export HTTPS_PROXY=http://192.168.4.55:7897
export HTTP_PROXY=http://192.168.1.5:7897
export HTTPS_PROXY=http://192.168.1.5:7897
export NO_PROXY=localhost,127.0.0.1

USER="root"

# Run dockerd
dockerd -s vfs &> /dev/null &


# Setup local group, if not existing
if [ "${BUILDER_GID:-0}" -ne 0 ] && ! getent group "${BUILDER_GID:-0}"; then
  groupadd -g "${BUILDER_GID}" builder
fi

# Setup local user
if [ "${BUILDER_UID:-0}" -ne 0 ]; then
  useradd -m -u "${BUILDER_UID}" -g "${BUILDER_GID}" -G docker,sudo builder
  echo "builder ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
  # Make sure cache is accessible by builder
  chown "${BUILDER_UID}:${BUILDER_GID}" /cache
  # Make sure output is accessible by builder (if anonymous volume is used)
  chown "${BUILDER_UID}:${BUILDER_GID}" /build/output || true
  USER="builder"
fi

if CMD="$(command -v "$1")"; then
  shift
  echo "Running as: $(whoami), UID: $(id -u), CMD: $CMD"
  sudo -E -H -u ${USER} "$CMD" "$@"
else
  echo "Command not found: $1"
  exit 1
fi
