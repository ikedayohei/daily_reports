# README
TEST

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリ名
  "daily_reports"

# 概要
  営業日報・訪問先を登録し共有できるアプリ<br>
  <主な内容><br>
  日報の報告 — 削除・編集・お気に入り・コメント<br>
  訪問先の登録 — 削除・編集・いいね機能<br>
  検索機能  — （訪問先）<br>
  ランキング（営業の訪問件数・いいね件数）<br>
  Google Map APi で Google Map を表示<br>
  非同期通信（コメント）<br>
  マイページ（お気にりと報告の閲覧）<br>

# 本番環境

# 制作背景
  <問題><br>
  現在の仕事(営業職)で、営業日報を報告することになっているが、担当と上司間でのやり取りとなっている<br>
  <解決><br>
  部署内で営業日報を共有し誰でも閲覧できるようにする<br>

# DEMO
  ![c2e406f448ee959a4f9e750fad0264ec.png](./images/c2e406f448ee959a4f9e750fad0264ec.png)
  
# 工夫したポイント
  営業日報にコメント機能実装し部署内でコミニケーションを取れるようにした

# 使用技術(開発環境)
  ruby (2.6.3)<br>
  Rails (5.0.7.2)<br>
  jquery-rails (4.3.5)<br>
  MySQL (5.6.46)<br>

# 課題や今後実装したい機能
  マイページに閲覧履歴の追加<br>
  検索に詳細検索を追加<br>
  資料を投稿できるようにする<br>
  
# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association Association
- has_many :sns_credentials
- has_many :reports, dependent: :destroy
- has_many :bookmarks, dependent: :destroy
- has_many :bookmark_reports, through: :bookmarks, source: :report
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :sns_credentials

## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|where|string|null: false|
|reponder|string|null: false|
|companion|string|
|date|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :commnets
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|report_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :report
- belongs_to :user

## companyテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|postcode|text|null: false|
|phone_number|string|null: false|
|capital|string|null: false|
|sale|string|null: false|
|description|string|null: false|
|characteristic|text|
|url|string|
|user_id|integer|null: false, foreign_key: true|
|report_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :companies
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user

## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|company_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :company

## bookmarksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|report_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :report

## mapテーブル
|Column|Type|Options|
|------|----|-------|
|address|string|
|latitude|flot|
|longitude|string|flot|
### Association
- belongs to company

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user_id|integer|foreign_key: true|
### Association
- belongs_to :user,optional: true

