# plusコマンド
![test](https://github.com/tokamakhora/robosys2026/actions/workflows/test.yml/badge.svg)


標準入力から読み込んだ数字を足す。

（ここに前ページの項目をいろいろ書く）

# randpickコマンド

標準入力から読み込んだ候補の中から、ランダムに1つを選んで表示する。

## 入力方法

候補は半角スペースまたは改行で区切って入力する。

候補の名前にスペースが含まれる場合は、代わりにアンダーバー（`_`）を使用する。

## 使用例

候補から1つ選ぶ場合：

```bash
echo "Warframe 原神 Minecraft" | ./randpick
```

候補から2つ選ぶ場合：

```bash
echo "Warframe 原神 Minecraft Undertale" | ./randpick -n 2
```

--number を使って指定することもできる。

```bash
echo "Warframe 原神 Minecraft Undertale" | ./randpick --number 2
```

実行結果の例：

```
原神
Undertale
```

## オプション

- `-n 数字`：選ぶ個数を指定する。

- `--number 数字`：`-n` と同じ機能。

- オプションを指定しない場合は1つ選ぶ。

## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.10〜3.14

## テスト環境
- Ubuntu 24.04 LTS

## ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- © 2026 Yoshinari Aita
