#!/bin/bash

# config/module.iniのパス
CONFIG_FILE="config/theme.ini"

# バージョン情報の読み取り
version=$(grep '^version\s*=' $CONFIG_FILE | cut -d '=' -f2 | tr -d ' "' | tr -d "\r")
id=$(grep '^id\s*=' $CONFIG_FILE | cut -d '=' -f2 | tr -d ' "' | tr -d "\r")

# タグとリリースメッセージ
tag="$version"
release_message="Released version $version."

# Gitタグの作成
git tag -a $tag -m "$release_message"

# Gitタグのプッシュ
git push origin $tag

# GitHubリリースの作成
gh release create $tag --title "$id-$version" --notes "Released version $version."