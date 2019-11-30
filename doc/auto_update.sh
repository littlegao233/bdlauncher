#!/bin/bash
if [ ! -f "bedrock-server1.13.zip" ]; then
    echo 下载服务端
    wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.13.3.0.zip
    mv bedrock-server-*.*.*.*.zip bedrock-server1.13.zip
    mv server.properties server.propertie
    mv whitelist.json whitelist.jso
    mv permissions.json permissions.jso
    unzip bedrock-server1.13.zip
    rm -rf whitelist.json
    rm -rf server.properties
    mv server.propertie server.properties
    mv whitelist.jso whitelist.json
    mv permissions.jso permissions.json
fi
echo 下载文件中...
git clone https://github.com/sysca11/bdlauncher --depth=1
if [ ! -d "mods" ]; then
  echo 创建mods目录...
  mkdir mods
else
  echo 删除旧的mods.so...
  rm -rf mods/*.so
fi
if [ ! -f "mods/mod.list" ]; then
  echo 复制mod.list文件到mods/...
  cp -a ./bdlauncher/mod.list ./mods
fi
echo 复制全部mod文件到mods/...
cp -a ./bdlauncher/out/* ./mods
if [ ! -d "config" ]; then
    echo 创建config目录...
    mkdir config
    echo 复制mod配置文件到config/...
    cp -a ./bdlauncher/config/* ./config
fi
echo 清理文件中...
rm -rf bdlauncher
