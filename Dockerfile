FROM centos:7

RUN useradd frank && echo "1234" | passwd frank --stdin
RUN yum install mysql
RUN systemctl enable mysql
