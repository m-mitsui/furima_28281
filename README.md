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

 users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- belongs_to :addres 
- has_many :items

 items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| prouct | string | null: false |
| image  | text   | null: false |
| category | string |           |
| price  | integer| null: false |
| exhibitor | text |            |
### Association

- belongs_to :user  
- has_many :buys

 buys テーブル

 | Column   | Type       | Options                        |
 | ------   | ---------- | -------------------------------|
 | price_id | integer    | null: false,  foreign_key: true |
 | items_id | integer    | null: false,  foreign_key: true |
### Association

- belongs_to :addres
- has_many :items



  addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|  addres | string     | null:  false                   |
### Association

- belongs_to :buy
- belongs_to :item