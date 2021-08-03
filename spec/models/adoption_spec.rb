require 'rails_helper'

RSpec.describe Adoption, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @word = FactoryBot.create(:word)
    @adoption = FactoryBot.build(:adoption, user_id: @user.id, word_id: @word.id)
  end
  context '採用情報の保存ができる場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@adoption).to be_valid
    end
  end
  context '採用情報の保存ができない場合' do
    it 'user_idが紐付いていないと保存できないこと' do
      @adoption.user_id = ""
      @adoption.valid?
      expect(@adoption.errors.full_messages).to include("User must exist")
    end
    it 'word_idが紐付いていないと保存できないこと' do
      @adoption.word_id = ""
      @adoption.valid?
      expect(@adoption.errors.full_messages).to include("Word must exist")
    end
    it '重複するuser_idとword_idペアは保存できないこと' do
      @adoption.save
      another_adoption = FactoryBot.build(:adoption)
      another_adoption.user_id = @adoption.user_id
      another_adoption.word_id = @adoption.word_id
      another_adoption.valid?
      expect(another_adoption.errors.full_messages).to include("Word has already been taken")
    end
  end
end
