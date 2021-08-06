# アプリケーション名
  **My dic**(マイディク)

# アプリケーション概要
  このアプリケーションは自分だけの英単語辞書を作成しながら、英単語を楽しく学習するための補助アプリです。

### Mydic（自分の辞書）の作成
    基本的要素である「英単語」「和訳」に追加して、自分なりのテキストを付属して保存ができます。
    テキストにはジャンルをつけれるため、例文や語呂、アニメや歌詞などお気に入りのテキストをつけて登録ができます。
    自分のための自分だけの世界に１つだけの辞書を作成する事ができます。
---
### ワードの公開
    お気に入りのテキストを他ユーザーに公開しシェアする事ができます。
    公開ワードはグー（グッド）ができます。
    また、他ユーザーが公開しているワードを自分の辞書に登録できる「採用機能」も搭載しています。
---
### 確認テスト
    Mydicに登録したワードを「和訳テスト」「英単語テスト」の２タイプでテストする事ができます。
    辞書に登録したワードを覚えた！と思ったらテスト機能を使って確認ができます。
    ※テスト機能はMydic内に５件以上登録する必要があります。
---

# URL
https://my-dic.herokuapp.com/


# テスト用アカウント
nickname: testuser1,  e-mail: test1@test.com,  password: 1qasw2

# 制作背景
  - 制作のきっかけとしてはプログラミングを学習し始めて英語力が必要になるため学習のサポートしてくれるアプリを制作しました。
  - アプリの対象者としては「プログラミング初学者」「中高生」です。
  - 「プログラミング初学者」はテキストにメソッドの使用例などを登録する事で学習ペースアップが狙えます。  
  <例>  
  英単語：if ,和訳：もし〜なら  
  ジャンル：例文  
  テキスト:&nbsp;if a == b do  
  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;puts&nbsp;"aとbは同じ値です"  
  &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;end

  - 「中高生」の中で、英単語と和訳だけでは頭に入らないことから英語の勉強に消極的な人がいると考え、何か一つ紐ずくきっかけがあれば学習に興味が出るのではないかと考えました。英単語に対してどのようなジャンルのどんなテキストをつけて登録するかを友人同士で楽しみにしながらシェアすることで英語の勉強のきっかけになればとありがたいです。また、学校の学習で新しく覚えないといけない英単語は全国的にほぼ共通であるため、中高生がこのアプリを利用するときにはアプリ内に同一の単語が多く登録される状態になり、ニーズにあったワードが検索されるのではないかと考えます。
  - 全体を通して基本的にページ遷移を少なくしてMydicページで基本的に解決できるように意識して設計しました。

