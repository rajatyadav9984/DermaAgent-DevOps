# Use official Python 3.10 slim base image
FROM python:3.10-slim

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set working directory inside container
WORKDIR /app

# Install essential system dependencies required for image processing & PyTorch/OpenCV
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gcc \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file first for caching layer
COPY requirements.txt .

# Install PyTorch CPU version & Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch torchvision --extra-index-url https://download.pytorch.org/whl/cpu && \
    pip install --no-cache-dir -r requirements.txt

# Copy application source code and folders
COPY backend/ ./backend/
ARG BUILD_DATE
RUN echo "Frontend build cache key: ${BUILD_DATE}"
COPY frontend/ ./frontend/
COPY model/ ./model/
COPY ml/ ./ml/
COPY agents/ ./agents/
COPY dataset_real/test/ ./dataset_real/test/

# Create runtime directories
RUN mkdir -p uploads results

# Expose Flask app port
EXPOSE 5000

# Container Healthcheck using Flask health endpoint
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:5000/api/health || exit 1

# Launch Flask entry point
CMD ["python", "backend/app.py"]
