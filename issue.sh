#!/bin/sh

set -eu

browse() {
  if builtin command -v open > /dev/null; then
    open $1
  else
    echo "see $1"
  fi
}

# 必要なコマンドがインストールされているかチェック
if ! builtin command -v hub > /dev/null; then
  echo "hub command not found" >&2
  browse "https://github.com/github/hub"
  exit 1
fi
if ! builtin command -v peco > /dev/null; then
  echo "peco command not found" >&2
  browse "https://github.com/peco/peco"
  exit 1
fi


# git リポジトリかどうか確認
if ! hub status > /dev/null 2>&1; then
  echo "Not a git repository" >&2
  exit 1
fi

issues="$(hub issue)"

# issue が一つもなければ終了する
if [ -z "$issues" ]; then
  echo "No issue" >&2
  exit 1
fi

# 現在のブランチ番号から初期選択を決定する
issueNo="$(hub rev-parse --abbrev-ref HEAD | sed -e 's/^[^0-9]*\([0-9]*\).*$/\1/g')"
index=$(echo "$issues" | awk '{print NR-1, $0}' | grep -e " $issueNo\]" | cut -d' ' -f1)

# 指定した issue のページを開く
url="$(echo "$issues" | peco --initial-index ${index:-0} | sed -e 's/^.*( \(.*\) )/\1/')"
if ! [ -z "$url" ]; then
  browse "$url"
fi
