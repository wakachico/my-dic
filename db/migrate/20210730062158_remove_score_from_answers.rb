class RemoveScoreFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :score, :integer
  end
end
