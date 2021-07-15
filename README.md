# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |

### Association

- has_many :words
- has_many :tests
- has_many :goods
- has_many :good_words, through: :goods, source: :word

## words テーブル 

| Column              | Type          | Options                         |
| ------------------- | ------------- | ------------------------------- |
| important           | boolean       | null: false, default: true      |
| name                | string        | null: false                     |
| pos_id              | integer       | null: false                     |
| meaning             | text          | null: false                     |
| genre_id            | integer       | null: false                     |
| text                | text          | null: false                     |
| publish             | boolean       | null: false, default: true      |
| user                | references    | null: false, foreign_key: true  |
| test                | references    | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :test
- has_many :goods
- has_many :good_users, through: :goods,source: :user
- belongs_to_active_hash  :pos
- belongs_to_active_hash  :genre

## goods テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| word       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :word

## tests テーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------- |
| type_id | integer    | null: false                     |
| user    | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_many :words
- has_many :answers
- belongs_to_active_hash  :type

## answers テーブル

| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| score        | integer    | null: false                     |
| word_answer  | text       | null: false                     |
| test         | references | null: false, foreign_key: true  |

### Association

- belongs_to :test