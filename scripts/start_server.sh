#!/bin/bash

cd /var/www/html/simple-cicd-app || exit 1

# Install production dependencies
npm install --production

# Stop and delete previous PM2 process if exists
pm2 stop simple-cicd-app || true
pm2 delete simple-cicd-app || true

# Start app with PM2
pm2 start app.js --name simple-cicd-app

# Save PM2 process list
pm2 save
