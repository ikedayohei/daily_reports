# README

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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
|company_name|null: false|
|position|
### Association Association
- has_many :comments
- has_many :reports

## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text| |
|image|string| |
|where|string|
|reponder|string|
|companion|string|
|date|integer|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :commnets

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|report_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :report
- belongs_to :user

