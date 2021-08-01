class RemoveScoreIdFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :score_id, :integer
  end
end
