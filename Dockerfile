FROM nginx:1.17.3
COPY /conf/router.conf /etc/nginx/conf.d/
