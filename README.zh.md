中文 &nbsp; | &nbsp; [English](README.md)

# spring-native-image

## 介绍

一个基于Docker的构建工具，用于将Spring AOT Jar文件批量转换为Linux二进制可执行文件。
不同于Spring Native直接生成Docker镜像，本工具生成的二进制文件提供更灵活的操作。

## 用法

**注意**: 仅支持Spring Boot 3！

1. 在Spring Boot中生成AOT Jar.
2. 克隆该仓库，在**jar**目录下放入AOT Jar（支持多个），运行 `docker-compose up` 即可在**target**目录下获得生成的二进制文件。
