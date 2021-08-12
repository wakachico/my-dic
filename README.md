# アプリケーション名
  **My dic**(マイディク)

# アプリケーション概要
  このアプリケーションは自分だけの英単語辞書を作成しながら、英単語を楽しく学習するための補助アプリです。

### Mydic（自分の辞書）の作成
    基本的要素である「英単語」「和訳」に加え、自分なりのテキストを付属して保存ができます。
    テキストにはジャンルをつけれるため、例文や語呂、アニメや歌詞など自分に合ったテキストをつけることができます。
    自分のための自分だけの世界に１つだけの辞書を作成する事ができます。
---
### ワードの公開
    お気に入りのテキストを他ユーザーに公開しシェアする事ができます。
    また、公開ワードはグー（グッド）ができ、他ユーザーの公開ワードを自分の辞書にそのまま登録できる「採用機能」も搭載しています。
---
### 確認テスト
    Mydicに登録したワードを「和訳テスト」「英単語テスト」の２タイプでテストする事ができます。
    辞書に登録したワードを覚えた！と思ったらテスト機能を使って確認ができます。
    ※テスト機能はMydic内に５件以上登録する必要があります。
---

# URL
https://my-dic.herokuapp.com/


# テスト用アカウント
- nickname: testuser1,  
e-mail: test1@test.com,  
password: 1qasw2
- nickname: testuser2,  
e-mail: test2@test.com,  
password: 1qasw2

# 制作背景
  - プログラミング学習を進める中で、プログラミングには英語力が必要になると感じ、英単語学習のサポートができるアプリを制作しました。
  - アプリの対象者としては「プログラミング初学者」「中高生」です。
  - 「プログラミング初学者」はテキストにメソッドの使用例などを登録する事で学習ペースアップが狙えます。  
  <例>  
  英単語：if ,和訳：もし〜なら  
  ジャンル：例文  
  テキスト:&nbsp;if a == b do  
  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;puts&nbsp;"aとbは同じ値です"  
  &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;end

  - 私は「中高生」の時、英単語と和訳だけではなかなか覚えられず勉強に消極的になっていました。その時、何か一つ紐ずく仕掛けがあれば学習に興味が出たのではないかと考えました。今の中高生が、このアプリを通して英単語にどんなジャンルのどんなテキストをつけて登録するかを友人同士で楽しみにしながらシェアすることで英語の勉強に向き合うきっかけになり、自分と同じ経験をする人が減れば嬉しいと考えています。
  - 全体を通して基本的にページ遷移を少なくしてMydicページで基本的に解決できるように意識して設計しました。

