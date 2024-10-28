# docker build -t docker.io/hastec/apash:0.1.0 -f ./docker/apash-bash.dockerfile .
# docker run --rm -it hastec/apash:0.1.0
# docker push docker.io/hastec/apash:0.1.0

# Only version is before from for ARG scope
ARG BASH_VERSION=5.2.32
FROM docker.io/bash:${BASH_VERSION}

ARG APASH_BRANCH="main"
ARG APASH_LOCAL_COPY="false"

LABEL maintainer="Benjamin Vargin"

# Dependencies:
# - curl:      download apash installer
# - git:       download apash
# - shadow:    Initially for chsh (no more used @todo check if it can be removed).
# - coreutils: The alpine date does not accept UTC time format. This package bring it.
RUN apk update && \
    apk add --no-cache curl git shadow coreutils tzdata

RUN addgroup -S tribe && \
    adduser -s /usr/local/bin/bash --home /home/apash -S -G tribe apash

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
export PS1="apash:bash-\${BASH_VERSION%.*} \$ "             ##apashInstallTag
export APASH_SHELL="bash"                                   ##apashInstallTag
export APASH_SHELL_VERSION="\${BASH_VERSION%.*}"            ##apashInstallTag
export APASH_HOME_DIR="\$HOME/.apash"                       ##apashInstallTag
export PATH=".:\$PATH:\$HOME/.local/bin:\$APASH_HOME_DIR"   ##apashInstallTag
. "\$APASH_HOME_DIR/apash" source                           ##apashInstallTag
EOF

# Install Shellspec
RUN curl -fsSL https://git.io/shellspec | sh -s -- --yes

# Force environment file
# @see: https://stackoverflow.com/q/29021704
# @see: https://github.com/NeverOddOrEven/alpine-bash-profile/blob/master/README.md
ENV BASH_ENV="/home/apash/.bashrc"

# Define bash as default binary execution
ENTRYPOINT [ "bash", "-c" ]

# By default create an interactive prompt
CMD [ "bash" ]