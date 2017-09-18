FROM docker.io/centos:7

MAINTAINER shanbo "wanglonghai@gomeplus.com"

# Create
#RUN mkdir -p /home/service/server
WORKDIR /home/service/server

# Bundle
COPY . /home/service/server

# dependence
# RUN yum install -y openssl openssl-devel
RUN  rpm --import /etc/pki/rpm-gpg/RPM*
RUN yum -y install make zlib zlib-devel gcc-c++ libtool openssl openssl-devel  pcre pcre-devel
RUN cd tengine && ./configure --prefix=/usr/local/nginx  --with-http_gzip_static_module  --with-http_concat_module && make && make install
CMD /usr/local/nginx/sbin/nginx -g 'daemon off;'
#CMD cat /usr/local/nginx/logs/error.log
