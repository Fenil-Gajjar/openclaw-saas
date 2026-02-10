FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Install OpenClaw
RUN pip install --no-cache-dir \
    anthropic \
    boto3 \
    psycopg2-binary \
    python-dotenv \
    requests

# Clone OpenClaw (replace with your fork if modified)
WORKDIR /app
RUN git clone https://github.com/OpenClaw/openclaw.git .

# Copy agent configurations
COPY openclaw/ /app/

# Set entrypoint
ENTRYPOINT ["python", "main.py"]
