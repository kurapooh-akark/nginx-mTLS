@REM  encoding: shift-jis
@REM  必要なツールのインストールスクリプト

@REM  --------------------------------------------------
@REM  winget オプション
@REM  --------------------------------------------------

@REM  パッケージ インストーラーによって提示された使用許諾契約書
@REM  または EULA を受け入れ、対話型プロンプトを表示しません。
@REM  これはパッケージのライセンス条項にのみ適用されます。
@REM  インストーラーによって提供されるオプションのコンポーネントや
@REM  バンドルされたソフトウェアには影響しません。 
@REM  完全に非対話型の install の場合は、 --silent (-h) と組み合わせます。
set WINGET_OPTION=%WINGET_OPTION%  --accept-package-agreements

@REM  対話型プロンプトを抑制して、WinGet ソース (リポジトリ) の
@REM  使用許諾契約書に同意します。
@REM  これはパッケージ ライセンスとは別であり、
@REM  ソース自体の使用条件 ( winget コミュニティ リポジトリなど) が
@REM  対象となります。
set WINGET_OPTION=%WINGET_OPTION%  --accept-source-agreements


@REM  --------------------------------------------------
@REM  OpenSSL のインストール
@REM    * ShiningLight.OpenSSL.Light  軽量版（実行ファイルとランタイムのみ）
@REM    * ShiningLight.OpenSSL        通常・完全版
@REM    * ShiningLight.OpenSSL.Dev    開発者向け版（ヘッダーやライブラリを含む）
@REM  --------------------------------------------------
winget install -e --id ShiningLight.OpenSSL.Light


@REM  --------------------------------------------------
@REM  vscode のインストール
@REM  --------------------------------------------------
winget install -e --id Microsoft.VisualStudioCode --interactive


pause
