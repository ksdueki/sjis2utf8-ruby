# HTML（Shift_JIS）をUTF-8に変換するスクリプト

Shift_JISで作成されたhtmファイル（.htmのみを対象にしています）を、変換先フォルダー（`to_dir`で指定されたフォルダー）に変換します。
変換対象と、変換後のフォルダーは、`main.rb`の以下の部分を書き換えて使用します。
（頻繁につかうのであればコマンドライン化したい）

## 変換方法

フォルダーの設定を書き換えます。

```rb
@from_dir = "src"
@to_dir = "dest"
```

以下のコマンドを入力し、ファイルの変換をおこないます。

```shell
$ bundle install
$ bundle exec ruby main.rb
```
