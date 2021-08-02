class TestsController < ApplicationController

  def show
    @words = Word.questions(current_user.id)
    @test = Test.create(test_params)
    @answers = @words.map do |word| 
      Answer.create(
        test_id: @test.id,
        word_id: word.id,
        word_answer: "",
        score: 0
      )
    end
  end

  def update
    @test = Test.find(params[:id])
    i = 1
    params[:answers].each do |answer| 
      # update_answer_id = (@test.id - 1 ) * 5 + i
      update_answer_id = ( ( ( @test.id - 5 ) / 10 ) * 5 - 1 + i ) * 10 + 5
      update_answer = Answer.find(update_answer_id)
      update_answer.update(score: answer[:score])
      i += 1
    end
    @user = current_user
    @words = @user.words.order("created_at DESC")
    redirect_to user_path(current_user.id)
  end

  private
  def test_params
    params.require(:test).permit(:type_id).merge(user_id: current_user.id)
  end

end
