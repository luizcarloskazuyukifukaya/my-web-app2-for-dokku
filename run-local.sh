#!/bin/bash
PORT=3001
IP=$(hostname -I | awk '{print $1}')
echo "Starting web app 2..."
echo "Access locally at: http://$IP:$PORT"
PORT=$PORT node server.js
