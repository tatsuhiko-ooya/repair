# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ---------------    | -------- | ----------- |
| name               | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| affiliation_id     | integer  | null: false |

### Association

- has_many :requests
- has_many :receptions
- has_many :logs
- belongs_to :affiliation

## machines テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| type_id           | integer    | null: false                    |
| affiliation_id    | integer    | null: false                    |
| number            | string     | null: false                    |

### Association

- has_many :requests
- has_many :logs

## requests テーブル

| Column         | Type         | Options                        |
| -------------- | ------------ | ------------------------------ |
| user           | references   | null: false, foreign_key: true |
| machine        | references   | null: false ,foreign_key: true |
| comment        | text         | null: false                    |

### Association

- belongs_to :user
- belongs_to :machine
- has_one    :reception

## receptions テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| user            | references   | null: false, foreign_key: true |
| reception       | references   | null: false, foreign_key: true |
| completion      | boolean      | null: false, default: false    |

### Association

- belongs_to :user
- belongs_to :request

## logs テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| user            | references   | foreign_key: true              |
| completion      | references   | foreign_key: true              |
| machine         | references   | foreign_key: true              |
| issue           | text         | null: false                    |
| cause           | text         | null: false                    |
| machine         | references   | foreign_key: true              |


### Association

- belongs_to :user
- belongs_to :machine
- belongs_to :completion
- has_many   :log_parts
- has_many   :parts, through: :log_parts

## parts テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| name            | string       | null: false                    |
| code            | string       | null: false                    |


### Association

- has_many   :log_parts
- has_many   :parts, through: :log_parts
