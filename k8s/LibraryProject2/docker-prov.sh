#!/bin/bash
set -e

# Variables
DB_NAME="library"
DB_USER="gina98"
DB_PASS="Stok3s:12!"  

# Update system packages
sudo apt-get update
sudo apt-get upgrade -y

# Install required dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y git curl apt-transport-https ca-certificates software-properties-common

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add current user to the Docker group
sudo usermod -aG docker $USER

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify installation
docker --version
docker-compose --version

# Create application directory
mkdir -p /opt/library-app
cd /opt/library-app

# Create Docker Compose file
cat > docker-compose.yml << EOL
version: '3.8'
services:
  database:
    image: mysql:8.0
    environment:
      MYSQL_DATABASE: library
      MYSQL_ROOT_PASSWORD: Stok3s:12!
    volumes:
      - mysql-data:/var/lib/mysql
      - ./library.sql:/docker-entrypoint-initdb.d/library.sql
    ports:
      - "3306:3306"
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost", "-p${MYSQL_ROOT_PASSWORD}"]
      interval: 10s
      timeout: 5s
      retries: 3

  application:
    container_name: libraryproject2-app-1
    image: gina98/library-test-app:v1
    depends_on:
      database:
       condition: service_healthy
    environment:
      - DB_HOST=jdbc:mysql://database:3306/library
      - DB_USER=root
      - DB_PASS=Stok3s:12!
    ports:
      - "5000:5000"

volumes:
  mysql-data:


EOL

# Ensure the library.sql file exists in the same directory
if [ ! -f "./library.sql" ]; then
  echo "Downloading library.sql file..."
  curl -u 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:x-oauth-basic -o library.sql https://raw.githubusercontent.com/GP-Stanley/java-spring-boot-app/refs/heads/main/mysql-app/library.sql
fi

# Start Docker Compose services
echo "Starting application with Docker Compose..."
docker-compose up --build -d
echo "Application started!"
