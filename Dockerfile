FROM centos:7

RUN for user in frank; do useradd $user; echo "1234" | passwd $user --stdin; done
RUN yum update && yum install mysql -y
