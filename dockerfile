#Base image

FROM centos:7

LABEL description="dockerfile to containerize an apache application"

#Update all packages
RUN yum -y update

#install apache
RUN yum install -y httpd

#copy web app from local to the container
COPY index.html /var/www/html

#port on which the app should listen 
EXPOSE 80

#systemctl start httpd
#to run a Command you either use CMD or ENTRYPOINT. CMD can be overridden while ENTRYPOINT can not

ENTRYPOINT [ "/usr/sbin/httpd" ]

#Run the container in the background so that the ocntainer does not exit

CMD [ "-D", "FOREGROUND" ]