# 機能紹介
  ## ユーザ新規登録機能
  [![Image from Gyazo](https://i.gyazo.com/9408abcc0b90b492066fe640a6023f73.gif)](https://gyazo.com/9408abcc0b90b492066fe640a6023f73)
  新規登録画面にて「ニックネーム」「メールアドレス」「パスワード」を入力しアカウントを作成します。
  ## ログイン機能
  [![Image from Gyazo](https://i.gyazo.com/8c71d87942cede9c0cfbaf02163ecb87.gif)](https://gyazo.com/8c71d87942cede9c0cfbaf02163ecb87)
  既に登録済みのユーザはログイン画面にて「メールアドレス」「パスワード」入力しログインします。
  ## Mydicページ
  [![Image from Gyazo](https://i.gyazo.com/057458d65bc2296a9f24db9945ea0d8b.gif)](https://gyazo.com/057458d65bc2296a9f24db9945ea0d8b)
  ログイン後、ヘッダーにある「ログイン中のユーザー」をクリックしMydicページ（マイページ）へ遷移できます。
  ## ワード追加機能
  [![Image from Gyazo](https://i.gyazo.com/6056835e40effd2b130c816875fe7efa.gif)](https://gyazo.com/6056835e40effd2b130c816875fe7efa)
  「My dicに英単語追加」直下の入力フォームに必要項目を記入し「追加」ボタンをクリックしてワードを追加できます。 ※鍵マーク欄をチェックして追加したワードは公開ワードとして他ユーザに公開されます。
  ## Weblio引用機能
  [![Image from Gyazo](https://i.gyazo.com/5dc9b7cda863d94da5054a90a303bff6.gif)](https://gyazo.com/5dc9b7cda863d94da5054a90a303bff6)
  ワード追加時に登録したい英単語を入力後、「Weblio引用」ボタンを押下することで、Weblioに登録されている和訳を入力フォームに引っ張ってこれます。
  ## ワード編集機能
  [![Image from Gyazo](https://i.gyazo.com/519288c67d1615748755bca9e6b86857.gif)](https://gyazo.com/519288c67d1615748755bca9e6b86857)
  登録した一覧情報の上でクリックすると入力フォームが出ます。その中で編集したい情報に変更してEnterを押すことで簡単にワード情報を変更する事ができます。
  ## ワード削除機能
  [![Image from Gyazo](https://i.gyazo.com/0ec5c08c35f66e08a74f5994a8d2a216.gif)](https://gyazo.com/0ec5c08c35f66e08a74f5994a8d2a216)
  ワード情報の右端にあるゴミ箱ボタンをクリックで簡単にワード情報を削除する事ができます。
  ## 公開ワード一覧機能
  [![Image from Gyazo](https://i.gyazo.com/1c7245c3b25bbe5231e3ca2bf8465cc1.gif)](https://gyazo.com/1c7245c3b25bbe5231e3ca2bf8465cc1)
  Mydicページ内の「公開ワード検索」ボタンを押す事で全ユーザーの公開ワード一覧表示ページへ遷移できます。（このページはルートパスです。）
  ## グー（good）機能
  [![Image from Gyazo](https://i.gyazo.com/750e782b027976c3e1d64938c52d5367.gif)](https://gyazo.com/750e782b027976c3e1d64938c52d5367)
  他ユーザーの公開ワードに対して気に入った登録方法があれば「グー（good）」する事ができます。１人１ワードに対して１グーができ、グーされたワードにはいくつグーされたのかが表示されます。
  ## ワード採用機能
  [![Image from Gyazo](https://i.gyazo.com/ceac6d5fcab1824d3f9cc3c288bf3722.gif)](https://gyazo.com/ceac6d5fcab1824d3f9cc3c288bf3722)
  他ユーザーの公開ワードで特に気に入ったワード情報を「採用！」ボタンを押すことでログインユーザーのMydicに追加することができます。
  [![Image from Gyazo](https://i.gyazo.com/30378a9e54d904d723e2b7b6fb57f54d.gif)](https://gyazo.com/30378a9e54d904d723e2b7b6fb57f54d)
  採用されたワードには採用数が加算され表示されています。アプリユーザー内で人気のワードの一つの指標として使用できます。
  ## ワード検索機能
  [![Image from Gyazo](https://i.gyazo.com/13a807b31d8dd766903d58cd97efc184.gif)](https://gyazo.com/13a807b31d8dd766903d58cd97efc184)
  ワード検索フォームに検索したいワードを入力し、条件、範囲を選択した後、「検索」ボタンをクリックすると選択した条件にヒットしたワード情報のみ表示することができます。自分が登録したい英単語が既にある場合は、簡単にその単語に対しての他ユーザーが公開したワードを確認する事ができます。
  ## ワード並び替え機能
  [![Image from Gyazo](https://i.gyazo.com/469811e25c967c7af1a40cc77a987838.gif)](https://gyazo.com/469811e25c967c7af1a40cc77a987838)
  並び替え条件を選択後、「並び替え」ボタンを押すことで一覧表示を並び替える事ができます。グー数や採用数の多い順で並び替えると人気のワードランキングが確認できます。
  ## テスト機能
  [![Image from Gyazo](https://i.gyazo.com/9c35c40c2f7b046c400371b491b1cbb4.gif)](https://gyazo.com/9c35c40c2f7b046c400371b491b1cbb4)
  Mydicページにて英単語を答える「単語テスト」、和訳を答える「和訳テスト」を選択した後、「テストを受ける」ボタンを押したらテスト画面に遷移します。登録しているワードの中からランダムで５件選出して出題されます。英単語を覚えた！と思ったら自分の実力を確かめることができます。
  ## テスト採点機能
  [![Image from Gyazo](https://i.gyazo.com/028da5e2c0551710bc5605b755ae2248.gif)](https://gyazo.com/028da5e2c0551710bc5605b755ae2248)
  テストに答えた時自動で採点してくれます。和訳の場合は数ある和訳の中から選ぶためうまく採点されないことがあるのでその場合は自分で採点結果を変更して登録ができます。５点満点目指して学習を進められます。
  ## テスト結果確認機能
  [![Image from Gyazo](https://i.gyazo.com/5fb0f9512b8a00b868fe9ecea597deff.gif)](https://gyazo.com/5fb0f9512b8a00b868fe9ecea597deff)
  テストを受けた後、Mydicページのサイドバーにあるカレンダーに「●」が追加され、クリックすることでテスト結果画面に遷移しテスト内容を確認する事ができます。また、自分がどの頻度でテストを実施したかがカレンダーにより視覚的に確認する事ができます。

# 実装予定の機能

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
- has_many :adoptions
- has_many :adoption_words, through: :adoptions, source: :word

## words テーブル 

| Column              | Type          | Options                         |
| ------------------- | ------------- | ------------------------------- |
| important           | boolean       | null: false, default: false     |
| name                | string        | null: false                     |
| pos_id              | integer       | null: false                     |
| meaning             | text          | null: false                     |
| genre_id            | integer       | null: false                     |
| text                | text          |                                 |
| publish             | boolean       | null: false, default: false     |
| user                | references    | null: false, foreign_key: true  |
| test                | references    | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_many :answers
- has_many :goods
- has_many :good_users, through: :goods, source: :user
- has_many :adoptions
- has_many :adoption_users, through: :adoptions, source: :user
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

## adoptions テーブル

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
- has_many :answers
- belongs_to_active_hash  :type

## answers テーブル

| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| score        | integer    | null: false                     |
| word_answer  | text       |                                 |
| test         | references | null: false, foreign_key: true  |
| word         | references | null: false, foreign_key: true  |

### Association

- belongs_to :test
- belongs_to :word