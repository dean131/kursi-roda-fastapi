# Gunakan base image Python
FROM python:3.13-slim

# Set working directory di dalam container
WORKDIR /app

# Install dependensi sistem yang diperlukan (jika ada)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy kode aplikasi
COPY . .

# Expose port yang digunakan oleh FastAPI
EXPOSE 8000

# Jalankan aplikasi dalam virtual environment
CMD ["/venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]