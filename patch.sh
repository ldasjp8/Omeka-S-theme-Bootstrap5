#!/bin/bash

# config/module.iniのパス
CONFIG_FILE="config/theme.ini"

# 現在のバージョンを取得
current_version=$(grep '^version\s*=' $CONFIG_FILE | cut -d '=' -f2 | tr -d ' "' | tr -d "\r")
echo "Current version: $current_version"

# バージョンを分割
IFS='.' read -r -a version_parts <<< "$current_version"

# パッチバージョンを更新
patch_version=$((version_parts[2] + 1))
new_version="${version_parts[0]}.${version_parts[1]}.$patch_version"
echo "New version: $new_version"

# バージョンを更新
sed -i '' "s/version[ ]*=[ ]*\"[^\"]*\"/version = \"$new_version\"/" $CONFIG_FILE

# 確認メッセージ
echo "Updated $CONFIG_FILE to version $new_version"