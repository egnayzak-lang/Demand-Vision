FROM python:3.12-slim

WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Build model artifacts during image startup if they are not already present.
EXPOSE 5000
CMD ["sh", "-c", "if [ ! -f model/ai_model.pkl ]; then python prepare_model.py --data retail_store_inventory.csv; fi && exec gunicorn --bind 0.0.0.0:${PORT:-5000} --workers 1 --timeout 120 app:app"]
