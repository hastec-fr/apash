# docker build -t docker.io/hastec/apash-full:0.1.0 -f ./docker/apash-bash-full.dockerfile .
# docker run --rm -it --name apash-dev-full hastec/apash:0.1.0
FROM docker.io/hastec/apash:0.1.0

RUN sed -i 's/apash" source/apash" source --all/' /home/apash/.bashrc
