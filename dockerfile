ARG user
ARG uid
ARG gid
ARG base

FROM ${base}

ARG user
ARG uid
ARG gid

RUN groupadd --gid ${gid} ${user} && \
    useradd -s /bin/bash --uid ${uid} --gid ${gid} -m ${user} && \
    echo ${user} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${user} && \
    chmod 0440 /etc/sudoers.d/${user}

USER ${user}
ENV PATH=${PATH}:/home/${user}/go/bin

# Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.6.1
ENV PATH=${PATH}:/home/${user}/.local/bin
