FROM nginx

LABEL maintainer=docker@marekurban.de

# Install apps
COPY source /usr/share/nginx/html
