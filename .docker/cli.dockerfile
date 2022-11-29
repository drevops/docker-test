FROM uselagoon/php-8.1-cli:22.4.1

COPY .docker/scripts/90-custom-envs.sh  /lagoon/entrypoints/

COPY test.sh /app/test.sh

WORKDIR /app
