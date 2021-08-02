class AnswersController < ApplicationController
  def create
    @test = Test.find(params[:test_id])
    i = 1
    @answers = params[:answers].map do |answer| 
      update_answer_id = ( ( @test.id + 5 ) / 10 - 2 + i ) * 10 + 5
      # update_answer_id = (@test.id - 1 ) * 5 + i
      update_answer = Answer.find(update_answer_id)
      update_answer.update(word_answer: answer[:word_answer])
      scoring(update_answer,answer)
      i += 1
      Answer.find(update_answer_id)
    end
    @total_score = 0
    @answers.each do |answer|
      @total_score += answer[:score]
    end
  end

  private
  def scoring(update_answer,answer)
    if @test.type_id == 1 && answer[:word_answer] == update_answer.word.name
      update_answer.update(score: 1)
    elsif @test.type_id == 2 && answer[:word_answer] == update_answer.word.meaning
      update_answer.update(score: 1)
    else
      update_answer.update(score: 0)
    end
  end
end
