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
| product_name     | string     | null: false, Active_hash       |
| comment          | string     | null: false                    |
| price            | integer    | null: false                    |
| status_id        | integer    | null: false, Active_hash       |
| category_id      | integer    | null: false, Active_hash       |
| shipment_cost_id | integer    | null: false, Active_hash       |
| religion_id      | integer    | null: false, Active_hash       |
| delivery_time_id | integer    | null: false, Active_hash       |

### Association

- belongs_to :user
- has_one    :user_product

## user_products テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| product         | references | null: false, foreign_key: true |
| shipment        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :shipment


## shipment テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| prefecture_id   | integer    | null: false, Active_hash       |
| city            | string     | null: false                    |
| number          | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to :user_product