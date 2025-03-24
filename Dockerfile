FROM python:3.13-slim

WORKDIR /app

# Create a virtual environment
RUN python -m venv venv

# Install dependencies
COPY requirements.txt .
RUN venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port and run FastAPI with hot reload enabled using virtualenv uvicorn
EXPOSE 8000
CMD ["venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
