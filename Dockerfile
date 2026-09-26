FROM python:3.10-slim

WORKDIR /app

# تحديث النظام وتثبيت الحزم الأساسية
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# نسخ ملف المتطلبات وتثبيت المكتبات
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ كود البوت
COPY bot.py .

# تشغيل البوت (تم تعديل هذا السطر لحل المشكلة)
CMD python bot.py
