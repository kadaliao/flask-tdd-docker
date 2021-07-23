# 获取官方镜像
FROM python:3.9.5-slim-buster

# 设置工作目录
WORKDIR /usr/src/app

#### 设置环境变量 ####
ENV PYHTONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 安装系统更依赖
RUN apt-get update \
  && apt-get -y install netcat gcc postgresql \
  && apt-get clean

# 添加安装依赖文件并安装
COPY requirements.txt requirements-dev.txt ./
RUN pip install -r requirements-dev.txt

# 添加应用程序
COPY . .

# 添加 entrypoint.sh
COPY ./entrypoint.sh .
RUN chmod +x /usr/src/app/entrypoint.sh
