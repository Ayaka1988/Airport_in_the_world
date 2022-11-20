# Airport in the world

## サイト概要

### サイトのURL
https://ayatera.com

### サイトテーマ
世界中の空港の情報を集約させることで、旅人が旅をしやすくなることに貢献する。<br>
世界中の空港の情報が簡単に手に入り、移動ツールの一つとして活用できる、<br>
世界中の空港の情報をまとめた情報投稿型コミュニティサイト。<br>


### テーマを選んだ理由
以前バックパッカーとして世界を旅する中で、空港を多用していた経験から、<br>
世界の空港の概要をまとめた情報が欲しいと考えていたことから考案。<br>
現在世界の空港情報を集約したサイトはほぼなく、国境が解放された現状から<br>
今後久々に旅をする旅人に役立つツールを開発したいと思ったため。


### ターゲットユーザー
* 世界中を旅するバックパッカー

### 主な利用シーン
* 海外旅行中
* 旅行を計画する際のリサーチ用


## 開発環境
* フレームワーク：Ruby on Rails 6.1.7
* バックエンド言語：Ruby 3.1.2
* フロントエンド言語：言語：CSS/Javascript
* データベース：SQL
* IDE：Cloud9
* アプリケーションサーバー：puma

## 主な機能
#### CRUD機能
* User
* Post
* Comment
* Bookmark
#### その他
* エリアと国をジャンル検索：多階層のデータを扱うため"ancestry"のGemを使用し、エリアと国を紐づけられるように実装
* 国名からワード検索
* コンタクトページより作成者のgmailに送信できる
* Google APIを使用し現在地を取得
* フレンドリーフォアーディング機能を実装し、ログイン後に最後にいたページに戻れるように調整
* ゲストユーザー機能

## 使用方法
* headerの地球のボタンを押すとTOPページに戻る
* 空港情報の投稿、コメント投稿以外はログインなしで閲覧可能。投稿・コメントするときはログインが必要。
* エリア別一覧、国別一覧から閲覧したい国を選択できる。
* 気になる記事はBookmarkができる
* その投稿に対して、新しい情報などを別のユーザーがコメントすることができる。

## 設計書
* 要件定義書: https://docs.google.com/spreadsheets/d/11HDyGaiPF-BUj5ZjkYRjwFIbL1-ExkJHrzHDrLkvlNo/edit#gid=0
* 実装機能リスト: https://docs.google.com/spreadsheets/d/1vLxueJJ_b1TU8ON3nVlwWqmt4EL-Ys9YWSedITmL54s/edit?usp=sharing
* ER図URL：https: //app.diagrams.net/#G1kw2mUnc2nZFOAYPfids-99xVJ2bS2tFX
* テーブル定義書: https://docs.google.com/spreadsheets/d/1jlzegQDFBW-d40c032FTrSDjI6-mz6zh/edit#gid=1243549839
* 詳細設計書: https://docs.google.com/spreadsheets/d/1eFeAL0_iYAxbw4tVQeSWSv70shsyM3km4ii98p3AxIA/edit#gid=549108681
* UI図: https://app.diagrams.net/#G1FRR1-6GThZciRh0mJRMsAdTwymyW9rMo

## 作者
* 寺田彩可
