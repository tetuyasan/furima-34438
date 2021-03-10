
## フリマ34438のDB設計書


## User_table

| column     | type   | option      |
| ========== |======= | =========== |
| nickname   | string | null  false |
| name       | string | null: false |
| email      | string | null: false |
| pass_Word  | string | null: false |
| birthday   | string | null: false |

### association
* has_many :items
* has_many :comments

## Items_table (住所やカード番号といった個人情報などは書かない！)

| column        | type         | option            |
| ============  | ============ | ================= |
| item_price    | string       | null false        |
| item_name     | string       | null false        |
| user          | references   | foreign_key: true |
| item_category | string       | null false        |
| item_comment  | text         | null false        |
| item_condition| string       | null false        |

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

| column        | type          | option     |
| ============= | ============= | ===========|
| user_domicile | references    | null false |
| user_card     | references    | null false |

### association
belongs_to : buy
