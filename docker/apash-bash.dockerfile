# docker build -t docker.io/hastec/apash:0.2.0-bash -f ./docker/apash-bash.dockerfile .
# docker tag docker.io/hastec/apash:0.2.0-bash docker.io/hastec/apash:0.2.0
# docker run --rm -it hastec/apash:0.2.0
# docker push docker.io/hastec/apash:0.2.0

# Only version is before from for ARG scope
ARG SHELL_VERSION=5.2.32
FROM docker.io/bash:${SHELL_VERSION}

ARG APASH_BRANCH="main"
ARG APASH_LOCAL_COPY="false"

LABEL maintainer="Benjamin Vargin"

# Dependencies:
# - curl:      download apash installer
# - git:       download apash
# - coreutils: The alpine date does not accept UTC time format. This package bring it.
RUN apk update && \
    apk add --no-cache curl git coreutils tzdata

# RUN apk add vim

RUN addgroup -S tribe && \
    adduser -s /usr/local/bin/bash --home /home/apash -S -G tribe apash

# Install Shellspec as apash user
RUN su -c "sh -c 'curl -fsSL https://git.io/shellspec | sh -s -- --yes'" apash

# Change directly the user rights to apash user
COPY "." "/home/apash/.apash"
RUN chown "apash:tribe" "/home/apash/.apash"

USER apash
WORKDIR /home/apash
SHELL ["/usr/local/bin/bash", "-c"]

# By default, the version from github is selected.
RUN if [ "${APASH_LOCAL_COPY}" = "false" ]; then \
        rm -rf "/home/apash/.apash"; \
        git clone -b "$APASH_BRANCH" https://github.com/hastec-fr/apash.git /home/apash/.apash; \
    fi; \
    cat <<EOF > $HOME/.bashrc
export PS1="apash:bash-\${BASH_VERSION%.*} \$ "  ##apashInstallTag
export PATH="\$PATH:$HOME/.local/bin"            ##apashInstallTag
export APASH_HOME_DIR="\$HOME/.apash"            ##apashInstallTag
. "\$APASH_HOME_DIR/.apashrc"                    ##apashInstallTag
. "\$APASH_HOME_DIR/apash.source"                ##apashInstallTag
EOF

# Force environment file
# @see: https://stackoverflow.com/q/29021704
# @see: https://github.com/NeverOddOrEven/alpine-bash-profile/blob/master/README.md
ENV BASH_ENV="/home/apash/.bashrc"

# Define bash as default binary execution
ENTRYPOINT [ "bash", "-c" ]

# By default create an interactive prompt
CMD [ "bash" ]
