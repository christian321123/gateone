FROM centos:7.6.1810

ENV GATEONE_REPO_URL https://github.com/liftoff/GateOne.git

ADD update_and_run_gateone.py /usr/bin/update_and_run_gateone

RUN yum -y install wget git openssl openssl-devel
RUN wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py && python get-pip.py
RUN pip install tornado==4.1 html5lib

RUN mkdir -p /gateone/logs && \
    mkdir -p /gateone/users && \
    mkdir -p /etc/gateone/conf.d && \
    mkdir -p /etc/gateone/ssl && \
    cd /gateone && \
    git clone $GATEONE_REPO_URL && \
    cd GateOne && \
    python setup.py install && \
    cp docker/60docker.conf /etc/gateone/conf.d/60docker.conf

RUN /usr/bin/gateone --configure \
    --log_file_prefix="/gateone/logs/gateone.log"

RUN rm -f /etc/gateone/ssl/key.pem && \
    rm -f /etc/gateone/ssl/certificate.pem

ADD 10server.conf /etc/gateone/conf.d/10server.conf
EXPOSE 8000

CMD ["/usr/bin/update_and_run_gateone", "--log_file_prefix=/gateone/logs/gateone.log"]
