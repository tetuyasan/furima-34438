
## ふりま34438のDB設計書


## ユーザーテーブル

| column     | type   | option      |
| ========== |======= | =========== |
| name       | string | null: false |
| email      | string | null: false |
| pass_Word  | string | null: false |
| birthday   | string | null: false |

### association
* has_many :items
* has_many :comments

## アイテムテーブル (住所やカード番号といった個人情報などは書かない！)

| column        | type         | option            |
| ============  | ============ | ================= |
| item_price    | string       | null false        |
| item_name     | string       | null false        |
| user          | references   | foreign_key: true |
| item_category | string       | null false        |
| item_comment  | text         | null false        |

### association
* belongs_to :user
* has_many :comments


## コメントテーブル

| column   | type   | option      |
| =======  | =====  | ============|
| text     | text   | null: false |

### association
* belongs_to :items
* belongs_to :user

## 購入テーブル (親)

| column  | type         | option            |
| ======= | =============| ================= |
| user    | references   | foreign_key: true |

### association
has_one :send

## 配送先テーブル (子)

| column  | type         | option            |
| ======= | =============| ================= |
| user    | references   | foreign_key: true |

### association
belongs_to : buy
