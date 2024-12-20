FROM python:3.8-slim

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install required system dependencies
RUN apt-get update && apt-get install -y python3-distutils

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any additional Python dependencies from requirements.txt
RUN pip install -r requirements.txt

# Run database migrations
RUN python manage.py migrate

# Command to run the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]


