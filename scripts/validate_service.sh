# scripts/validate_service.sh
#!/bin/bash
sleep 10

# Check if the application is running
if pm2 list | grep -q "simple-cicd-app"; then
    echo "Application is running with PM2"
    
    # Test the health endpoint
    if curl -f http://localhost:3000/health; then
        echo "Health check passed"
        exit 0
    else
        echo "Health check failed"
        exit 1
    fi
else
    echo "Application is not running"
    exit 1
fi