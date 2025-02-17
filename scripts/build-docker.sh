#! /bin/zsh

set -e

RASA_VERSION=${RASA_VERSION:-3.0.8}

docker build \
    --target conda \
    -t "rasa-aarch64:conda-${RASA_VERSION}" \
    --build-arg RASA_VERSION=${RASA_VERSION} \
    .

docker build \
    -t "frmevis/rasa-aarch64:${RASA_VERSION}" \
    -t "frmevis/rasa-aarch64:latest" \
    --build-arg RASA_VERSION=${RASA_VERSION} \
    .
