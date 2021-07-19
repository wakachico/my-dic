class WordsController < ApplicationController
  def create
    @word = Word.new(word_params)
    if  @word.save
      redirect_to user_path(current_user.id)
    else
      render "users/show"
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to user_path(current_user.id)
  end

  def update
    @word = Word.find(params[:id])
    if  @word.update(word_params)
      redirect_to user_path(current_user.id)
    else
      render "users/show"
    end
  end

  private
  def word_params
    params.require(:word).permit(:important, :name, :pos_id, :meaning, :genre_id, :text, :publish).merge(user_id: current_user.id)
  end
end
