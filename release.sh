set -e

version=1.0.1
name=Bootstrap5

# 不要なファイルを除外したモジュール名のフォルダを作成
rsync -ahv . ./$name --exclude '.*' --exclude '*.sh'

# zipファイルの作成
zip $name-$version.zip -r $name

# フォルダの削除
rm -rf $name

# リリース
gh release create $version $name-$version.zip -t $name-$version -n "Released version $version."

# ファイルの削除
rm $name-$version.zip