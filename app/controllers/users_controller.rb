class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @word = Word.new
    @words = @user.words.order("created_at DESC")
    @good_words = @user.good_words.order(created_at: :desc).limit(5)
    @adoption_words = @user.adoption_words.order(created_at: :desc).limit(5)
    @test = Test.new
    @tests = Test.where(user_id: current_user.id)
  end
end
