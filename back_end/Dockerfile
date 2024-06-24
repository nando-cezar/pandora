# Use the official Python image as base
FROM python:3.9.19-bookworm

# Set the working directory inside the container
WORKDIR /app

# Copy only the requirements file first to leverage Docker caching
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Command to run the Flask application
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5000"]
