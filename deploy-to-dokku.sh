#!/bin/bash
APP_NAME="my-web-app2"
EXTERNAL_PORT=8081
INTERNAL_PORT=5000
REMOTE_NAME="dokku"
REMOTE_URL="dokku@localhost:$APP_NAME"

echo "Deploying $APP_NAME to Dokku on port $EXTERNAL_PORT..."
sudo dokku apps:create "$APP_NAME" 2>/dev/null || true
git remote add "$REMOTE_NAME" "$REMOTE_URL" 2>/dev/null || git remote set-url "$REMOTE_NAME" "$REMOTE_URL"
git push "$REMOTE_NAME" main
sudo dokku ports:set "$APP_NAME" "http:$EXTERNAL_PORT:$INTERNAL_PORT"
IP=$(hostname -I | awk '{print $1}')
echo "Deployment Complete: http://$IP:$EXTERNAL_PORT"
