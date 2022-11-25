#!/bin/bash

# 获取jar文件名称
jarNames=`ls /jar | sed "s/\.jar//"`

# 遍历jar文件名称
for jarName in $jarNames;
do
  echo "Converting $jarName.jar to binary..."

  # 创建jar解压目录
  mkdir "/jar/$jarName"

  # 解压jar文件
  cd "/jar/$jarName" && jar -xf "/jar/$jarName.jar"

  # 移动GraalVM配置文件到类路径
  mv -f "META-INF" "BOOT-INF/classes"

  # 获取依赖的jar包路径，用":"分割
  libs=`ls -1 "BOOT-INF/lib" | awk '{print "BOOT-INF/lib/"$0}' | tr '\n' ':'`

  # 通过解压的jar文件开始构建二进制文件
  native-image -o "/target/$jarName" -cp "BOOT-INF/classes:$libs"

  # 删除jar文件解压文件夹
  rm -rf "/jar/$jarName"

  # 删除生成的无用文件
  rm "/target/$jarName.o"
  rm "/target/$jarName.build_artifacts.txt"
done

