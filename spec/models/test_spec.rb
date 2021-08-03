require 'rails_helper'

RSpec.describe Test, type: :model do
  before do
    @test = FactoryBot.build(:test)
  end

  describe 'テスト情報の保存' do
    context 'テスト情報が保存できる場合' do
      it 'テストの種類（type_id）があればテスト情報が保存できる' do
        expect(@test).to be_valid
      end
      it 'simple_calendar用カラム(start_time)が空でもテスト情報が保存できる' do
        @test.start_time = ""
        @test.valid?
        expect(@test).to be_valid
      end
    end
    context 'テスト情報が保存でない場合' do
      it 'テストの種類（type_id）が空ではテスト情報が保存でない' do
        @test.type_id = ""
        @test.valid?
        expect(@test.errors.full_messages).to include("Type can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @test.user = nil
        @test.valid?
        expect(@test.errors.full_messages).to include("User must exist")
      end
    end
  end

end
