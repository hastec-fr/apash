# @name: apash-bash-full
# @description
#   Based on apash-bash.dockerfile, it preloads all scripts contains in src/bash directory.
#
# @example
# docker build -t docker.io/hastec/apash:0.1.0-full -f ./docker/apash-bash-full.dockerfile .
# docker run --rm -it --name apash-dev-full hastec/apash:0.1.0
# docker push docker.io/hastec/apash:0.1.0-full
FROM docker.io/hastec/apash:0.1.0

LABEL maintainer="Benjamin Vargin"

RUN sed -i 's/apash" source/apash" source --all/' /home/apash/.bashrc
