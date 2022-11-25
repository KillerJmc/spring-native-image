[中文](README.zh.md) &nbsp; | &nbsp; English

# spring-native-image

## Description

A Docker based build tool for batch converting Spring AOT Jar files into Linux binary executable files.
Different from Spring Native directly generating Docker images, the binary files generated by this tool provide more flexible operations.

## Usage

1. Generate AOT Jar.
   + Maven:
      + Add repositories
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

      + Add **version variables** and **Spring Native** dependencies.
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
   + Run `mvn package` to get AOT Jar.

2. Clone this repository, put AOT Jars in the **jar** directory, run `docker-compose up` to get the binary file in the **target** directory.
