# 获取官方镜像
FROM python:3.9.5-slim-buster

# 设置工作目录
WORKDIR /usr/src/app

#### 设置环境变量 ####
ENV PYHTONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 添加安装依赖文件并安装
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# 添加应用程序
COPY . .

# 运行服务器
CMD python manage.py run -h 0.0.0.0
