| --- | --- |
| --- | --- |
| アプリケーション名 | ひとりでできるよ |
| アプリケーション概要 | お子様の日々の目標を見える化し、お子様ご自身が楽しみながら目標を達成していくことをサポートいたします |
| URL　|　デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。
| テスト用アカウント | ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
| 利用方法 | お子様のお名前、育てたい果物、１日の目標を入力しいていただきます。目標を達成するごとに果物の木が育っていき、花を咲かせ、実をつけます。
| 目指した課題解決 | お子様がご自身で目標を達成する力を身につけること、目標を達成することの楽しさを感じていただくことを目指して制作いたしました。
| 洗い出した要件 | 
| ユーザー管理機能 | ・ユーザーを新しく登録できる・ユーザー登録が完了している場合、ログインすることができる・ユーザー登録後にユーザー情報を編集することができる・ログアウトできる
| 目標作成機能 | ・目標を選択、決定できる
・新しい目標を作成、決定できる
・目標の変更、削除、並び替えができる
| 果物成長機能 | ・育てたい果物を選択、決定できる
・育てたい果物を変更、決定できる
・目標を達成するごとに果物が成長する
・果物はある程度成長すると花を咲かせる
・果物はある程度成長すると実をつける
・果物の実をご褒美と交換できる
| 実装した機能についてのGIFと説明 | 実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
| 実装予定の機能      | 洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
| データベース設計    | ER図等を添付しましょう。
| ローカルでの動作方法 | git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

# ひとりでできるよのER図

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |

### Association

- has_many :children

## children テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| honorific_title | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :tree
- has_many :tasks

## tasks テーブル

| Column | Type       | Options                        |
| ------ | -----------| ------------------------------ |
| task   | string     | null: false                    |
| child  | references | null: false, foreign_key: true |

### Association

- belongs_to :child

## trees テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| tree_id | integer    | null: false                    |
| child   | references | null: false, foreign_key: true |

### Association

- belongs_to :child