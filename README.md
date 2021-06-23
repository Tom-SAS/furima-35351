# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_furigana     | string | null: false               |
| last_furigana      | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products
- has_many :user_products

## products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| comment          | text       | null: false                    |
| price            | integer    | null: false                    |
| status_id        | integer    | null: false, Active_hash       |
| category_id      | integer    | null: false, Active_hash       |
| shipment_cost_id | integer    | null: false, Active_hash       |
| prefecture_id    | integer    | null: false, Active_hash       |
| delivery_time_id | integer    | null: false, Active_hash       |

### Association

- belongs_to :user
- has_one    :user_product

## user_products テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| product         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :shipment


## shipments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_product     | references | null: false, foreign_key:true  |
| post_number      | string     | null: false                    |
| prefecture_id    | integer    | null: false, Active_hash       |
| city             | string     | null: false                    |
| number           | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |

### Association

- belongs_to :user_product

