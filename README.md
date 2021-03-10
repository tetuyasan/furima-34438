
## フリマ34438のDB設計書


## User_table

| column              | type   | option      |
| =================== |======= | =========== |
| nickname            | string | null: false |
| first_name          | string | null: false |
| first_name_kana     | string | null: false |
| family_name         | string | null: false |
| family_name_kana    | string | null: false |
| email               | string | unique:true |
| encrypted_password  | string | null: false |
| data                | string | null: false |

### association
* has_many :items
* has_many :comments

## item_table (住所やカード番号といった個人情報などは書かない！)

| column              | type         | option            |
| =================== | ============ | ================= |
| item_price          | integer      | null false        |
| item_name           | string       | null false        |
| user                | references   | foreign_key: true |
| item_category_id    | string       | null false        |
| item_comment        | text         | null false        |
| item_condition_id   | string       | null false        |
| item_send_id        | string       | null false        |
| shipping_charges_id | string       | null false        |
| area_id             | string       | null false        |

### association
* belongs_to :user
* has_many :comments


## comment_table

| column   | type   | option      |
| =======  | =====  | ============|
| text     | text   | null: false |

### association
* belongs_to :items
* belongs_to :user

## buy_table (親)

| column  | type         | option            |
| ======= | =============| ================= |
| user    | references   | foreign_key: true |
| items   | references   | foreign_key: true |

### association
has_one :send

## send_table (子)

| column        | type     | option     |
| ============= | ======== | ===========|
| area_id       | string   | null false |
| post_number   | string   | null false |
| prefectures   | string   | null false |
| city          | string   | null false |
| address       | string   | null false |
| building      | string   | 
| phone_number  | string   | null false |



### association
belongs_to : buy
