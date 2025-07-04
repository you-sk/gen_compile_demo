# Sega Genesis/Mega Drive Development with SGDK

セガ メガドライブ用のレトロゲーム開発環境をDockerで構築したプロジェクトです。SGDKを使ってC言語でゲーム開発ができます。

## 機能

- **Dockerベース**: 環境構築が簡単で、どのOSでも同じ開発環境
- **SGDK 2.11**: 最新のSega Genesis Development Kit
- **Hello World ROM**: 動作確認用のサンプル
- **簡単ビルド**: `./build.sh` 一発でROMが完成

## 必要な環境

- Docker
- Docker Compose

## セットアップ

1. リポジトリをクローン:
```bash
git clone <your-repo-url>
cd gen_compile_demo_claude
```

2. Dockerイメージをビルド:
```bash
docker-compose build
```

## ビルド方法

### 自動ビルド（推奨）
```bash
./build.sh
```

### 手動ビルド
```bash
# 環境変数を設定
export UID=$(id -u)
export GID=$(id -g)

# SGDKでビルド
docker-compose run --rm sgdk-dev make rom_copy
```

### 個別コマンド
```bash
# クリーンビルド
docker-compose run --rm sgdk-dev make clean

# リリースビルド
docker-compose run --rm sgdk-dev make release

# デバッグビルド
docker-compose run --rm sgdk-dev make debug
```

## 出力ファイル

ビルド成功後、以下のファイルが生成されます：
- `hello_world.bin` - メガドライブ用ROMファイル（131KB）
- `out/rom.bin` - SGDK標準出力
- `out/symbol.txt` - デバッグ用シンボル情報

![image](https://github.com/user-attachments/assets/f30937be-6a8c-45f6-b1c6-eace260dc078)

## ROMの実行

生成された `hello_world.bin` は、以下のメガドライブエミュレータで実行できます：
- **Gens** (Windows/Linux)
- **Fusion** (Windows)
- **BlastEm** (クロスプラットフォーム)
- **RetroArch** (Genesis Plus GX コア)

## プロジェクト構造

```
├── Dockerfile              # SGDK Docker環境
├── docker-compose.yml      # コンテナ設定
├── Makefile                # SGDKビルド設定
├── build.sh                # ビルドスクリプト
├── src/                    # ソースコード
│   ├── main.c              # メインプログラム
│   └── boot/               # SGDK起動ファイル
├── out/                    # ビルド出力（gitignore対象）
└── hello_world.bin         # 最終ROM（gitignore対象）
```

## 開発のはじめ方

1. `src/main.c` を編集してゲームロジックを追加
2. リソースファイル（画像・音楽）は `res/` フォルダに配置
3. `./build.sh` でビルド
4. エミュレータでテスト

## SGDKについて

SGDK (Sega Genesis Development Kit) は、C言語でメガドライブ用ソフトウェアを開発するためのオープンソースツールキットです。

### 主な機能
- C言語での開発サポート
- スプライト・タイル管理
- 音楽・効果音再生
- コントローラ入力
- VDP（Video Display Processor）制御

### 参考リンク
- [SGDK GitHub](https://github.com/Stephane-D/SGDK)
- [SGDK Documentation](https://github.com/Stephane-D/SGDK/wiki)

## トラブルシューティング

### 権限エラーが出る場合
```bash
# outフォルダの権限を修正
docker-compose run --rm sgdk-dev chmod 755 out/
```

### ビルドが失敗する場合
```bash
# クリーンビルド
docker-compose run --rm sgdk-dev make clean
./build.sh
```

### Dockerイメージを再ビルドしたい場合
```bash
docker-compose build --no-cache
```

## ライセンス

このプロジェクトは学習・開発目的で作成されています。SGDK自体のライセンスに従ってください。

## 貢献

バグ報告や改善提案は Issues でお知らせください。
