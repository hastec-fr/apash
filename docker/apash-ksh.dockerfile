# docker build --build-arg "APASH_LOCAL_COPY=true" -t docker.io/hastec/apash:0.3.0-ksh -f ./docker/apash-ksh.dockerfile .
# docker tag docker.io/hastec/apash:0.3.0-ksh docker.io/hastec/apash:0.3.0
# docker run --rm -it hastec/apash:0.3.0
# docker push docker.io/hastec/apash:0.3.0

# Only version is before from for ARG scope.
ARG SHELL_VERSION=1.0.8
FROM docker.io/debian:bookworm-slim

ARG APASH_BRANCH="main"
ARG APASH_LOCAL_COPY="false"

LABEL maintainer="Benjamin Vargin"

# Dependencies:
# - curl:      download apash installer.
# - git:       download apash.
# - coreutils: The alpine date does not accept UTC time format. This package bring it.
RUN apt-get update && \
    apt-get install -y  curl git ksh

RUN  apt-get install -y vim

RUN groupadd tribe && \
    useradd -g tribe -s /usr/local/bin/ksh --home /home/apash apash

# Install Shellspec as apash user.
# RUN su -c "sh -c 'curl -fsSL https://git.io/shellspec | sh -s -- --yes'" apash

# Change directly the user rights to apash user.
COPY "." "/home/apash/.apash"
RUN chown -R "apash:tribe" "/home/apash/"

USER apash
WORKDIR /home/apash
SHELL ["/bin/ksh", "-c"]

# Install Shellspec as apash user.
RUN sh -c 'curl -fsSL https://git.io/shellspec | sh -s -- --yes'

# # By default, the version from github is selected.
RUN if [ "${APASH_LOCAL_COPY}" = "false" ]; then \
        rm -rf "/home/apash/.apash"; \
        git clone -b "$APASH_BRANCH" https://github.com/hastec-fr/apash.git /home/apash/.apash; \
    fi; \
    cat <<EOF > $HOME/.kshrc
export PS1="apash:ksh-\${APASH_SHELL_VERSION} \$ "     ##apashInstallTag
export PATH="\$PATH:$HOME/.local/bin"                  ##apashInstallTag
export APASH_HOME_DIR="\$HOME/.apash"                  ##apashInstallTag
. "\$APASH_HOME_DIR/.apashrc"                          ##apashInstallTag
#. "\$APASH_HOME_DIR/apash.source"                      ##apashInstallTag
EOF

# Force environment file
# @see: https://stackoverflow.com/q/29021704
# @see: https://github.com/NeverOddOrEven/alpine-bash-profile/blob/master/README.md
ENV KSH_ENV="/home/apash/.kshhrc"

# Define ksh as default binary execution.
ENTRYPOINT [ "/bin/ksh", "-c" ]

# By default create an interactive prompt.
CMD [ "ksh" ]
