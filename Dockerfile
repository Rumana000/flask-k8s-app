FROM python:3.9-slim



# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code
COPY app.py .

# Expose port 5000
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]