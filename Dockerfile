# Use Python 3.13 slim as the base image
# Slim keeps the image smaller by excluding unnecessary packages
FROM python:3.13-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application files into the container
COPY . .

# Install Python dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Start the Python application when the container runs
CMD ["python", "app.py"]