# Dockerfile

# Use the official tiangolo FastAPI image
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY ./requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI application into the container
COPY ./app /app/app

# Set environment variables (for FastAPI production)
ENV PYTHONUNBUFFERED=1

# Expose the FastAPI default port
EXPOSE 8000

# Run the FastAPI app with Gunicorn using Uvicorn workers
CMD ["gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "app.main:app"]
