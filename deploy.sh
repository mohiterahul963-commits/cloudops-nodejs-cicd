#!/bin/bash

APP_DIR="/var/www/cloudops-nodejs-cicd"

echo "Starting deployment..."

cd $APP_DIR

echo "Installing dependencies..."
npm install --production

echo "Stopping existing Node.js application..."
pkill -f "node app.js" || true

echo "Starting Node.js application..."
nohup npm start > app.log 2>&1 &

echo "Application started successfully!"