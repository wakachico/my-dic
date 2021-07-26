class AdoptionsController < ApplicationController
  def create
    @word = Word.find(params[:word_id])
    current_user.adoption(@word)
    Word.create({
      important: @word.important, 
      name: @word.name, 
      pos_id: @word.pos_id, 
      meaning: @word.meaning, 
      genre_id: @word.genre_id, 
      text: @word.text, 
      publish: @word.publish,
      user_id: current_user.id
      })
    @user = current_user
    @words = @user.words
    redirect_to user_path(current_user.id)
  end

  def destroy
    @word = Word.find(params[:word_id])
    current_user.unadoption(@word)
    redirect_to root_path
  end

end
