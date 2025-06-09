#!/bin/bash

echo "Setting up N8N, PostgreSQL, and Ollama environment..."

# Create necessary directories
mkdir -p n8n/data
mkdir -p n8n/podcasts
mkdir -p nginx/ssl
mkdir -p postgres/data

# Create user interests file
cat > n8n/data/user_interests.txt << EOF
Technology
Artificial Intelligence
Climate Change
Space Exploration
Renewable Energy
Cybersecurity
Blockchain
Healthcare Innovation
EOF

# Set proper permissions
chmod 755 n8n/data
chmod 644 n8n/data/user_interests.txt
chmod 755 n8n/podcasts

echo "Directory structure created successfully!"

# Start the services
echo "Starting Docker services..."
docker-compose up -d

# Wait for services to be ready
echo "Waiting for services to start..."
sleep 30

# Check service health
echo "Checking service status..."
docker-compose ps

# Install Ollama models (optional)
echo "Installing Ollama models (this may take a while)..."
docker exec ollama ollama pull llama2
docker exec ollama ollama pull codellama

echo "Setup complete!"
echo "N8N is available at: http://localhost:5678"
echo "PostgreSQL is available at: localhost:5432"
echo "Ollama is available at: http://localhost:11434"
echo "Kokoro is available at: http://localhost:8880/docs"
