# Rails-Docker Skeleton

Ruby on Rails を Docker 上で開発し始めるための、最小限のスケルトンです。

## Quick Start

```bash
$ docker compose build
$ docker compose up -d workspace bash
```

```bash
$ gem install rails
$ rails new . --database=mysql
$ docker/_tools/setup_database_yml.sh
$ rails db:setup
```

```bash
$ docker compose up -d rails
```
