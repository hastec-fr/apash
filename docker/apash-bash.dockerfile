# docker build -t docker.io/hastec-fr/apash:0.1.0 -f .\docker\apash-bash.dockerfile .
# docker run --rm -it --name apash-dev hastec-fr/apash:0.1.0
FROM docker.io/bash:5.2.32

RUN apk update && \
    apk add --no-cache curl git shadow

RUN addgroup -S tribe && \
    adduser --home /home/apash -S -G tribe apash && \
    chsh -s /usr/local/bin/bash apash

USER apash
WORKDIR /home/apash
SHELL ["/usr/local/bin/bash", "-c"]

RUN git clone -b HASTEC_DEV_0.1.0 https://github.com/hastec-fr/apash.git /home/apash/.apash && \
    cat <<EOF > /home/apash/.bashrc
    export APASH_SHELL="bash"               ##apashInstallTag
    export APASH_HOME_DIR="\$HOME/.apash"   ##apashInstallTag
    export PATH="\$PATH:\$APASH_HOME_DIR"   ##apashInstallTag
    . "\$APASH_HOME_DIR/apash"              ##apashInstallTag
EOF

ADD apash /home/apash/.apash/apash
ADD src/bash/fr/hastec/apash.sh /home/apash/.apash/src/bash/fr/hastec/apash.sh

RUN curl -s https://raw.githubusercontent.com/basherpm/basher/master/install.sh | bash && \
    . /home/apash/.bashrc && \
    basher install "bats-core/bats-core" && \
    cp "/home/apash/.bashrc" "/home/apash/.bash_profile"

    
CMD ["bash", "-l", "-c" ]
#RUN basher install "bats-core/bats-core"
    # . $HOME/.bashrc &&
    # basher install "bats-core/bats-core"

# 
# basher install "bats-core/bats-core"
# 
# basher install "reconquest/shdoc"

