
## フリマ34438のDB設計書


## user_table

| column              | type   | option                 |
| =================== |======= | ====================== |
| nickname            | string | null: false            |
| first_name          | string | null: false            |
| first_name_kana     | string | null: false            |
| family_name         | string | null: false            |
| family_name_kana    | string | null: false            |
| email               | string | unique:true null:false |
| encrypted_password  | string | null: false            |
| birthday            | data   | null: false            |

### association
* has_many :items
* has_many :comments
* has_many :buys

## item_table (住所やカード番号といった個人情報などは書かない！)

| column              | type         | option            |
| =================== | ============ | ================= |
| item_price          | integer      | null false        |
| item_name           | string       | null false        |
| user                | references   | foreign_key: true |
| item_category_id    | integer      | null false        |
| item_comment        | text         | null false        |
| item_condition_id   | integer      | null false        |
| item_send_id        | integer      | null false        |
| shipping_charge_id | integer      | null false        |
| area_id             | integer      | null false        |

### association
* has_one :buy
* belongs_to :user


## comment_table

| column   | type   | option      |
| =======  | =====  | ============|
| text     | text   | null: false |

### association
* belongs_to :item
* belongs_to :user

## buy_table (親)

| column  | type         | option            |
| ======= | =============| ================= |
| user    | references   | foreign_key: true |
| item    | references   | foreign_key: true |

### association
has_one :send
belongs_to :user
belongs_to :item

## send_table (子)

| column        | type           | option             |
| ============= | ============== | ================== |
| area_id       | integer        | null false         |
| post_number   | string         | null false         |
| city          | string         | null false         |
| address       | string         | null false         |
| building      | string         |                    |
| phone_number  | string         | null false         |
| buy           | references     | foreign_key: true  |

### association
belongs_to : buy
