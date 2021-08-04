require 'rails_helper'

RSpec.describe "ユーザー新規登録機能", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにログアウト状態でアクセスした時、ログイン画面に遷移するかを確認する
      expect(current_path).to eq(new_user_session_path)
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Nickname', with: @user.nickname
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Nickname', with: ''
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: ''
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザーログインができるとき' do 
    it '正しい情報を入力すればユーザーログインができてトップページに移動する' do
      # 予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
      # トップページに遷移する
      visit root_path
      # ログインしていない場合、サインインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
      # ユーザー情報を入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      # ログインボタンをクリックする
      click_on("ログイン")
      # トップページに遷移していることを確認する
      expect(current_path).to eq(root_path)
    end
  end
  context 'ユーザーログインができないとき' do
    it 'ログインに失敗し、再びサインインページに戻ってくる' do
      # 予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
      # トップページに遷移する
      visit root_path
      # ログインしていない場合、サインインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
      # 誤ったユーザー情報を入力する
      fill_in"Email",with: "test"
      fill_in"Password",with: "test"
      # ログインボタンをクリックする
      click_on("ログイン")
      # サインインページに戻ってきていることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe "ユーザーログアウト機能", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザーログアウトができる' do 
    it 'ログアウトボタン押下でログアウトができてログインページに移動する' do
      # 予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
      # ログインページに遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      # ログインボタンをクリックする
      click_on("ログイン")
      # トップページに遷移していることを確認する
      expect(current_path).to eq(root_path)
      # トップページにログアウトボタンが存在することを確認する
      expect(page).to have_content("ログアウト")
      # ログアウトボタンをクリックする
      click_on("ログアウト")
      # ログインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
