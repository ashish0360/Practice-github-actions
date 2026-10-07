# Use Python 3.13 slim as a lightweight base image
FROM python:3.13-slim

# Set the working directory for the application
WORKDIR /app

# Copy application source code and dependency files into the image
COPY . .

# Install Python dependencies without keeping pip cache
RUN pip install --no-cache-dir -r requirements.txt

# Run the Flask application using Gunicorn on port 80
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]