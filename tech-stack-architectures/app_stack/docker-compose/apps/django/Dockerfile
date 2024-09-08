# Use the official Python image from Docker Hub
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt into the container
COPY ./requirements.txt /app/requirements.txt

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django app to the working directory
COPY ./demo_app /app

# Set environment variables (for Django production)
ENV DJANGO_SETTINGS_MODULE=demo_app.settings
ENV PYTHONUNBUFFERED=1

# Run database migrations and start Gunicorn
CMD ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:8000", "demo_app.wsgi:application"]
