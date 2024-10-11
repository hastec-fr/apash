# docker build -t docker.io/hastec/apash:0.1.0 -f ./docker/apash-bash.dockerfile .
# docker run --rm -it hastec/apash:0.1.0
# docker push docker.io/hastec/apash:0.1.0

# Only version is before from for ARG scope
ARG BASH_VERSION=5.2.32
FROM docker.io/bash:${BASH_VERSION}

ARG APASH_BRANCH="main"
ARG APASH_LOCAL_COPY_TO="/dev/null"

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

# Conditional copy, by default it's send to /dev/null
COPY --chown=apash:tribe "." "${APASH_LOCAL_COPY_TO}"

# Change directly the user rights to apash user
# RUN [ -d /home/apash/.apash ] && chown -r apash:tribe /home/apash/.apash

USER apash
WORKDIR /home/apash
SHELL ["/usr/local/bin/bash", "-c"]



# By default, the version from github is selected.
RUN if [ "${APASH_LOCAL_COPY_TO}" = "/dev/null" ]; then \
        rm -rf "/home/apash/.apash"; \
        git clone -b "$APASH_BRANCH" https://github.com/hastec-fr/apash.git /home/apash/.apash; \
    fi; \
    cat <<EOF > $HOME/.bashrc
[ -n "\$APASH_SHELL" ] && return                 # Prevent recursive sourcing (basher init)
export PS1="apash:bash-\${BASH_VERSION%.*} \$ "  ##apashInstallTag
export APASH_SHELL="bash"                        ##apashInstallTag
export APASH_HOME_DIR="\$HOME/.apash"            ##apashInstallTag
export PATH=".:\$PATH:\$APASH_HOME_DIR"          ##apashInstallTag
. "\$APASH_HOME_DIR/apash" source                ##apashInstallTag
unset BASH_ENV                                   # Prevent recursive sourcing (basher init)
EOF

ADD apash /home/apash/.apash/apash
ADD src/bash/fr/hastec/apash.sh /home/apash/.apash/src/bash/fr/hastec/apash.sh

RUN curl -s https://raw.githubusercontent.com/basherpm/basher/master/install.sh | bash && \
    . $HOME/.bashrc && \
    basher install "bats-core/bats-core"

# Force environment file
# @see: https://stackoverflow.com/q/29021704
# @see: https://github.com/NeverOddOrEven/alpine-bash-profile/blob/master/README.md
ENV BASH_ENV="/home/apash/.bashrc"

# Define bash as default binary execution
ENTRYPOINT [ "bash", "-c" ]

# By default create an interactive prompt
CMD [ "bash" ]