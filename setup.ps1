Write-Host "Setting up N8N, PostgreSQL, and Ollama environment..."

# Create necessary directories
New-Item -ItemType Directory -Force -Path "n8n\data"
New-Item -ItemType Directory -Force -Path "n8n\podcasts"
New-Item -ItemType Directory -Force -Path "nginx\ssl"
New-Item -ItemType Directory -Force -Path "postgres\data"

# Create user interests file
@"
Technology
Artificial Intelligence
Climate Change
Space Exploration
Renewable Energy
Cybersecurity
Blockchain
Healthcare Innovation
"@ | Out-File -FilePath "n8n\data\user_interests.txt" -Encoding UTF8

Write-Host "Directory structure created successfully!"

# Start the services
Write-Host "Starting Docker services..."
docker-compose up -d

# Wait for services to be ready
Write-Host "Waiting for services to start..."
Start-Sleep -Seconds 30

# Check service health
Write-Host "Checking service status..."
docker-compose ps

Write-Host "Setup complete!"
Write-Host "N8N is available at: http://localhost:5678"