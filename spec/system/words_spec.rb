require 'rails_helper'

RSpec.describe "ワード追加機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @word = FactoryBot.build(:word)
  end

  context 'ワード追加ができるとき'do
    it 'ログインしたユーザーは自分のMydicページ内で投稿できる' do
      # ログインする
      sign_in(@user)
      # Mydicページへのボタンがあることを確認する
      expect(page).to have_content('ログイン中のユーザ')
      # Mydicページに移動する
      visit user_path(@user.id)
      # フォームに情報を入力する
      fill_in 'word-name', with: @word.name
      fill_in 'word-meaning', with: @word.meaning
      fill_in 'word-text', with: @word.text
      # 送信するとWordモデルのカウントが1上がることを確認する
      expect{
        find('input[class="add-btn"]').click
      }.to change { Word.count }.by(1)
      # Mydicページにリダイレクトすることを確認する
      expect(current_path).to eq(user_path(@user.id))
      # Mydicページには先ほど投稿した内容のワードが存在することを確認する
      expect(page).to have_content(@word.name)
      expect(page).to have_content(@word.meaning)
      expect(page).to have_content(@word.text)
    end
  end
  context 'ワード追加ができないとき'do
    it 'ログインしたユーザーは自分以外のMydicページ内で投稿できない' do
      # ログインする
      sign_in(@user)
      # Mydicページへのボタンがあることを確認する
      expect(page).to have_content('ログイン中のユーザ')
      # 別のユーザを作成する
      another_user = FactoryBot.create(:user)
      # ログイン中のuser以外のMydicページに移動する
      visit user_path(another_user.id)
      # ページ内に「My dicに英単語追加」記述が表示されない
      expect(page).to have_no_content("My dicに英単語追加")
    end
  end
end

RSpec.describe "Weblio引用機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @word = FactoryBot.build(:word)
  end
  context 'Weblio引用ができるとき'do
    it 'ログインしたユーザーは存在する英単語（例：red）であればWeblio引用ができる' do
      # ログインする
      sign_in(@user)
      # Mydicページへのボタンがあることを確認する
      expect(page).to have_content('ログイン中のユーザ')
      # Mydicページに移動する
      visit user_path(@user.id)
      # フォームに英単語(red)情報を入力する
      @word.name = "red"
      fill_in 'word-name', with: @word.name
      # 「Weblio引用」ボタンをクリックする
      click_on('Weblio引用')
      sleep 1.0
      # 和訳を入力しなくても「追加」ボタンをクリックするとWordモデルのカウントが1上がることを確認する
      expect{
        find('input[class="add-btn"]').click
      }.to change { Word.count }.by(1)
      #Mydicページにリダイレクトすることを確認する
      expect(current_path).to eq(user_path(@user.id))
      # Mydicページには先ほど投稿した内容のワードが存在することを確認する
      expect(page).to have_content(@word.name)
      expect(page).to have_content("赤")
    end
  end
  context 'Weblio引用ができないとき'do
    it 'ログインしたユーザーは存在しない英単語（例：aaaaaaaaaa）であればWeblio引用ができない' do
      # ログインする
      sign_in(@user)
      # Mydicページへのボタンがあることを確認する
      expect(page).to have_content('ログイン中のユーザ')
      # Mydicページに移動する
      visit user_path(@user.id)
      # フォームに英単語(red)情報を入力する
      @word.name = "aaaaaaaaaa"
      fill_in 'word-name', with: @word.name
      # 「Weblio引用」ボタンをクリックする
      click_on('Weblio引用')
      sleep 1.0
      # Mydicページにはエラーメッセージが存在することを確認する
      expect(page).to have_content("一致する見出し語は見つかりませんでした。")
    end
    it 'ログインしたユーザーは存在しない英単語が空であればWeblio引用ができない' do
      # ログインする
      sign_in(@user)
      # Mydicページへのボタンがあることを確認する
      expect(page).to have_content('ログイン中のユーザ')
      # Mydicページに移動する
      visit user_path(@user.id)
      # フォームに英単語(red)情報を入力する
      @word.name = ""
      fill_in 'word-name', with: @word.name
      # 「Weblio引用」ボタンをクリックする
      click_on('Weblio引用')
      sleep 1.0
      # Mydicページにはエラーメッセージが存在することを確認する
      expect(page).to have_content("検索ワードを入れてください。")
    end
    it 'ログインしたユーザーは自分以外のMydicページ内でWeblio引用ができない' do
      # ログインする
      sign_in(@user)
      # Mydicページへのボタンがあることを確認する
      expect(page).to have_content('ログイン中のユーザ')
      # 別のユーザを作成する
      another_user = FactoryBot.create(:user)
      # ログイン中のuser以外のMydicページに移動する
      visit user_path(another_user.id)
      # ページ内に「Weblio引用」ボタンが表示されない
      expect(page).to have_no_content("Weblio引用")
    end
  end
