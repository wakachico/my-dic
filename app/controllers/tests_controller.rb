class TestsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update, :result]

  def show
    @words = Word.questions(current_user.id)
    @test = Test.create(test_params)
    @test.update(start_time: @test.created_at)
    @answers = @words.map do |word| 
      Answer.create(
        test_id: @test.id,
        word_id: word.id,
        word_answer: "",
        score: 0,
      )
    end
  end

  def update
    @test = Test.find(params[:id])
    i = 1
    params[:answers].each do |answer| 
      update_answer_id = (@test.id - 1 ) * 5 + i  #ローカル環境用
      # update_answer_id = ( ( ( @test.id - 5 ) / 10 ) * 5 - 1 + i ) * 10 + 5 #本番環境用
      update_answer = Answer.find(update_answer_id)
      update_answer.update(score: answer[:score])
      i += 1
    end
    @user = current_user
    @words = @user.words.order("created_at DESC")
    redirect_to user_path(current_user.id)
  end

  def result
    @test = Test.find(params[:id])
    @answers = @test.answers
    @total_score = 0
    @answers.each do |answer|
      @total_score += answer[:score]
    end
  end

  private
  def test_params
    params.require(:test).permit(:type_id,:start_time).merge(user_id: current_user.id)
  end

end
