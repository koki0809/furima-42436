# README

## users テーブル

|Column          |Type    |Options    |
|----------------|--------|-----------|
|last_name       |string  |null: false|
|first_name      |string  |null: false|
|last_name_kana  |string  |null: false|
|first_name_kana |string  |null: false|
|birth_date      |date    |null: false|

### Association

- has_many :items
- has_many :orders

## items テーブル

|Column                 |Type    |Options    |
|-----------------------|--------|-----------|
|name                   |string  |null: false|
|image                  |string  |null: false|
|description            |text    |null: false|
|category               |integer |null: false|
|condition_id           |integer |null: false|
|shipping_fee_burden_id |integer |null: false|
|shipping_origin_id     |integer |null: false|
|shipping_duration_id   |integer |null: false|
|price                  |integer |null: false|
|seller_id              |reference|null: false|

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

|Column    |Type     |Options    |
|----------|-------- |-----------|
|buyer_id  |reference|null: false foreign_key: true|

### Association 

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル
|Column             |Type    |Options    |
|-------------------|--------|-----------|
|postal_code        |string  |null: false|
|prefecture_id      |integer |null: false|
|city               |string  |null: false|
|street_address     |string  |null: false|
|building_name      |string  |null: false|
|phone_number       |string  |null: false|

### Association

- belongs_to :orders