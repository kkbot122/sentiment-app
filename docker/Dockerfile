FROM alpine:latest

RUN apk add --no-cache python3

WORKDIR /www

COPY index.html /www/index.html

EXPOSE 80

CMD sh -c 'echo "Sentiment Engine Ingesting" && python3 -m http.server 80 --bind 0.0.0.0'
