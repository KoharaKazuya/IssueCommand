# Issue Command

カレントディレクトリに対応する GitHub 上のリポジトリで open 状態の
issue を一覧で表示します。
一覧から選択するとブラウザで選択した issue のページを開きます。

ブランチ名に issue 番号をつけている場合は、現在ブランチの issue が
初期状態で選択されています。

GitHub Enterprise を使いたい人は、内部で hub コマンドを利用しているので
`$ git config --global --add hub.host my.example.org`と設定すれば大丈夫です。


## 前提コマンド

- [hub](https://github.com/github/hub)
- [peco](https://github.com/peco/peco)


## インストール方法

```sh
$ curl https://raw.githubusercontent.com/KoharaKazuya/IssueCommand/master/issue.sh > /usr/local/bin/issue
$ chmod +x /usr/local/bin/issue
```
