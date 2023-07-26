# TODO: バージョンを .env に切り出す
FROM node:18.17.0 as node
FROM ruby:3.2.2

ARG DB_URL
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_PORT

ENV DB_URL ${DB_URL}
ENV DB_USERNAME ${DB_USERNAME}
ENV DB_PASSWORD ${DB_PASSWORD}
ENV DB_PORT ${DB_PORT}
ENV LANG C.UTF-8

COPY entrypoint.sh /

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      emacs \
      build-essential && \
    rm -rf /var/lib/apt/lists/*

COPY --from=node /opt/yarn-v* /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/

RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg

RUN mkdir /app

WORKDIR /app

# ref: https://ksss9.hatenablog.com/entry/2021/02/08/002737
# ref: https://qiita.com/daichi41/items/dfea6195cbb7b24f3419#entrypointsh
ENTRYPOINT [ "/entrypoint.sh" ]
