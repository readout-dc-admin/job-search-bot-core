#!/bin/bash
set -e
chown -R openclaw:openclaw /data
chmod 700 /data
mkdir -p /data/.openclaw && chown -R openclaw:openclaw /data/.openclaw
cp /app/openclaw.json /data/.openclaw/openclaw.json
if [ ! -d /data/.linuxbrew ]; then
  cp -a /home/linuxbrew/.linuxbrew /data/.linuxbrew
fi
rm -rf /home/linuxbrew/.linuxbrew
ln -sfn /data/.linuxbrew /home/linuxbrew/.linuxbrew
exec gosu openclaw node src/server.js
