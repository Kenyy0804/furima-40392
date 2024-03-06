## users

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false               |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association

has_many :items, dependent: :destroy

## items

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| item_name          | string              | null: false                    |
| item_description   | string              | null: false                    |
| item_price         | string              | null: false                    |
| category           | string              | null: false                    |
| item_condition     | string              | null: false                    |
| cost               | string              | null: false                    |
| region             | string              | null: false                    |
| days               | date                | null: false                    |
| user_id            | integer             | null: false, foreign_key :true |

### Association

belongs_to :user

## purchases

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user_id            | integer             | null: false, foreign_key :true |
| item_id            | string              | null: false                    |

### Association

belongs_to :item

## shippings

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user_id            | integer             | null: false, foreign_key :true |
| item_id            | string              | null: false                    |
| address            | string              | null: false                    |

### Association

belongs_to :purchases