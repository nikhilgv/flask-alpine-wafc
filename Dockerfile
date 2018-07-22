FROM python:2.7.15-alpine3.6

COPY requirements.txt /
RUN pip install -r requirements.txt

COPY sshd_config /etc/ssh/

RUN apk --update add g++ \
    libffi-dev \
    openssl-dev \
    openssh \
    openrc \
    bash 

COPY . /app
WORKDIR /app

RUN chmod 755 /app/init_container.sh

EXPOSE 2222 5000

ENTRYPOINT ["/app/init_container.sh"]