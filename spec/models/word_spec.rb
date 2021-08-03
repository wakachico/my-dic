require 'rails_helper'

RSpec.describe Word, type: :model do
  before do
    @word = FactoryBot.build(:word)
  end

  describe '英単語情報の保存' do
    context '英単語情報が保存できる場合' do
      it 'Wordsテーブル内の全てのカラム(important,name,pos_id,meaning,genre_id,text,publish)があれば英単語情報が保存できる' do
        expect(@word).to be_valid
      end
      it '重要ワード(important)がfalseでも英単語情報が保存できる' do
        @word.important = false
        @word.valid?
        expect(@word).to be_valid
      end
      it 'テキスト(text)が空でも英単語情報が保存できる' do
        @word.text = ""
        expect(@word).to be_valid
      end
      it 'ワード公開（publish）がfalseでも英単語情報が保存できる' do
        @word.publish = false
        expect(@word).to be_valid
      end
    end
    context '英単語情報が保存でない場合' do
      it '英単語（name）が空では英単語情報が保存でない' do
        @word.name = ""
        @word.valid?
        expect(@word.errors.full_messages).to include("Name can't be blank")
      end
      it '品詞（pos_id）が空では英単語情報が保存でない' do
        @word.pos_id = ""
        @word.valid?
        expect(@word.errors.full_messages).to include("Pos can't be blank")
      end
      it '和訳（meaning）が空では英単語情報が保存でない' do
        @word.meaning = ""
        @word.valid?
        expect(@word.errors.full_messages).to include("Meaning can't be blank")
      end
      it 'テキストジャンル（genre_id）が空では英単語情報が保存でない' do
        @word.genre_id = ""
        @word.valid?
        expect(@word.errors.full_messages).to include("Genre can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @word.user = nil
        @word.valid?
        expect(@word.errors.full_messages).to include("User must exist")
      end
    end
  end
end
