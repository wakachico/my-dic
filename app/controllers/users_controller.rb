class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @word = Word.new
    @words = @user.words.order("created_at DESC")
  end
end
