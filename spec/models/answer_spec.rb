require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @test = FactoryBot.create(:test)
    @word = FactoryBot.create(:word)
    @answer = FactoryBot.build(:answer, test_id: @test.id, word_id: @word.id)
  end

  context 'テストの回答情報の保存ができる場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@answer).to be_valid
    end
    it '回答（word_answer）は空でも保存できること' do
      @answer.word_answer = ""
      expect(@answer).to be_valid
    end
    it '点数（score）は1でも保存できること' do
      @answer.score = 1
      expect(@answer).to be_valid
    end
  end
  context 'テストの回答情報の保存ができない場合' do
    it '点数（score）が2以上だと保存できないこと' do
      @answer.score = 2
      @answer.valid?
      expect(@answer.errors.full_messages).to include("Score must be less than or equal to 1")
    end
    it '点数（score）が少数だと保存できないこと' do
      @answer.score = 0.5
      @answer.valid?
      expect(@answer.errors.full_messages).to include("Score must be an integer")
    end
    it '点数（score）が全角数字だと保存できないこと' do
      @answer.score = "０"
      @answer.valid?
      expect(@answer.errors.full_messages).to include("Score is not a number")
    end
    it 'test_idが紐付いていないと保存できないこと' do
      @answer.test_id = ""
      @answer.valid?
      expect(@answer.errors.full_messages).to include("Test must exist")
    end
    it 'word_idが紐付いていないと保存できないこと' do
      @answer.word_id = ""
      @answer.valid?
      expect(@answer.errors.full_messages).to include("Word must exist")
    end
  end
end
