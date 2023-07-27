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
```

README.md を上書きするかどうか訊かれますが、上書きして構いません。

```bash
$ docker/_tools/setup_database_yml.sh
$ rails db:setup
```

```bash
$ docker compose up -d rails
```

## きちんとセットアップ

### 1. 初回 Build の前に、Ruby と Node.js のバージョンを指定します。

`/docker/web/Dockerfile` を開き、下記の2行のバージョン部分を書き換えます。

```Dockerfile
FROM node:18.17.0 as node
FROM ruby:3.2.2
```

### 2. 初回 Build します。

そのプロジェクトで使うコンテナのみを Build します。`workspace` `rails` `mysql` は必須です。

あとで追加することもできるので、当面使う予定のあるものだけで構いません。

```bash
$ docker compose build workspace rails mysql
```

### 3. `workspace` コンテナを起動して入り、Rails をインストールします。

```bash
$ docker compose up -d workspace bash
```

```bash
$ gem install rails
$ rails new . --database=mysql
```

### 4. データベース設定を編集します。

`/config/database.yml` を開き、`development` 環境下では以下の設定を使うよう設定します。

|項目|値|
|:--|:--|
|username|環境変数 `DB_USERNAME` の内容<br>例: `<%= ENV.fetch("DB_USERNAME") { "root" } %>`|
|password|環境変数 `DB_PASSWORD` の内容<br>例: `<%= ENV.fetch("DB_PASSWORD") { "" } %>`|
|host|環境変数 `DB_HOST` の内容<br>例: `<%= ENV.fetch("DB_HOST") { "127.0.0.1" } %>`|
|database|お好みのデータベース名|

Quick start と同様、`workspace` コンテナ内で下記のコマンドを実行しても構いません。

```bash
$ docker/_tools/setup_database_yml.sh
```

### 5. `workspace` コンテナに入り、データベースを構築します。

```bash
$ rails db:setup
```

### 6. 他のコンテナを起動します。

```bash
$ docker compose up -d rails
```

ブラウザで http://localhost:3000 にアクセスすると、Rails のデフォルトページが表示されます。
