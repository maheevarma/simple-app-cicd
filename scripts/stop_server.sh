# scripts/stop_server.sh
#!/bin/bash
pm2 stop simple-cicd-app || true
pm2 delete simple-cicd-app || true