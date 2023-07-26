#!/bin/bash

# Rails の database.yml の development 環境用設定を Docker 環境に即して修正する

SCRIPT_DIR=`dirname $0`
DATABASE_YML_PATH=$SCRIPT_DIR/../../config/database.yml

sed -i -e 's/^\ \ host: localhost$/\ \ host: <%= ENV.fetch("DB_HOST") { "127.0.0.1" } %>/g' $DATABASE_YML_PATH
sed -i -e 's/^\ \ username: root$/\ \ username: <%= ENV.fetch("DB_USERNAME") { "root" } %>/g' $DATABASE_YML_PATH
sed -i -e '0,/^\ \ password:$/s/^\ \ password:$/\ \ password: <%= ENV.fetch("DB_PASSWORD") { "" } %>/' $DATABASE_YML_PATH
