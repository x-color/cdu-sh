# cdu-sh

指定したパターンに一致するディレクトリに移動するためのスクリプト。
ユニークな名前付けをされたディレクトリに移動することを目的としている。

#### 使用例

```bash
# 最初にパターン一致したホームディレクトリより下位のディレクトリに移動。
# 例) ~/.../testdirectory, ~/.../testdirectory01 などに移動
$ cdu testdirectory

# 最初にパターン一致したディレクトリに移動。
# 例) /.../testdirectory, /.../testdirectory01 などに移動
$ cdu -a testdirectory

# 最初にパターン一致したカレントディレクトリより下位のディレクトリに移動。
# 例) ./.../testdirectory, ./.../testdirectory01 などに移動
$ cdu -c testdirectory

# パターン一致の際に大文字小文字を区別しない。
# 例) ~/.../TestDirectory, ~/.../TESTDIRECTORY01 など に移動
$ cdu -i testdirectory

# 完全にパターン一致したディレクトリに移動。
# 例) ~/.../testdirectory のみに移動
$ cdu -p testdirectory
```

#### 準備

動作させる前に、以下を実行する必要がある。
- `~/.bashrc`などに`source`コマンドを用いて、このスクリプトファイルの読み込み処理を記述

#### 備考

`locate`コマンドを利用しているため、作成したばかりのディレクトリなどには移動できない。
その際には、移動する前に`updatedb`コマンドを実行することで移動可能になる。
