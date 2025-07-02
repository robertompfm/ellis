# Use an official Python runtime as a parent image
FROM python:3.13.5-alpine3.22

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies first
# This leverages Docker layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app will run on
EXPOSE 8000

# Run the application with a production-ready server (uvicorn)
# The app is named 'app' inside the 'app.py' file
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
