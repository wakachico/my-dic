require 'rails_helper'

RSpec.describe Good, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @word = FactoryBot.create(:word)
    @good = FactoryBot.build(:good, user_id: @user.id, word_id: @word.id)
  end
  context 'グー情報の保存ができる場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@good).to be_valid
    end
  end
  context 'グー情報の保存ができない場合' do
    it 'user_idが紐付いていないと保存できないこと' do
      @good.user_id = ""
      @good.valid?
      expect(@good.errors.full_messages).to include("User must exist")
    end
    it 'word_idが紐付いていないと保存できないこと' do
      @good.word_id = ""
      @good.valid?
      expect(@good.errors.full_messages).to include("Word must exist")
    end
    it '重複するuser_idとword_idペアは保存できないこと' do
      @good.save
      another_good = FactoryBot.build(:good)
      another_good.user_id = @good.user_id
      another_good.word_id = @good.word_id
      another_good.valid?
      expect(another_good.errors.full_messages).to include("Word has already been taken")
    end
  end
end
