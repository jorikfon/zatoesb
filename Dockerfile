FROM  zatosource/zato-2.0.7-quickstart
MAINTAINER Nikolay Beketov <nbek@miko.ru>

# create cluster
RUN cd /opt/zato/ && \
    rm create_quickstart.sh && \
    rm -rf ./zato-cert-dev
    mkdir -p ./zato-cert-dev && cd ./zato-cert-dev && \
    curl -O -L "https://raw.githubusercontent.com/jorikfon/zatoesb/master/gencert.sh"  && \
    chmod +x gencert.sh && ./gencert.sh
    cd /opt/zato/ && \
    curl -O -L "https://raw.githubusercontent.com/jorikfon/zatoesb/master/create_quickstart.sh"  && \
    chmod +x create_quickstart.sh && \
    /opt/zato/create_quickstart.sh
