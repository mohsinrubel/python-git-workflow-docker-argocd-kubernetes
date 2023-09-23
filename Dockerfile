# Use an official Python runtime as the base image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

RUN python manage.py migrate
# Expose the port that the application will run on
EXPOSE 8000

# Define the default command to run when the container starts
#CMD ["gunicorn", "todo-list.wsgi:application", "--bind", "0.0.0.0:8000"]
RUN python manage.py test

CMD  python manage.py runserver 0.0.0.0:8000
