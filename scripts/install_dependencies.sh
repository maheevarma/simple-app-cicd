# scripts/install_dependencies.sh
#!/bin/bash
yum update -y
yum install -y nodejs npm

# Install PM2 for process management
npm install -g pm2

# Create application directory if it doesn't exist
mkdir -p /var/www/html/simple-cicd-app
