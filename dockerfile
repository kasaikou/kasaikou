ARG username=vscode
ARG useruid=1000
ARG usergid=1000
ARG base

FROM ${base}

ARG username
ARG useruid
ARG usergid

RUN groupadd --gid ${usergid} ${username} && \
    useradd -s /bin/bash --uid ${useruid} --gid ${usergid} -m ${username} && \
    echo ${username} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${username} && \
    chmod 0440 /etc/sudoers.d/${username}

USER ${username}
ENV PATH=${PATH}:/home/${username}/go/bin

# Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.6.1
ENV PATH=${PATH}:/home/${username}/.local/bin
