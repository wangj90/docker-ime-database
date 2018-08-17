# docker-ime-database
docker构建ime软件的oracle数据库服务器，针对ime软件的版本：ime_V2.0.1_Sprint4_0810

容器运行步骤：

- 将imp.db文件放在宿主机的某一目录下。例如：/home/wangjun/docker_volumes/ime_volumes

- 启动容器

  docker run -it --name ime-database -p 1521:1521 -v /home/wangjun/docker_volumes/ime_volumes:/u01/dbimport ime-database

  1. 容器命名为ime-database；

  2. 映射宿主机的1521端口到容器的1521端口；

  3. 映射宿主机的/home/wangjun/docker_volumes/ime_volumes文件夹到容器的/u01/dbimport 文件夹
