# scripts/start_server.sh
#!/bin/bash
cd /var/www/html/simple-cicd-app
npm install --production

# Stop any existing PM2 processes
pm2 stop simple-cicd-app || true
pm2 delete simple-cicd-app || true

# Start the application with PM2
pm2 start app.js --name simple-cicd-app
pm2 save