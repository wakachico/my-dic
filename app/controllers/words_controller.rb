class WordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @words = Word.where(publish: true)
    @good = Good.new
  end

  def create
    @word = Word.new(word_params)
    if  @word.save
      redirect_to user_path(current_user.id)
    else
      @user = current_user
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
    @word = Word.new
    @user = User.find(params[:id])
    render "users/show"
  end

  def search_index
    @words = Word.search_index(params[:keyword], params[:condition], params[:category])
    render :index
  end

  def order_mydic
    @words = Word.order_mydic(params[:condition], params[:id])
    @user = User.find(params[:id])
    @word = Word.new
    render "users/show"
  end

  def order_index
    @words = Word.order_index(params[:condition])
    render :index
  end

  def weblio_pull
    lib_url='https://ejje.weblio.jp/content/'.freeze
    xpath="//*[@id=\"summary\"]/div[2]/table/tbody/tr/td[2]".freeze

    if params[:name].blank?
      render json: { error: '※検索ワードを入れてください。' } and return 
      return
    end

    url = URI.encode(lib_url + params[:name])
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html)
    result = doc.xpath(xpath).text
    if result.blank?
      render json: { error: '※一致する見出し語は見つかりませんでした。' } and return  
    else
      render json:{ result: result } 
    end
  end

  private
  def word_params
    params.require(:word).permit(:important, :name, :pos_id, :meaning, :genre_id, :text, :publish).merge(user_id: current_user.id)
  end
end
