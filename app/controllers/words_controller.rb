class WordsController < ApplicationController
  def create
    @word = Word.new(word_params)
    if  @word.save
      redirect_to root_path
    else
      render user_path
    end
  end

  private
  def word_params
    params.require(:word).permit(:important, :name, :pos_id, :meaning, :genre_id, :text, :publish).merge(user_id: current_user.id)
  end
end
