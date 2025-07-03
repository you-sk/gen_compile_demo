#!/bin/bash

echo "Building SGDK Hello World ROM..."

# 現在のユーザーIDとグループIDを設定
export UID=$(id -u)
export GID=$(id -g)

# Dockerコンテナ内でビルド実行
docker-compose run --rm sgdk-dev make rom_copy

echo "Build completed!"
echo "ROM file: hello_world.bin"
echo "Load this file in a Mega Drive emulator to test."