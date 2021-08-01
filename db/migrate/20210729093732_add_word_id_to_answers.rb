class AddWordIdToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :word, foreign_key: true
  end
end
