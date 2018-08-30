#!/bin/bash

docker run -d \
-p 7080:8080 \
-p 50000:50000 \
--name jenkins \
-u root \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker \
-v /usr/lib/x86_64-linux-gnu/libltdl.so.7:/usr/lib/x86_64-linux-gnu/libltdl.so.7 \
-v ~/jenkins:/var/jenkins_home  \
-v /usr/share/maven:/usr/local/maven \
-v /usr/lib/jvm/jdk1.8:/usr/local/jdk jenkinsci/jenkins 

