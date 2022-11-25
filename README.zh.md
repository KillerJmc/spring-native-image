中文 &nbsp; | &nbsp; [English](README.md)

# spring-native-image

## 介绍

一个基于Docker的构建工具，用于将Spring AOT Jar文件批量转换为Linux二进制可执行文件。
不同于Spring Native直接生成Docker镜像，本工具生成的二进制文件提供更灵活的操作。

## 用法

1. 生成AOT Jar
   + Maven:
     + 添加仓库
         ```xml
         <repositories>
             <repository>
                 <id>spring-releases</id>
                 <url>https://repo.spring.io/release</url>
             </repository>
         </repositories>
         ```
   
         ```xml
         <pluginRepositories>
              <pluginRepository>
                  <id>spring-releases</id>
                  <url>https://repo.spring.io/release</url>
              </pluginRepository>
          </pluginRepositories>
         ```

     + 添加**版本变量**和**Spring Native**依赖
         ```xml
         <properties>
             <spring-native.version>0.12.1</spring-native.version>
         </properties>
         ```
         ```xml
         <dependency>
             <groupId>org.springframework.experimental</groupId>
             <artifactId>spring-native</artifactId>
             <version>${spring-native.version}</version>
         </dependency>
         ```
         ```xml
         <build>
             <plugins>
                 <plugin>
                     <groupId>org.springframework.experimental</groupId>
                     <artifactId>spring-aot-maven-plugin</artifactId>
                     <version>${spring-native.version}</version>
                     <executions>
                         <execution>
                             <id>generate</id>
                             <goals>
                                 <goal>generate</goal>
                             </goals>
                         </execution>
                     </executions>
                 </plugin>
             </plugins>
         </build>
         ```
   + 运行`mvn package`获得AOT Jar

2. 克隆该仓库，在**jar**目录下放入AOT Jar（支持多个），运行 `docker-compose up` 即可在**target**目录下获得生成的二进制文件。
