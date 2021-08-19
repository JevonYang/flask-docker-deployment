FROM python:3.7

WORKDIR /data/Project/web_statistics

COPY requirements.txt ./

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y gcc

RUN pip install --no-cache-dir --default-timeout=100  -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple  \
    && pip install --no-cache-dir supervisor==4.2.0 -i https://pypi.tuna.tsinghua.edu.cn/simple  \
    && pip install --no-cache-dir gunicorn==20.0.4 -i https://pypi.tuna.tsinghua.edu.cn/simple  \
    && pip install --no-cache-dir greenlet==0.4.16 -i https://pypi.tuna.tsinghua.edu.cn/simple  \
    && pip install --no-cache-dir eventlet==0.25.2 -i https://pypi.tuna.tsinghua.edu.cn/simple  \
    && pip install --no-cache-dir gevent==20.6.2 -i https://pypi.tuna.tsinghua.edu.cn/simple

# COPY . .

CMD ["gunicorn", "app:app", "-c", "./gunicorn.conf.py"]