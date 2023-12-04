#!/bin/bash

# 设置宿主机上的工作目录路径
work_folder_on_your_host="/home/docker_soft/JavaJupyter"
port=9996

# 检查 Docker 镜像库中是否存在 cpp_jupyter 镜像
if docker images | grep -q java_jupyter; then
    echo "cpp_jupyter 镜像已存在，无需拉取"
else
    echo "拉取 cpp_jupyter 镜像..."
    docker pull liupeng0/java_jupyter:latest
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
echo "运行 java_jupyter Docker 容器..."
docker run -itd -p ${port}:8888 -v ${work_folder_on_your_host}:/home/jupyter liupeng0/java_jupyter:latest
