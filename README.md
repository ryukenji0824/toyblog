## タイトル
### Toy Blog


![app_image](https://i.gyazo.com/060f3d6581974ec8c5fe99fc3ffd50d6.jpg)
[Gifサンプル](https://i.gyazo.com/7052aa5a3041060638d5131fccfbaed5.mp4)


<p align="center">
  <a href="https://railsguides.jp/"><img src="https://upload.wikimedia.org/wikipedia/commons/9/9c/Ruby_on_Rails_logo.jpg" width="80px;" /></a>
  <br>
  <a href="https://www.ruby-lang.org/ja/"><img src="https://www.ruby-lang.org/images/header-ruby-logo.png" height="40px;" /></a>
  <a href="https://github.com/"><img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Logo.png" height="30px;" /></a>
  <a href="herokuURL"><img src="https://brand.heroku.com/static/media/heroku-logotype-vertical.f7e1193f.svg" height="40px;" /></a>
  <a href="mysqlURL"><img src="https://www.mysql.com/common/logos/logo-mysql-170x115.png" height="45px;" /></a>
</p>




## App URL
### https://toysblog.herokuapp.com/

## Test Account(テスト用アカウント)
* name: テストアカウント
* メールアドレス: test@test.com
* パスワード: password


## アプリケーション情報
### 概要
* シンプルなブログサービスです。
* 機能：アカウント作成・ログイン・ログアウト・画像投稿（１枚）・タイトル表示・本文の投稿
### 制作背景
* 自身の体験から、小さなお子さんがいる親御さんへ向けてのブログサービスです。 お子さんの好きなおもちゃを、捨ててしまう前に記録に残しておくためのツールが欲しいと思い作成しました。
未来の家族にも歴史を引継ぐこともでき、おもちゃで遊んでいたという大事な思い出を振り返り、たくさんの原体験を大切な人と共有し初心へ返ることもできます。
今後はおもちゃを個人間で貸し借りや譲渡が可能なサービスも追加できたらと思っています。

### 工夫ポイント
* 投稿画像を選択した際に、JavaScriptでプレヴュー画像を表示させ投稿イメージを明確にした。
* 省略できる機能実装はgemを使用した（実装したgem：bootstrap・devise・refileなど）

### 今後の実装予定
* 登録者のブログ閲覧機能・評価（いいね）機能・コメント機能・カテゴリ機能・譲渡受領機能・レンタル予約機能

## 開発環境
* Ruby on Rails version: rails 5.0.7.2
* Ruby version: ruby 2.5.0
* DB:mysql2
* deploy server: heroku
* servise: Blog(write{title,body},read,imagesave,)

## DB設計

### usersテーブル
|Columm|Type|Options|
|:------|:----|:-------|
|e-mail|string|null: ：false|
|password_confirmation|string|null: :false|

### Association
has_one :profile
has_many :articles

### articlesテーブル
|Columm|Type|Options|
|:------|:----|:-------|
|title|string||
|body|text||
|image_id|integer||
|user_id|integer||

### Association
belongs_to :user

### profilesテーブル
|Columm|Type|Options|
|:------|:----|:-------|
|user_id|integer||
|name|string|null: :false|

### Association
belongs_to :user
