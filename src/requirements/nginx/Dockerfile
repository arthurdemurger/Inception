FROM	debian:buster

RUN		apt-get -y update && apt-get -y install nginx

COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE	80/TCP

CMD		["nginx", "-g", "daemon off;"]
