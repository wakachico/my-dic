class AddScoreIdToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :score_id, :integer
  end
end