# 機能紹介
  ## ユーザ新規登録機能
  [![Image from Gyazo](https://i.gyazo.com/67d2eed31c5f66c755a93fec3700bf85.gif)](https://gyazo.com/67d2eed31c5f66c755a93fec3700bf85)
  新規登録画面にて「ニックネーム」「メールアドレス」「パスワード」を入力しアカウントを作成します。
  ## ログイン機能
  [![Image from Gyazo](https://i.gyazo.com/465adb37d2fc57c5f52e7773457f28e3.gif)](https://gyazo.com/465adb37d2fc57c5f52e7773457f28e3)
  既に登録済みのユーザはログイン画面にて「メールアドレス」「パスワード」入力しログインします。
  ## Mydicページ
  [![Image from Gyazo](https://i.gyazo.com/ea4c6c23350b3fb5725ccbd5f86536df.gif)](https://gyazo.com/ea4c6c23350b3fb5725ccbd5f86536df)
  ログイン後、ヘッダーにある「ログイン中のユーザー」をクリックしMydicページ（マイページ）へ遷移できます。
  ## ワード追加機能
  [![Image from Gyazo](https://i.gyazo.com/a4bb85b573064aba8ec9309cf7b8c62e.gif)](https://gyazo.com/a4bb85b573064aba8ec9309cf7b8c62e)
  「My dicに英単語追加」直下の入力フォームに必要項目を記入し「追加」ボタンをクリックしてワードを追加できます。  
  ※鍵マーク欄をチェックして追加したワードは公開ワードとして他ユーザに公開されます。
  ## Weblio引用機能
  [![Image from Gyazo](https://i.gyazo.com/6685e7c032ba0c63404a7883a29c7a57.gif)](https://gyazo.com/6685e7c032ba0c63404a7883a29c7a57)
  [![Image from Gyazo](https://i.gyazo.com/e749773233f0850d3f569952510458ea.png)](https://gyazo.com/e749773233f0850d3f569952510458ea)
  ワード追加時に登録したい英単語を入力後、「Weblio引用」ボタンを押下することで、Weblioに登録されている和訳を入力フォームに引っ張ってこれます。
  ## ワード編集機能
  [![Image from Gyazo](https://i.gyazo.com/176e9e8ba8ae9bda705205f816493941.gif)](https://gyazo.com/176e9e8ba8ae9bda705205f816493941)
  登録した一覧情報の上でクリックすると入力フォームが出ます。その中で編集したい情報に変更してEnterを押すことで簡単にワード情報を変更する事ができます。
  ## ワード削除機能
  [![Image from Gyazo](https://i.gyazo.com/6713162ec89673d63f0e0981efc2db33.gif)](https://gyazo.com/6713162ec89673d63f0e0981efc2db33)
  ワード情報の右端にあるゴミ箱ボタンをクリックで簡単にワード情報を削除する事ができます。
  ## 公開ワード一覧機能
  [![Image from Gyazo](https://i.gyazo.com/7cb8cd55581aab003a28174485f18acb.gif)](https://gyazo.com/7cb8cd55581aab003a28174485f18acb)
  Mydicページ内の「公開ワード検索」ボタンを押す事で全ユーザーの公開ワード一覧表示ページへ遷移できます。  
  ※このページはルートパスです。
  ## グー（good）機能
  [![Image from Gyazo](https://i.gyazo.com/8e53d303407d2b38dd1d6def6dd26368.gif)](https://gyazo.com/8e53d303407d2b38dd1d6def6dd26368)
  他ユーザーの公開ワードに対して気に入った登録方法があれば「グー（good）」する事ができます。１人１ワードに対して１グーができ、グーされたワードにはいくつグーされたのかが表示されます。
  ## ワード採用機能
  [![Image from Gyazo](https://i.gyazo.com/f0c78a3f61eacf89580c6efb33a0fade.gif)](https://gyazo.com/f0c78a3f61eacf89580c6efb33a0fade)
  他ユーザーの公開ワードで特に気に入ったワード情報を「採用！」ボタンを押すことでログインユーザーのMydicに追加することができます。
  [![Image from Gyazo](https://i.gyazo.com/7355a604bb7bf19a465897e3b4cc9e6d.gif)](https://gyazo.com/7355a604bb7bf19a465897e3b4cc9e6d)
  採用されたワードには採用数が加算され表示されています。アプリユーザー内で人気のワードの一つの指標として使用できます。
  ## ワード検索機能
  [![Image from Gyazo](https://i.gyazo.com/6c2799e77d7e3c0838d5294c50fa4610.gif)](https://gyazo.com/6c2799e77d7e3c0838d5294c50fa4610)
  ワード検索フォームに検索したいワードを入力し、条件、範囲を選択した後、「検索」ボタンをクリックすると選択した条件にヒットしたワード情報のみ表示することができます。自分が登録したい英単語が既にある場合は、簡単にその単語に対しての他ユーザーが公開したワードを確認する事ができます。
  ## ワード並び替え機能
  [![Image from Gyazo](https://i.gyazo.com/c67fa6207817466b94e73cc9a542a6d0.gif)](https://gyazo.com/c67fa6207817466b94e73cc9a542a6d0)
  並び替え条件を選択後、「並び替え」ボタンを押すことで一覧表示を並び替える事ができます。グー数や採用数の多い順で並び替えると人気のワードランキングが確認できます。
  ## テスト機能
  [![Image from Gyazo](https://i.gyazo.com/706f3e9089547cf6accfa4a65ba6a16c.gif)](https://gyazo.com/706f3e9089547cf6accfa4a65ba6a16c)
  Mydicページにて英単語を答える「単語テスト」、和訳を答える「和訳テスト」を選択した後、「テストを受ける」ボタンを押したらテスト画面に遷移します。登録しているワードの中からランダムで５件選出して出題されます。英単語を覚えた！と思ったら自分の実力を確かめることができます。
  ## テスト採点機能
  [![Image from Gyazo](https://i.gyazo.com/028da5e2c0551710bc5605b755ae2248.gif)](https://gyazo.com/028da5e2c0551710bc5605b755ae2248)
  テストに答えた時自動で採点してくれます。採点は登録した情報と回答が同じかで判別するため類義語に対してはうまく採点されないことがあります。その場合は自分で採点結果を変更して登録ができます。５点満点目指して学習を進められます。
  ## テスト結果確認機能
  [![Image from Gyazo](https://i.gyazo.com/4c10f5f83c80050193068ed5251db66a.gif)](https://gyazo.com/4c10f5f83c80050193068ed5251db66a)
  テストを受けた後、Mydicページのサイドバーにあるカレンダーに「●」が追加され、クリックすることでテスト結果画面に遷移しテスト内容を確認する事ができます。また、自分がどの頻度でテストを実施したかがカレンダーにより視覚的に確認する事ができます。

# 実装予定の機能又は課題解決

## テスト問題のランダム取得が重い問題
[![Image from Gyazo](https://i.gyazo.com/b63522e2a7f9aeb32f6aec8ac6aeb635.png)](https://gyazo.com/b63522e2a7f9aeb32f6aec8ac6aeb635)
＜課題＞  
テストの問題用に5問のword情報をランダムで取得する際、上記のコードを採用しているが、wordsテーブルの登録数が増えるだけ重くなる。  
<コードの流れ>  
①ユーザidを引数にquestionsメソッドが起動  
②配列ok_idを空で定義  
③下記の条件を満たすword情報を１件取得しok_idに追加  
&nbsp;&nbsp;条件１.１つのランダム数値をword_idとして取得したときにword情報が存在する（削除されていない）  
&nbsp;&nbsp;条件２.取得したワード情報がログイン中ユーザが登録したwordか  
&nbsp;&nbsp;条件３.取得されたidが重複していないか  
④③の条件を5回繰り返す  
⑤ok_idをword_idに持つword情報を取得  
⑥returnで返す  

＜課題と考える理由＞  
テスト機能はこのアプリの３大機能の一つであり、その機能を使用するときにユーザ重たく感じてしまえば、アプリ利用者が離れてしまう危険性があるため。

＜実装の方向性＞  
上記の②〜⑤の手順を無駄に繰り返さないコードに変更できないかを検討（Gem等がないかも含み探す）

## 並び替えは全数に対して並び替えてしまう問題
[![Image from Gyazo](https://i.gyazo.com/51bcdc84170ac724e251eba0a67dc983.gif)](https://gyazo.com/51bcdc84170ac724e251eba0a67dc983)
＜課題＞  
ワード一覧情報を検索機能を使用し件数を絞った後に、その絞った件数に対して並び替え機能を使用したいが全件に対して並び替え処理を実行してしまう。  

＜課題と考える理由＞  
wordの登録数が少ない内は気にならないが、数が増えると検索機能だけでは件数が絞れないことが予想されるため。  

＜実装の方向性＞  
並び替え処理を行うメソッドに検索した結果を渡すことができる形でコードを変更する。

## ローカル環境と本番環境でコード修正が必要問題
[![Image from Gyazo](https://i.gyazo.com/6b06ee880e75ce038c6c7bf39909e752.png)](https://gyazo.com/6b06ee880e75ce038c6c7bf39909e752)
＜課題＞  
テストの1問ずつの回答（answer）を複数同時にアップデートする際に、アップデート先を指定するコードが本番環境とローカル環境で異なってしまいます。  
※ローカル環境・・・レコードをcreateする際に、idが１から始まり連番で自動生成する。  
&nbsp;&nbsp;本番環境・・・レコードをcreateする際に、idが5から始まり10飛びで自動生成する。  

＜課題と考える理由＞  
①単純に本番環境、ローカル環境でコードを変える手間がかかる。  
②変更忘れによりエラーが生じる可能性がある。  
③可読性が低くなってしまう。

＜実装の方向性＞  
idではなくeachやmapでうまく指定できないか検討する。  

## 採用機能が一度に１ワード情報しかできない問題
[![Image from Gyazo](https://i.gyazo.com/f0c78a3f61eacf89580c6efb33a0fade.gif)](https://gyazo.com/f0c78a3f61eacf89580c6efb33a0fade)
＜課題＞  
採用機能を利用する際、「採用！」ボタンを押すとそのワードだけ登録されてMydicページへ遷移してしまう。  

＜課題と考える理由＞  
(ユーザー目線での要望)知人に実際に使用してもらった際に、複数同時に採用したいときもあると意見をいただいたため。

＜実装の方向性＞  
thの空欄スペースに「まとめて採用」ボタンを作り、そのボタンをクリックするとボタンが「採用！」に変わり、各行の「採用！」の部分がチェックボックスになって複数同時採用機能を実現させる。





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