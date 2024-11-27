# @name: apash-bash-ready
# @description
#   Based on apash-bash.dockerfile, it preloads the minified script
#
# @example
# docker build --build-arg APASH_SHELL=${APASH_SHELL} -t docker.io/hastec/apash:0.2.0-${APASH_SHELL}-ready -f ./docker/apash-ready.dockerfile .
# docker run --rm -it --name apash-ready hastec/apash:0.2.0-ready
# docker push docker.io/hastec/apash:0.2.0-ready
#
# Bash is the default tag:
# docker tag docker.io/hastec/apash:0.2.0-bash-ready docker.io/hastec/apash:0.2.0-ready
ARG APASH_SHELL="bash"
FROM docker.io/hastec/apash:0.2.0-${APASH_SHELL}

LABEL maintainer="Benjamin Vargin"

RUN startup_script="$HOME/.bashrc"; \
    [ "$APASH_SHELL" = "zsh"  ] && startup_script="$HOME/.zshenv"; \
    echo '. "$APASH_HOME_DIR/bin/apash-${APASH_SHELL}-min.sh"  ##apashInstallTag' >> "$startup_script"
