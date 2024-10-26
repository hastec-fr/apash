# docker build -t docker.io/hastec/apash:0.2.0-zsh -f ./docker/apash-zsh.dockerfile .
# docker run --rm -it hastec/apash:0.2.0-zsh
# docker push docker.io/hastec/apash:0.2.0-zsh

# Only version is before from for ARG scope
ARG ZSH_VERSION=5.9
FROM docker.io/zshusers/zsh:${ZSH_VERSION}

ARG APASH_BRANCH="main"
ARG APASH_LOCAL_COPY="false"

LABEL maintainer="Benjamin Vargin"

# Dependencies:
# - curl:      download apash installer
# - git:       download apash
# - shadow:    Initially for chsh (no more used @todo check if it can be removed).
# - coreutils: The alpine date does not accept UTC time format. This package bring it.
RUN apt update && \
    apt install -y curl git bc coreutils tzdata

RUN apt install -y vim

RUN addgroup tribe && \
    adduser --shell /usr/bin/zsh --home /home/apash --ingroup tribe --disabled-password --gecos apash apash

# Change directly the user rights to apash user
COPY "." "/home/apash/.apash"
RUN chown "apash:tribe" "/home/apash/.apash"

USER apash
WORKDIR /home/apash
SHELL ["/usr/bin/zsh", "-c"]

# Install Shellspec
RUN curl -fsSL https://git.io/shellspec | sh -s -- --yes    

# By default, the version from github is selected.
# Add interactivecomments to allow copy/paste on zsh with # sign
RUN if [ "${APASH_LOCAL_COPY}" = "false" ]; then \
        rm -rf "/home/apash/.apash"; \
        git clone -b "$APASH_BRANCH" https://github.com/hastec-fr/apash.git /home/apash/.apash; \
    fi; \
    cat <<EOF > $HOME/.zshenv
export PS1="apash:zsh-\${ZSH_VERSION} \$ "                  ##apashInstallTag
export APASH_SHELL="zsh"                                    ##apashInstallTag
export APASH_HOME_DIR="\$HOME/.apash"                       ##apashInstallTag
export PATH=".:\$PATH:\$HOME/.local/bin:\$APASH_HOME_DIR"   ##apashInstallTag
# setopt ksh_arrays                                         ##apashInstallTag
export LANG=C.UTF-8                                         ##apashInstallTag
export LC_ALL=C.UTF-8                                       ##apashInstallTag
. "\$APASH_HOME_DIR/apash" source                           ##apashInstallTag
setopt interactivecomments                                  ##apashInstallTag
EOF

# Force environment file
ENV ZSH_ENV="/home/apash/.zshenv"

# Define bash as default binary execution
ENTRYPOINT [ "zsh", "-c" ]

# By default create an interactive prompt
CMD [ "zsh" ]