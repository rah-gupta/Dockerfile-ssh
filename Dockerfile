# Image can act as a slave node to Jenkins master
# [ user:password == jenkins:jenkins ]

FROM centos
RUN yum install openssh-server -y
RUN /usr/bin/ssh-keygen -A
RUN adduser jenkins
RUN yum install -y passwd
RUN echo "jenkins" | passwd --stdin jenkins
RUN rm -f /run/nologin
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
