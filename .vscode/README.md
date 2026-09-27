- [vscode](#vscode)
  - [エディタ設定 (settings.json)](#エディタ設定-settingsjson)
    - [エンコーディング](#エンコーディング)
    - [フォント](#フォント)
    - [特定のフォルダーを非表示にする](#特定のフォルダーを非表示にする)
  - [拡張機能 (extensions.json)](#拡張機能-extensionsjson)
    - [推奨拡張機能](#推奨拡張機能)


vscode
========================================

エディタ設定 (settings.json)
----------------------------------------

### エンコーディング

| 項目                      | 値       | 説明                           |
| :------------------------ | :------- | :----------------------------- |
| files.autoGuessEncoding   | true     | 文字コードの自動判別 オン      |
| [bat] files.encoding      | shiftjis | bat ファイルは shiftjis で開く |
| [markdown] files.encoding | utf8     | md ファイルは utf8 で開く      |


### フォント

| 項目              | 値                                                           | 説明         |
| :---------------- | :----------------------------------------------------------- | :----------- |
| editor.fontFamily | `'BIZ UDゴシック', Consolas, 'Courier New', monospace` (\*1) | 等幅フォント |

(\*1) 'BIZ UDゴシック' を先頭に書く。その他はデフォルト設定から変更なし。


### 特定のフォルダーを非表示にする

| 項目          | 値           | 説明 |
| :------------ | :----------- | :--- |
| files.exclude | { 下記参照 } |      |

**gitea**

* "gitea/custom": true
* "gitea/data": true
* "gitea/log": true

**nginx**

* "nginx/conf": true
* "nginx/contrib": true
* "nginx/docs": true
* "nginx/html": true
* "nginx/logs": true
* "nginx/temp": true


拡張機能 (extensions.json)
----------------------------------------

### 推奨拡張機能

| 拡張機能            | ID                         | 使途         |
| :------------------ | :------------------------- | :----------- |
| Markdown All in One | yzhang.markdown-all-in-one | 目次の作成   |
| Markdown Table      | takumii.markdowntable      | テーブル編集 |

