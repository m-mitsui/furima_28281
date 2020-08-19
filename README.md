# README

  consumers テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| password-confirmation | string  | null: false |
| first-name  | string  | null: false |
| last-name | string  | null: false |
| first-name-kana  |  string  | null: false |
| last-name-kana  | string  | null: false |
| birthday  | date  | null: false |

### Association

- belongs_to :buy 
- has_many :products

 products テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| image  | text   | null: false |
| category | integer |   null: false   |
| price  | integer| null: false |
| exhibitor | integer | null: false |
| status |  integer |  null: false   |
| delivery fee | integer | null: false |
| delivery time | integer | null: false |
| ship-from | integer  | null: false |
| consumers_id  | integer | null: false   foreign_key: true |

### Association

- belongs_to :consumer
- has_many :buys

 buys テーブル

 | Column   | Type       | Options                        |
 | ------   | ---------- | -------------------------------|
 | consumers_id | integer    | null: false,  foreign_key: true |
 | products_id | integer    | null: false,  foreign_key: true |
### Association

- belongs_to :addres
- has_many :products



  addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|  postal code | string  |                 |
|  prefecture | integer | null: false |
| city  | string  | null: false |
| house number | string  | null: false |
| building  | string  |  |
| phone-number  | string | null: false |
| buys_id | integer | null: false   foreign_key: true |


### Association

- belongs_to :buy
