# Filename: Dockerfile
FROM instantlinux/nut-uspd:2.8.0-r4

WORKDIR /etc/nut
COPY upsmon.conf upssched.conf ./
WORKDIR /etc/ssmtp
COPY ssmtp.conf ./

RUN apk update
RUN apk add ssmtp ansible py3-pip
RUN pip3 install requests pyvmomi