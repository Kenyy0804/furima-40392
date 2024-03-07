## users

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association

has_many :items

## items

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| item_name          | string              | null: false                    |
| item_description   | text                | null: false                    |
| item_price         | integer             | null: false                    |
| category_id        | integer             | null: false                    |
| item_condition_id  | integer             | null: false                    |
| cost_id            | integer             | null: false                    |
| region_id          | integer             | null: false                    |
| day_id             | integer             | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :purchase

## purchases

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key :true |
| item               | references          | null: false, foreign_key :true |

### Association

belongs_to :item
has_one :shipping


## shippings

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| post_code          | integer             | null: false                    |
| region_id          | integer             | null: false                    |
| municipalities     | string              | null: false                    |
| address            | string              | null: false                    |
| building_name      | string              | null: false                    |
| phone_number       | integer             | null: false                    |

### Association

belongs_to :purchase