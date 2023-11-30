# CJupyter

> jupyter for C++ language

基于 olilarkin/xeus-cling-mpl 镜像来创建自己的 Docker 镜像

![CJupyter](https://drive.google.com/file/d/13A85647T3ZEansHN7qQ3I8DFbWAFHL4N/view?usp=sharing)

## create docker image

```shell
docker build -t cpp_jupyter:latest .
```

## upload my docker image to dockerhub

### Add tag for my docker image
```shell
docker tag cpp_jupyter:latest liupeng0/cpp_jupyter:latest
```
### upload

```shell
docker push liupeng0/cpp_jupyter:latest
```

if can't upload, maybe is your not login, input `docker login` in your terminal.

## pull image

```shell
docker pull liupeng0/cpp_jupyter:latest
```

## create container

```shell
#!/bin/bash

# 设置宿主机上的工作目录路径
work_folder_on_your_host="/home/docker_soft/CJupyter"
port=9999

# 检查 Docker 镜像库中是否存在 cpp_jupyter 镜像
if docker images | grep -q cpp_jupyter; then
    echo "cpp_jupyter 镜像已存在，无需拉取"
else
    echo "拉取 cpp_jupyter 镜像..."
    docker pull liupeng0/cpp_jupyter:latest
fi

# 创建工作目录，如果目录已存在则不会创建
mkdir -p "${work_folder_on_your_host}"

# 检查文件夹是否创建成功
if [ -d "${work_folder_on_your_host}" ]; then
    echo "工作目录 ${work_folder_on_your_host} 创建成功"
else
    echo "工作目录 ${work_folder_on_your_host} 创建失败"
    exit 1
fi

# 设置工作目录的权限为 777
echo "设置工作目录\${work_folder_on_your_host}权限为 777"
chmod 777 ${work_folder_on_your_host}

# 运行 Docker 容器，并将宿主机的工作目录绑定到容器的 /work 目录
echo "运行 cpp_jupyter Docker 容器..."
docker run -it --mount type=bind,source=${work_folder_on_your_host},target=/work -p ${port}:8888 liupeng0/cpp_jupyter:latest

```

