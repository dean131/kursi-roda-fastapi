# Gunakan image Python 3.13-slim sebagai base
FROM python:3.13.2-slim

# Set working directory di dalam kontainer
WORKDIR /app

# Install dependensi sistem yang diperlukan (jika ada)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy file requirements.txt ke kontainer
COPY requirements.txt .

# Install dependensi Python
RUN pip install --no-cache-dir -r requirements.txt

# Expose port yang digunakan oleh FastAPI
EXPOSE 8000

# Perintah untuk menjalankan aplikasi FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]