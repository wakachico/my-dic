class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @word = Word.new
    @words = @user.words
  end
end
