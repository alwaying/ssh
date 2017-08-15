#this dockerfile use the centos image
#version 7.3.1611
#Author: jun.peng@youbiai.com

#ָ����������
FROM centos:7.3.1611

#ά������Ϣ
MAINTAINER jun.peng jun.peng@youbiai.com

#��װopenssh����
RUN {\
 yum install -y openssh-server openssh-clients;\
 ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys;\
 ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key;\
 ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key;\
 ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key;\
}

#���⿪�Ŷ˿ں�
EXPOSE 22

#��������ʱִ��ָ����ָ��϶�ʹ�ýű�������ִֻ�����һ��
CMD ["/usr/sbin/sshd"]