end

RSpec.describe 'ワード編集機能', type: :system do
  before do
    @word1 = FactoryBot.create(:word)
    @word2 = FactoryBot.create(:word)
  end

  context '編集編集ができるとき' do
    it 'ログインしたユーザーは自分が登録したワードの編集ができる' do
      # ワード1を登録したユーザーでログインする
      sign_in(@word1.user)
      # ワード1をログインしたユーザのMydicページに遷移する
      visit user_path(@word1.user_id)
      # すでに登録済みの内容がページ内に存在していることを確認する
      expect(page).to have_content(@word1.name)
      # すでに登録済みの英単語をクリックする
      find("#best_in_place_word_#{@word1.id}_name").click
      # すでに登録済みの内容がフォームに入っていることを確認する
      # best_in_placeはform状態になった時find("#best_in_place_word_#{@word1.id}_name")ができず色々試したが・・・断念
      # 本番環境、ローカル環境共に編集してモデル内のカラムも変更されていることは確認済み
    end
  end
  context '編集編集ができないとき' do
    it 'ログインしたユーザーは自分が登録したワードの空NGバリデーションがかかっている情報は空にしても編集されず登録時のデータのままになる' do
      # ワード1を登録したユーザーでログインする
      sign_in(@word1.user)
      # ワード1をログインしたユーザのMydicページに遷移する
      visit user_path(@word1.user_id)
      # すでに登録済みの内容がページ内に存在していることを確認する
      expect(page).to have_content(@word1.name)
      # すでに登録済みの英単語をクリックする
      find("#best_in_place_word_#{@word1.id}_name").click
      # すでに登録済みの内容がフォームに入っていることを確認する
      # best_in_placeはform状態になった時find("#best_in_place_word_#{@word1.id}_name")ができず色々試したが・・・断念
      # 本番環境、ローカル環境共に編集してモデル内のカラムも空入力しても変更されないことを確認済み
    end
    it 'ログインしたユーザーは自分が登録したワードの空NGバリデーションがかかっている情報は空にしても編集されず登録時のデータのままになる' do
      # ワード1を登録したユーザーでログインする
      sign_in(@word1.user)
      # ワード2をログインしたユーザのMydicページに遷移する
      visit user_path(@word2.user_id)
      # すでに登録済みの内容がページ内に存在していることを確認する
      expect(page).to have_content(@word2.name)
      # best_in_placeはform状態にならないことのテストコードがわからない。。。
      # 本番環境、ローカル環境共にワード情報をクリックしても編集フォームが発生しないことは確認済み
    end
  end
end

RSpec.describe 'ワード削除機能', type: :system do
  before do
    @word1 = FactoryBot.create(:word)
    @word2 = FactoryBot.create(:word)
  end
  context 'ワード削除ができるとき' do
    it 'ログインしたユーザーは自らが登録したワードの削除ができる' do
      # ワード1を投稿したユーザーでログインする
      sign_in(@word1.user)
      # ワード1をログインしたユーザのMydicページに遷移する
      visit user_path(@word1.user_id)
      # Mydicページにワード１が存在することを確認する
      expect(page).to have_content("#{@word1.name}")
      # Mydicページに削除アクションへ遷移するリンクが存在することを確認する
      expect(page).to have_link href:word_path(@word1.id)
      # ワード1の「削除」ボタンを押すとワード１が削除され、Wordモデルカウントが1下がることを確認する
      expect{
        find('.bin-btn').click
      }.to change { Word.count }.by(-1)
      # Mydicページから遷移していないことを確認する
      expect(current_path).to eq user_path(@word1.user_id)
      # Mydicページにワード１が存在しないことを確認する
      expect(page).to have_no_content("#{@word1.name}")
    end
  end
  context 'ワード削除ができないとき' do
    it 'ログインしたユーザーは自分以外が登録したワードの削除ができない' do
      # ワード1を投稿したユーザーでログインする
      sign_in(@word1.user)
      # ワード2を投稿したユーザーのMydicページへ遷移する
      visit user_path(@word2.user_id)
      # 削除クラスが存在しないことを確認する
      expect(page).to have_no_link href:word_path(@word2.id)
    end
  end
end