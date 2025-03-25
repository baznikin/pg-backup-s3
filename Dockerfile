FROM postgres

ARG S3CMD_VERSION=v2.2.0

RUN apt update && apt install -y \
        ca-certificates \
        bash \
        git \
        curl \
        gettext \
        python3 \
        python3-pip \
        python3-setuptools \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --depth 1 --branch ${S3CMD_VERSION} https://github.com/s3tools/s3cmd.git /tmp/s3cmd \
    && cd /tmp/s3cmd \
    && python3 /tmp/s3cmd/setup.py install \
    && cd / \
    && rm -rf /tmp/s3cmd \
    && mkdir /config \
    && chmod g+rwx /config /root

WORKDIR /config

ENV BUCKET=pg-backups
ENV HOST="stolon-proxy"

ADD startup.sh import_env.sh /opt/
RUN chmod a+x /opt/*.sh

ENTRYPOINT ["/opt/startup.sh"]
