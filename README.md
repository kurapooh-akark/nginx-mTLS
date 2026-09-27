mTLS 認証付き git サーバ環境構築ツール
========================================

本ツールは nginx を使って mTLS 認証（クライアント認証） を実装し、 git (gitea) サーバの環境構築を行います。

* 対象 OS は Windows 11
* ルート証明書、中間証明書、サーバ証明書、クライアント証明書は OpenSSL で作成する
* PC 起動時にサーバを実行開始する
* PC を定刻に起動し、定刻にシャットダウンする


目次
----------------------------------------

- [mTLS 認証付き git サーバ環境構築ツール](#mtls-認証付き-git-サーバ環境構築ツール)
  - [目次](#目次)
  - [セットアップ](#セットアップ)
    - [使用ツールのインストール](#使用ツールのインストール)
    - [TLS 証明書](#tls-証明書)
      - [証明書を作成する](#証明書を作成する)
      - [証明書をインストールする](#証明書をインストールする)
    - [nginx](#nginx)
      - [nginx をセットアップする](#nginx-をセットアップする)
    - [gitea](#gitea)
      - [gitea をセットアップする](#gitea-をセットアップする)
    - [Windows](#windows)
      - [nginx が自動起動するように Windows を設定する](#nginx-が自動起動するように-windows-を設定する)
      - [gitea が自動起動するように Windows を設定する](#gitea-が自動起動するように-windows-を設定する)
      - [PC の自動起動、自動シャットダウンを設定する](#pc-の自動起動自動シャットダウンを設定する)
  - [Markdown の編集について](#markdown-の編集について)


セットアップ
----------------------------------------

### 使用ツールのインストール

以下のツールは [install.bat](/install_tools/install.bat) を実行してインストール可能。

* OpenSSL
* vscode (ファイル編集用)

以下のツールは公式サイトからダウンロードする。

* [nginx](https://nginx.org/en/download.html)
* [gitea](https://about.gitea.com/products/gitea/)


### TLS 証明書

#### 証明書を作成する

[認証局 (CA) と証明書の作成](/CA/README.md#%E8%AA%8D%E8%A8%BC%E5%B1%80-ca-%E3%81%A8%E8%A8%BC%E6%98%8E%E6%9B%B8%E3%81%AE%E4%BD%9C%E6%88%90) を参照。


#### 証明書をインストールする

[認証局 (CA) と証明書のインストール](/CA/README.md#%E8%AA%8D%E8%A8%BC%E5%B1%80-ca-%E3%81%A8%E8%A8%BC%E6%98%8E%E6%9B%B8%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB) を参照。


### nginx

#### nginx をセットアップする

[nginx](/nginx/README.md#nginx) を参照。


### gitea

#### gitea をセットアップする

[gitea](/gitea/README.md#gitea) を参照。


### Windows

#### nginx が自動起動するように Windows を設定する

[nginx, gitea の自動起動](/windows/README.md#nginx-gitea-%E3%81%AE%E8%87%AA%E5%8B%95%E8%B5%B7%E5%8B%95) を参照。


#### gitea が自動起動するように Windows を設定する

[nginx, gitea の自動起動](/windows/README.md#nginx-gitea-%E3%81%AE%E8%87%AA%E5%8B%95%E8%B5%B7%E5%8B%95) を参照。


#### PC の自動起動、自動シャットダウンを設定する

[PC の自動起動、自動シャットダウン](/windows/README.md#pc-%E3%81%AE%E8%87%AA%E5%8B%95%E8%B5%B7%E5%8B%95%E8%87%AA%E5%8B%95%E3%82%B7%E3%83%A3%E3%83%83%E3%83%88%E3%83%80%E3%82%A6%E3%83%B3)


Markdown の編集について
----------------------------------------

[vscode](/.vscode/README.md) で編集する。

