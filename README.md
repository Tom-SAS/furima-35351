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
- has_many :payments

## products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product_name     | string     | null: false, Active_hash       |
| comment          | string     | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false, Active_hash       |
| shipment_cost_id | integer    | null: false, Active_hash       |
| religion_id      | integer    | null: false, Active_hash       |
| delivery_time_id | integer    | null: false, Active_hash       |

### Association

- belongs to :user
- has_one    :user_products

## user_products テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| product         | references | null: false, foreign_key: true |

### Association

- has_one :user
- has_one :products


## shipment テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | integer    | null: false                    |
| prefecture_id   | integer    | null: false, Active_hash       |
| city            | string     | null: false                    |
| number          | string     | null: false                    |
| building        | string     |                                |
| phone_number    | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :product