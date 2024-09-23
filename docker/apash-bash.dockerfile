# docker build -t docker.io/hastec/apash:0.1.0 -f ./docker/apash-bash.dockerfile .
# docker run --rm -it --name apash-dev hastec/apash:0.1.0
FROM docker.io/bash:5.2.32

RUN apk update && \
    apk add --no-cache curl git shadow

RUN addgroup -S tribe && \
    adduser -s /usr/local/bin/bash --home /home/apash -S -G tribe apash

USER apash
WORKDIR /home/apash
SHELL ["/usr/local/bin/bash", "-c"]

RUN git clone -b HASTEC_DEV_0.1.0 https://github.com/hastec-fr/apash.git /home/apash/.apash && \
    cat <<EOF > $HOME/.bashrc
[ -n "\$APASH_SHELL" ] && return         # Prevent recursive sourcing
export APASH_SHELL="bash"                ##apashInstallTag
export APASH_HOME_DIR="\$HOME/.apash"    ##apashInstallTag
export PATH="\$PATH:\$APASH_HOME_DIR"    ##apashInstallTag
. "\$APASH_HOME_DIR/apash" source        ##apashInstallTag
unset BASH_ENV                           # Prevent recursive sourcing
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

# Define default command for passing unitary tests.
CMD [ "apash test" ]
