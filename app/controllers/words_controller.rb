class WordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @words = Word.where(publish: true)
  end

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

  def search_mydic
    @words = Word.search_mydic(params[:keyword], params[:condition], params[:category], params[:id])
    @user = User.find(params[:id])
    render "users/show"
  end

  def search_index
    @words = Word.search_index(params[:keyword], params[:condition], params[:category])
    render :index
  end

  private
  def word_params
    params.require(:word).permit(:important, :name, :pos_id, :meaning, :genre_id, :text, :publish).merge(user_id: current_user.id)
  end
end
