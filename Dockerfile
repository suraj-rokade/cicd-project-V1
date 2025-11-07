# Use official lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirement file
COPY requirement.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Copy all project files into container
COPY . .

# Expose port Flask will run on
EXPOSE 5000

# Run the Flask app
CMD ["python", "run.py"]
