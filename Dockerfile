FROM  zatosource/zato-2.0.7-quickstart
MAINTAINER Nikolay Beketov <nbek@miko.ru>

# create cluster
RUN cd /opt/zato/ && \
    rm create_quickstart.sh && \
    curl -O -L "https://github.com/jorikfon/zatoesb/create_quickstart.sh"  && \
    chown +x create_quickstart.sh && \
    /opt/zato/create_quickstart.sh
