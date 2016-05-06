#/bin/bash

rm -rf ./zato-cert-dev
rm -rf ./zato-docker-odb-dev
rm -rf ./zato-docker-lb-dev
rm -rf ./zato-docker-wa-dev
rm -rf ./zato-docker-srv1-dev
rm -rf ./zato-docker-srv2-dev

mkdir -p ./zato-cert-dev && cd ./zato-cert-dev \
    && curl -O https://zato.io/download/docker/2.0/components/gencert.sh \
    && chmod +x gencert.sh && ./gencert.sh

cd ../

mkdir -p ./zato-docker-odb-dev && cd ./zato-docker-odb-dev \
    && curl -O https://zato.io/download/docker/2.0/components/odb/Dockerfile \
    && curl -O https://zato.io/download/docker/2.0/components/odb/zato_odb.config \
    && curl -O https://zato.io/download/docker/2.0/components/odb/zato_cluster.config

cd ../

mkdir -p ./zato-docker-lb-dev && cd ./zato-docker-lb-dev \
    && curl -O https://zato.io/download/docker/2.0/components/load-balancer/Dockerfile \
    && curl -O https://zato.io/download/docker/2.0/components/load-balancer/zato_load_balancer.config

cd ../

mkdir -p ./zato-docker-wa-dev && cd ./zato-docker-wa-dev \
    && curl -O https://zato.io/download/docker/2.0/components/web-admin/Dockerfile \
    && curl -O https://zato.io/download/docker/2.0/components/web-admin/zato_web_admin.config \
    && curl -O https://zato.io/download/docker/2.0/components/web-admin/zato_update_password.config

cd ../

mkdir -p ./zato-docker-srv1-dev && cd ./zato-docker-srv1-dev \
    && curl -O https://zato.io/download/docker/2.0/components/server1/Dockerfile \
    && curl -O https://zato.io/download/docker/2.0/components/server1/zato_server.config

cd ../

mkdir -p ./zato-docker-srv2-dev && cd ./zato-docker-srv2-dev \
    && curl -O https://zato.io/download/docker/2.0/components/server2/Dockerfile \
    && curl -O https://zato.io/download/docker/2.0/components/server2/zato_server.config

cd ../


cp ./zato-cert-dev/*.pem ./zato-docker-odb-dev/
cp ./zato-cert-dev/*.pem ./zato-docker-lb-dev/
cp ./zato-cert-dev/*.pem ./zato-docker-wa-dev/
cp ./zato-cert-dev/*.pem ./zato-docker-srv1-dev/
cp ./zato-cert-dev/*.pem ./zato-docker-srv2-dev/

#sudo docker-compose build