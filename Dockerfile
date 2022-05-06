FROM centos:7

RUN useradd frank && echo "1234" | passwd frank --stdin
RUN yum update -y
RUN yum install mysql -y
#RUN systemctl restart mysqld
