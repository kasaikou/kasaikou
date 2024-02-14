ARG user
ARG uid
ARG gid
ARG base

FROM ${base}

ARG user
ARG uid
ARG gid

USER root

RUN usermod -l ${user} container && \
    groupmod -n ${user} container && \
    usermod -d /home/${user} -m ${user} && \
    usermod -u ${uid} ${user} && \
    groupmod -g ${gid} ${user} && \
    echo ${user} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${user} && \
    chmod 0440 /etc/sudoers.d/${user}

USER ${user}
ENV PATH=/home/${user}/go/bin:${PATH}
