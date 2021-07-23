class GoodsController < ApplicationController
  def create
    @word = Word.find(params[:word_id])
    current_user.good(@word)
    redirect_to root_path
  end

  def destroy
    @word = Word.find(params[:word_id])
    current_user.ungood(@word)
    redirect_to root_path
  end
end
