FROM nginx:1.17.3
COPY /conf/default.conf /etc/nginx/conf.d
COPY /conf/nginx.conf /etc/nginx/
COPY /html /usr/share/nginx/html

